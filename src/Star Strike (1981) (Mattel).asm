
        ORG     $5000
.HEADER:
        BIDECLE $5997           ; 5000  Ptr: MOB graphic images
        BIDECLE $5078           ; 5002  Ptr: EXEC timer table
        BIDECLE $5082           ; 5004  Ptr: Start of game
        BIDECLE $519A           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5242           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $01F8,  $01F0,  $01E8,  $01E0   ; 5014   01F8 01F0 01E8 01E0
        DECLE   $01D8,  $01D0,  $01C8,  $01C0   ; 5018   01D8 01D0 01C8 01C0
.TITLE:
        DECLE   $0051                           ; 501C  Cartridge year
        STRING  "STAR STRIKE"                   ; 501D  Title string
        DECLE   $0000                           ; 5028  

.TITLECODE:
        MVI     .PSG0.lft_hand,R0               ; 5029   0280 01FF
        CMPI    #$005A, R0                      ; 502B   0378 005A
        BNEQ    L_503E                          ; 502D   020C 000F

        EIS                                     ; 502F   0002
L_5030:
        MVII    #$00F0, R1                      ; 5030   02B9 00F0
        MVII    #$0200, R4                      ; 5032   02BC 0200
L_5034:
        MVI@    R4,     R0                      ; 5034   02A0
        DECR    R4                              ; 5035   0014
        INCR    R0                              ; 5036   0008
        MVO@    R0,     R4                      ; 5037   0260
        DECR    R1                              ; 5038   0011
        BNEQ    L_5034                          ; 5039   022C 0006

        INCR    R0                              ; 503B   0008
        BC      L_5030                          ; 503C   0221 000D

L_503E:
        MOVR    R7,     R4                      ; 503E   00BC
        ADDI    #$0004, R4                      ; 503F   02FC 0004
        PSHR    R4                              ; 5041   0274
        MOVR    R5,     R7                      ; 5042   00AF

        CMPI    #$0042, R2                      ; 5043   037A 0042
        BNEQ    L_504D                          ; 5045   020C 0006

        MVII    #$0001, R2                      ; 5047   02BA 0001
        MVO     R2,     G_0162                  ; 5049   0242 0162
        B       L_5051                          ; 504B   0200 0004

L_504D:
        CMPI    #$0082, R2                      ; 504D   037A 0082
        BNEQ    L_5052                          ; 504F   020C 0001

L_5051:
        DECR    R0                              ; 5051   0010
L_5052:
        DECR    R0                              ; 5052   0010
        MVO     R0,     G_0161                  ; 5053   0240 0161
        MOVR    R7,     R4                      ; 5055   00BC
        ADDI    #$000A, R4                      ; 5056   02FC 000A
        SLL     R0,     2                       ; 5058   004C
        ADDR    R0,     R4                      ; 5059   00C4
        MVII    #$015D, R5                      ; 505A   02BD 015D
        MVII    #$0004, R1                      ; 505C   02B9 0004
L_505E:
        MVI@    R4,     R0                      ; 505E   02A0
        MVO@    R0,     R5                      ; 505F   0268
        DECR    R1                              ; 5060   0011
        BNEQ    L_505E                          ; 5061   022C 0004
        PULR    R7                              ; 5063   02B7

        DECLE   $0000,  $0001,  $0040,  $0070   ; 5064   0000 0001 0040 0070
        DECLE   $0000,  $0021,  $0040,  $0050   ; 5068   0000 0021 0040 0050
        DECLE   $0001,  $0041,  $0030,  $0033   ; 506C   0001 0041 0030 0033
        DECLE   $0001,  $0081,  $0020,  $0028   ; 5070   0001 0081 0020 0028
        DECLE   $0002,  $0081,  $0010,  $0020   ; 5074   0002 0081 0010 0020
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5078  Timer dispatch/interval
        DECLE   $0081,  $0051,  $0001,  $0000; 507C  Timer dispatch/interval
        BIDECLE $0000           ; 5080  End of timer table

.START:
        PSHR    R5                              ; 5082   0275

        JSR     R5,     L_53E2                  ; 5083   0004 0150 03E2
        JSR     R5,     L_539B                  ; 5086   0004 0150 039B
        DECLE   $00BC,  $02FC,  $00E3,  $02BD   ; 5089   00BC 02FC 00E3 02BD
        DECLE   $0200,  $02BB,  $0005,  $02BA   ; 508D   0200 02BB 0005 02BA
        DECLE   $0004,  $02A0,  $0001,  $03F8   ; 5091   0004 02A0 0001 03F8
        DECLE   $0000,  $001E,  $0268,  $0012   ; 5095   0000 001E 0268 0012
        DECLE   $022C,  $0008,  $02FD,  $0010   ; 5099   022C 0008 02FD 0010
        DECLE   $0013,  $022C,  $000F,  $0001   ; 509D   0013 022C 000F 0001

        MVII    #$0039, R0                      ; 50A1   02B8 0039
        RLC     R1,     1                       ; 50A3   0051
        MVO     R0,     G_0326                  ; 50A4   0240 0326

        JSR     R5,     L_527A                  ; 50A6   0004 0150 027A

        MOVR    R7,     R1                      ; 50A9   00B9
        ADDI    #$00B9, R1                      ; 50AA   02F9 00B9
        MVO     R1,     G_035D                  ; 50AC   0241 035D
        MVII    #$031D, R2                      ; 50AE   02BA 031D
        MOVR    R7,     R1                      ; 50B0   00B9
        ADDI    #$0071, R1                      ; 50B1   02F9 0071

        JSR     R5,     X_INIT_MOB              ; 50B3   0004 0114 02B2

        SDBD                                    ; 50B6   0001
        SUBI    #$0010, R1                      ; 50B7   0339 0010 0000
        MVII    #$033D, R2                      ; 50BA   02BA 033D

        JSR     R5,     X_INIT_MOB              ; 50BC   0004 0114 02B2

        SDBD                                    ; 50BF   0001
        MVII    #$B01C, R0                      ; 50C0   02B8 001C 00B0
        MVO@    R0,     R2                      ; 50C3   0250
        MVII    #$0001, R0                      ; 50C4   02B8 0001

        JSR     R5,     L_535C                  ; 50C6   0004 0150 035C
        JSR     R5,     L_50F3                  ; 50C9   0004 0150 00F3
        DECLE   $0103,  $0004,  $0163,  $0040   ; 50CC   0103 0004 0163 0040
        DECLE   $0164,  $001F,  $01DC,  $004E   ; 50D0   0164 001F 01DC 004E
        DECLE   $01DE,  $0005,  $01DB,  $0014   ; 50D4   01DE 0005 01DB 0014
        DECLE   $0325,  $0000,  $0345,  $0000   ; 50D8   0325 0000 0345 0000
        DECLE   $0165,  $0010,  $0115,  $0002   ; 50DC   0165 0010 0115 0002
        DECLE   $0170,  $0000,  $0171,  $0005   ; 50E0   0170 0000 0171 0005
        DECLE   $0172,  $0005,  $0173,  $0000   ; 50E4   0172 0005 0173 0000
        DECLE   $0184,  $0040,  $01A8,  $0040   ; 50E8   0184 0040 01A8 0040
        DECLE   $0175,  $0040,  $0176,  $0003   ; 50EC   0175 0040 0176 0003
        DECLE   $017B,  $0033,  $0000           ; 50F0   017B 0033 0000
L_50F3:
        MVI@    R5,     R3                      ; 50F3   02AB
        TSTR    R3                              ; 50F4   009B
        BEQ     L_50FB                          ; 50F5   0204 0004

        MVI@    R5,     R0                      ; 50F7   02A8
        MVO@    R0,     R3                      ; 50F8   0258
        B       L_50F3                          ; 50F9   0220 0007

L_50FB:
        MVI     G_0162, R0                      ; 50FB   0280 0162
        TSTR    R0                              ; 50FD   0080
        BEQ     L_5103                          ; 50FE   0204 0003

        JSR     R5,     L_58A0                  ; 5100   0004 0158 00A0

L_5103:
        PULR    R7                              ; 5103   02B7

        DECLE   $0001,  $0038,  $0032,  $0051   ; 5104   0001 0038 0032 0051
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5108   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 510C   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $001F,  $00B0   ; 5110   0001 0000 001F 00B0
        DECLE   $0039,  $0051,  $0000,  $0000   ; 5114   0039 0051 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5118   0000 0000 0000 0000
        DECLE   $0002,  $0000,  $0000,  $0000   ; 511C   0002 0000 0000 0000
        DECLE   $00FF,  $00FF,  $0001,  $0038   ; 5120   00FF 00FF 0001 0038
        DECLE   $0046,  $0051,  $0000,  $0054   ; 5124   0046 0051 0000 0054
        DECLE   $0000,  $0029,  $0000,  $0000   ; 5128   0000 0029 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; 512C   0000 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5130   0000 0000 0000 0000
        DECLE   $003F,  $0055,  $0006,  $0000   ; 5134   003F 0055 0006 0000
        DECLE   $0000,  $0100,  $0000,  $003F   ; 5138   0000 0100 0000 003F
        DECLE   $0055,  $0002,  $0006,  $0006   ; 513C   0055 0002 0006 0006
        DECLE   $00CB,  $0057,  $02CB,  $0057   ; 5140   00CB 0057 02CB 0057
        DECLE   $02CB,  $0157,  $0300,  $0000   ; 5144   02CB 0157 0300 0000
        DECLE   $003F,  $0055,  $0001,  $000C   ; 5148   003F 0055 0001 000C
        DECLE   $0000                           ; 514C   0000
L_514D:
        PSHR    R0                              ; 514D   0270
        SDBD                                    ; 514E   0001
        MVII    #$1906, R0                      ; 514F   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5152   0240 035D
        MVO     R0,     G_01D8                  ; 5154   0240 01D8
        CLRR    R0                              ; 5156   01C0
        MVO     R0,     G_01D3                  ; 5157   0240 01D3
        MVO     R0,     G_0325                  ; 5159   0240 0325
        MVII    #$0001, R0                      ; 515B   02B8 0001
        MVO     R0,     G_01CF                  ; 515D   0240 01CF
        MVO     R0,     G_01D0                  ; 515F   0240 01D0
        PULR    R0                              ; 5161   02B0
        MOVR    R5,     R7                      ; 5162   00AF

        RSWD    R3                              ; 5163   003B
        RLC     R3,     2                       ; 5164   0057
        SLLC    R0,     2                       ; 5165   005C
        RLC     R3,     1                       ; 5166   0053
        SAR     R0,     1                       ; 5167   0068
        RLC     R3,     2                       ; 5168   0057
        MOVR    R6,     R0                      ; 5169   00B0
        SLLC    R0,     1                       ; 516A   0058
        MOVR    R6,     R0                      ; 516B   00B0
        SLLC    R0,     1                       ; 516C   0058
        ANDR    R4,     R0                      ; 516D   01A0
        CMPR    R6,     R0                      ; 516E   0170
        ANDR    R4,     R0                      ; 516F   01A0
        CMPR    R7,     R0                      ; 5170   0178
        ANDR    R4,     R0                      ; 5171   01A0
        ANDR    R4,     R0                      ; 5172   01A0
        ANDR    R0,     R0                      ; 5173   0180
        ANDR    R4,     R0                      ; 5174   01A0
        CMPR    R7,     R0                      ; 5175   0178
        ANDR    R4,     R0                      ; 5176   01A0
        CMPR    R6,     R0                      ; 5177   0170
        ANDR    R1,     R0                      ; 5178   0188
        ANDR    R4,     R0                      ; 5179   01A0
        ANDR    R0,     R0                      ; 517A   0180
        CMPR    R7,     R0                      ; 517B   0178
        ANDR    R2,     R0                      ; 517C   0190
        CMPR    R6,     R0                      ; 517D   0170
        ANDR    R4,     R0                      ; 517E   01A0
        ANDR    R4,     R0                      ; 517F   01A0
        ANDR    R3,     R0                      ; 5180   0198
L_5181:
        PSHR    R5                              ; 5181   0275

        JSR     R5,     L_5971                  ; 5182   0004 0158 0171
        JSR     R5,     L_5879                  ; 5185   0004 0158 0079
        JSR     R5,     L_5442                  ; 5188   0004 0154 0042
        JSR     R5,     L_53C0                  ; 518B   0004 0150 03C0
        JSR     R5,     L_5DC1                  ; 518E   0004 015C 01C1
        JSR     R5,     L_537E                  ; 5191   0004 0150 037E
        JSR     R5,     L_5B59                  ; 5194   0004 0158 0359
        JSR     R5,     .EXEC.4F2               ; 5197   0004 0114 00F2
.GFX_LIST_519A:
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 519A  CART PIC #00
        DECLE   $0002,  $0008,  $0020,  $0080   ; 519E  
        DECLE   $0002,  $0008,  $0020,  $0080   ; 51A2  CART PIC #01
        DECLE   $0080,  $0080,  $0080,  $0080   ; 51A6  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51AA  CART PIC #02
        DECLE   $0002,  $0008,  $0020,  $0080   ; 51AE  
        DECLE   $0002,  $0008,  $0020,  $0080   ; 51B2  CART PIC #03
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51B6  
        DECLE   $0081,  $0082,  $0084,  $0088   ; 51BA  CART PIC #04
        DECLE   $0090,  $00A0,  $00C0,  $007F   ; 51BE  
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 51C2  CART PIC #05
        DECLE   $00FD,  $000F,  $0027,  $0087   ; 51C6  
        DECLE   $0000,  $00F4,  $00DC,  $007C   ; 51CA  CART PIC #06
        DECLE   $00FC,  $00FC,  $00FC,  $00FC   ; 51CE  
        DECLE   $0002,  $0001,  $0004,  $0008   ; 51D2  CART PIC #07
        DECLE   $0010,  $0020,  $0040,  $0080   ; 51D6  
        DECLE   $0006,  $0005,  $0007,  $0008   ; 51DA  CART PIC #08
        DECLE   $0010,  $0020,  $0040,  $0080   ; 51DE  
        DECLE   $0000,  $0040,  $0000,  $0000   ; 51E2  CART PIC #09
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51E6  
        DECLE   $0000,  $0000,  $0004,  $0000   ; 51EA  CART PIC #0A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51EE  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51F2  CART PIC #0B
        DECLE   $0000,  $0002,  $0000,  $0000   ; 51F6  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51FA  CART PIC #0C
        DECLE   $0040,  $0000,  $0000,  $0000   ; 51FE  
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5202  CART PIC #0D
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5206  
        DECLE   $00FC,  $00D8,  $00C8,  $0000   ; 520A  CART PIC #0E
        DECLE   $00D0,  $00E0,  $0060,  $0000   ; 520E  
        DECLE   $0020,  $0000,  $0010,  $0000   ; 5212  CART PIC #0F
        DECLE   $00A2,  $0045,  $0089,  $0006   ; 5216  
        DECLE   $0040,  $00B1,  $009A,  $004A   ; 521A  CART PIC #10
        DECLE   $0051,  $00A0,  $0040,  $0000   ; 521E  
        DECLE   $0030,  $0068,  $0084,  $0088   ; 5222  CART PIC #11
        DECLE   $0050,  $0024,  $000A,  $0004   ; 5226  
        DECLE   $0009,  $0015,  $0009,  $0003   ; 522A  CART PIC #12
        DECLE   $0001,  $0009,  $0021,  $0081   ; 522E  
        DECLE   $0001,  $0083,  $0043,  $0043   ; 5232  CART PIC #13
        DECLE   $008F,  $0017,  $0023,  $0017   ; 5236  
        DECLE   $000F,  $0007,  $000F,  $0037   ; 523A  CART PIC #14
        DECLE   $0047,  $003F,  $000F,  $000F   ; 523E  
.GRAM_INIT_5242:
        DECLE   $0035           ; 5242  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 5243  #00-07:  CART #00-07 ----
        DECLE   $0010           ; 5245  #08   :  CART #08    ----
        DECLE   $0101,  $0006   ; 5246  #09   :  Algo #1
        DECLE   $0101,  $0202   ; 5248  #0A   :  Algo #1
        DECLE   $0239,  $0282   ; 524A  #0B   :  Algo #1
        DECLE   $003F,  $0030   ; 524C  #0C-0C:  GROM #5F-5F ----
        DECLE   $0341,  $00C2   ; 524E  #0D   :  Algo #1
        DECLE   $0301,  $01C2   ; 5250  #0E   :  Algo #1
        DECLE   $001B,  $0048   ; 5252  #0F-0F:  GRAM #0D-0D ---R
        DECLE   $0201,  $03C0   ; 5254  #10-17:  GRAM #00-07 X---
        DECLE   $0211,  $03C0   ; 5256  #18-1F:  GRAM #08-0F X---
        DECLE   $0013,  $0180   ; 5258  #20-23:  CART #09-0C ----
        DECLE   $003F,  $0030   ; 525A  #24-24:  GROM #5F-5F ----
        DECLE   $003F,  $0030   ; 525C  #25-25:  GROM #5F-5F ----
        DECLE   $0279,  $0042   ; 525E  #26   :  Algo #1
        DECLE   $0239,  $0225   ; 5260  #27   :  Algo #2
        DECLE   $02D7,  $02B9   ; 5262  #28   :  Algo #2
        DECLE   $001B,  $0080   ; 5264  #29-2A:  CART #0D-0E ----
        DECLE   $0253,  $0040   ; 5266  #2B-2B:  GRAM #29-29 X---
        DECLE   $024D,  $00C0   ; 5268  #2C-2D:  GRAM #26-27 X---
        DECLE   $001F,  $0280   ; 526A  #2E-33:  CART #0F-14 ----
        DECLE   $0001,  $0010   ; 526C  #34-34:  GROM #00-00 ----

L_526E:
        PSHR    R5                              ; 526E   0275
        MVI     G_0165, R0                      ; 526F   0280 0165
        ADD     G_0166, R0                      ; 5271   02C0 0166
        MVO     R0,     G_0166                  ; 5273   0240 0166
        ANDI    #$0100, R0                      ; 5275   03B8 0100
        BNEQ    L_527B                          ; 5277   020C 0002
        PULR    R7                              ; 5279   02B7

L_527A:
        PSHR    R5                              ; 527A   0275

L_527B:
        JSR     R5,     L_5EF4                  ; 527B   0004 015C 02F4

        MVII    #$0028, R0                      ; 527E   02B8 0028
        SWAP    R0,     1                       ; 5280   0040
        MVI     G_0167, R1                      ; 5281   0281 0167
        INCR    R1                              ; 5283   0009
        ANDI    #$0003, R1                      ; 5284   03B9 0003
        MVO     R1,     G_0167                  ; 5286   0241 0167
        INCR    R1                              ; 5288   0009
        ADDR    R7,     R1                      ; 5289   00F9
        ADD@    R1,     R7                      ; 528A   02CF

        DECLE   $0006,  $000D,  $0004           ; 528B   0006 000D 0004

        INCR    R3                              ; 528E   000B
        XORI    #$0201, R0                      ; 528F   03F8 0201
        MOVR    R7,     R5                      ; 5291   00BD
        ADDI    #$004E, R5                      ; 5292   02FD 004E
        B       L_529B                          ; 5294   0200 0005

        XORI    #$0201, R0                      ; 5296   03F8 0201
        MOVR    R7,     R5                      ; 5298   00BD
        ADDI    #$0085, R5                      ; 5299   02FD 0085
L_529B:
        MVI@    R5,     R1                      ; 529B   02A9
        XORR    R0,     R1                      ; 529C   01C1
        MVO     R1,     .BTAB.64                ; 529D   0241 0264
        DECR    R5                              ; 529F   0015
        MVII    #$025A, R4                      ; 52A0   02BC 025A
        MVII    #$025A, R3                      ; 52A2   02BB 025A
        CLRR    R1                              ; 52A4   01C9
        DECR    R1                              ; 52A5   0011
L_52A6:
        MVII    #$0008, R2                      ; 52A6   02BA 0008
        ADDR    R1,     R2                      ; 52A8   00CA
        ADDI    #$000B, R4                      ; 52A9   02FC 000B
        ADDI    #$001D, R3                      ; 52AB   02FB 001D
L_52AD:
        MVI@    R5,     R1                      ; 52AD   02A9
        XORR    R0,     R1                      ; 52AE   01C1
        MVO@    R1,     R4                      ; 52AF   0261
        ADDI    #$0080, R1                      ; 52B0   02F9 0080
        MVO@    R1,     R3                      ; 52B2   0259
        DECR    R3                              ; 52B3   0013
        DECR    R2                              ; 52B4   0012
        BPL     L_52AD                          ; 52B5   0223 0009

        CMPI    #$026E, R4                      ; 52B7   037C 026E
        BLE     L_52C9                          ; 52B9   0206 000E

        MVO@    R1,     R3                      ; 52BB   0259
        MOVR    R4,     R2                      ; 52BC   00A2
        SUBI    #$0009, R2                      ; 52BD   033A 0009
        MVI@    R2,     R1                      ; 52BF   0291
        DECR    R2                              ; 52C0   0012
        MVO@    R1,     R2                      ; 52C1   0251
        CLRR    R1                              ; 52C2   01C9
        CMPI    #$02E5, R4                      ; 52C3   037C 02E5
        BLT     L_52A6                          ; 52C5   0225 0020
        B       L_52CE                          ; 52C7   0200 0005

L_52C9:
        DECR    R3                              ; 52C9   0013
        INCR    R4                              ; 52CA   000C
        CLRR    R1                              ; 52CB   01C9
        B       L_52A6                          ; 52CC   0220 0027

L_52CE:
        MVII    #$0064, R1                      ; 52CE   02B9 0064
        XORR    R0,     R1                      ; 52D0   01C1
        MVO     R1,     .BTAB.A0                ; 52D1   0241 02A0
        XORI    #$001D, R0                      ; 52D3   03F8 001D
        MVO     R0,     .BTAB.B4                ; 52D5   0240 02B4
        MVI     .BTAB.EF,R1                     ; 52D7   0281 02EF
        SDBD                                    ; 52D9   0001
        ANDI    #$DDFF, R1                      ; 52DA   03B9 00FF 00DD
        MVO     R1,     .BTAB.EF                ; 52DD   0241 02EF
        PULR    R7                              ; 52DF   02B7

        DECLE   $006D,  $006D,  $006D,  $006D   ; 52E0   006D 006D 006D 006D
        DECLE   $006D,  $006D,  $0005,  $020C   ; 52E4   006D 006D 0005 020C
        DECLE   $0265,  $0265,  $0265,  $0265   ; 52E8   0265 0265 0265 0265
        DECLE   $0214,  $021C,  $0064,  $0224   ; 52EC   0214 021C 0064 0224
        DECLE   $024C,  $0064,  $0064,  $0015   ; 52F0   024C 0064 0064 0015
        DECLE   $001D,  $0265,  $0265,  $0055   ; 52F4   001D 0265 0265 0055
        DECLE   $0064,  $0064,  $0015,  $001D   ; 52F8   0064 0064 0015 001D
        DECLE   $0064,  $0064,  $0265,  $0254   ; 52FC   0064 0064 0265 0254
        DECLE   $0265,  $0265,  $0265,  $0064   ; 5300   0265 0265 0265 0064
        DECLE   $0064,  $0064,  $0064,  $0254   ; 5304   0064 0064 0064 0254
        DECLE   $0265,  $0265,  $0265,  $0265   ; 5308   0265 0265 0265 0265
        DECLE   $0064,  $0064,  $0064,  $0055   ; 530C   0064 0064 0064 0055
        DECLE   $0064,  $0064,  $0064,  $0064   ; 5310   0064 0064 0064 0064
        DECLE   $0064,  $0064,  $0064,  $0055   ; 5314   0064 0064 0064 0055
        DECLE   $0064,  $0064,  $0064,  $0064   ; 5318   0064 0064 0064 0064
        DECLE   $0064,  $0064,  $005D,  $005D   ; 531C   0064 0064 005D 005D
        DECLE   $005D,  $005D,  $005D,  $005D   ; 5320   005D 005D 005D 005D
        DECLE   $002D,  $0035,  $026C,  $026C   ; 5324   002D 0035 026C 026C
        DECLE   $026C,  $026C,  $0204,  $001D   ; 5328   026C 026C 0204 001D
        DECLE   $007D,  $023C,  $0274,  $0265   ; 532C   007D 023C 0274 0265
        DECLE   $0265,  $0214,  $021C           ; 5330   0265 0214 021C

        MVO@    R5,     R4                      ; 5333   0265
        SLR     R0,     2                       ; 5334   0064
        SWAP    R1,     2                       ; 5335   0045
        SAR     R1,     2                       ; 5336   006D
        SAR     R1,     2                       ; 5337   006D
        DECR    R5                              ; 5338   0015
        COMR    R5                              ; 5339   001D
        MVO@    R5,     R4                      ; 533A   0265
        MVO@    R5,     R4                      ; 533B   0265
        MVO@    R5,     R4                      ; 533C   0265
        RLC     R1,     2                       ; 533D   0055
        SLR     R0,     2                       ; 533E   0064
        SLR     R0,     2                       ; 533F   0064
        SLR     R0,     2                       ; 5340   0064
        SLR     R0,     2                       ; 5341   0064
        SLR     R0,     2                       ; 5342   0064
        MVO@    R5,     R4                      ; 5343   0265
        MVO@    R5,     R4                      ; 5344   0265
        MVO@    R4,     R2                      ; 5345   0254
        MVO@    R5,     R4                      ; 5346   0265
        MVO@    R5,     R4                      ; 5347   0265
        MVO@    R5,     R4                      ; 5348   0265
        MVO@    R5,     R4                      ; 5349   0265
        SLR     R0,     2                       ; 534A   0064
        SLR     R0,     2                       ; 534B   0064
        MVO@    R5,     R4                      ; 534C   0265
        MVO@    R4,     R2                      ; 534D   0254
        MVO@    R5,     R4                      ; 534E   0265
        MVO@    R5,     R4                      ; 534F   0265
        MVO@    R5,     R4                      ; 5350   0265
        MVO@    R5,     R4                      ; 5351   0265
        MVO@    R5,     R4                      ; 5352   0265
        SLR     R0,     2                       ; 5353   0064
        SLR     R0,     2                       ; 5354   0064
        MVO@    R4,     R2                      ; 5355   0254
        MVO@    R5,     R4                      ; 5356   0265
        MVO@    R5,     R4                      ; 5357   0265
        MVO@    R5,     R4                      ; 5358   0265
        MVO@    R5,     R4                      ; 5359   0265
        MVO@    R5,     R4                      ; 535A   0265
        MVO@    R5,     R4                      ; 535B   0265
L_535C:
        PSHR    R5                              ; 535C   0275
        MOVR    R0,     R1                      ; 535D   0081
        ADDI    #$0003, R0                      ; 535E   02F8 0003

        JSR     R5,     X_POW2                  ; 5360   0004 0114 0345

        AND     G_0324, R0                      ; 5363   0380 0324
        BNEQ    L_537A                          ; 5365   020C 0013

        NEGR    R1                              ; 5367   0021
        ADDI    #$0003, R1                      ; 5368   02F9 0003
        BMI     L_5379                          ; 536A   020B 000D

        MVI     G_0160, R2                      ; 536C   0282 0160
        SLL     R1,     1                       ; 536E   0049
        ADDR    R1,     R7                      ; 536F   00CF

        ADDI    #$0020, R2                      ; 5370   02FA 0020
        ADDI    #$001D, R2                      ; 5372   02FA 001D
        MVO     R2,     G_0168                  ; 5374   0242 0168

        JSR     R5,     .EXEC.60A               ; 5376   0004 0114 020A

L_5379:
        PULR    R7                              ; 5379   02B7

L_537A:
        JSR     R5,     L_598A                  ; 537A   0004 0158 018A

        PULR    R7                              ; 537D   02B7

L_537E:
        PSHR    R5                              ; 537E   0275
        MVI     G_0165, R0                      ; 537F   0280 0165
        TSTR    R0                              ; 5381   0080
        BEQ     L_539A                          ; 5382   0204 0016

        MVI     G_017B, R0                      ; 5384   0280 017B
        CLRR    R1                              ; 5386   01C9
        DECR    R1                              ; 5387   0011
        CMP     G_0168, R0                      ; 5388   0340 0168
        BEQ     L_539A                          ; 538A   0204 000E
        BPL     L_5390                          ; 538C   0203 0002

        ADDI    #$0003, R1                      ; 538E   02F9 0003
L_5390:
        ADDR    R1,     R0                      ; 5390   00C8
        MVO     R0,     G_017B                  ; 5391   0240 017B
        MOVR    R0,     R1                      ; 5393   0081
        SLL     R0,     2                       ; 5394   004C
        ADDR    R0,     R1                      ; 5395   00C1
        SLR     R1,     2                       ; 5396   0065
        SLR     R1,     2                       ; 5397   0065
        MVO     R1,     G_0165                  ; 5398   0241 0165
L_539A:
        PULR    R7                              ; 539A   02B7

L_539B:
        PSHR    R5                              ; 539B   0275
        MVII    #$0200, R2                      ; 539C   02BA 0200

L_539E:
        JSR     R5,     L_53B5                  ; 539E   0004 0150 03B5

        MVO@    R0,     R2                      ; 53A1   0250
        INCR    R2                              ; 53A2   000A
        CMPI    #$0270, R2                      ; 53A3   037A 0270
        BMI     L_539E                          ; 53A5   022B 0008

        SDBD                                    ; 53A7   0001
        MVII    #$1E60, R0                      ; 53A8   02B8 0060 001E
        MVII    #$0213, R3                      ; 53AB   02BB 0213
L_53AD:
        MVO@    R0,     R3                      ; 53AD   0258
        ADDI    #$0014, R3                      ; 53AE   02FB 0014
        CMPI    #$0263, R3                      ; 53B0   037B 0263
        BLE     L_53AD                          ; 53B2   0226 0006
        PULR    R7                              ; 53B4   02B7

L_53B5:
        PSHR    R5                              ; 53B5   0275
        MVII    #$0005, R0                      ; 53B6   02B8 0005

        JSR     R5,     X_RAND1                 ; 53B8   0004 0114 027D

        SDBD                                    ; 53BB   0001
        XORI    #$0900, R0                      ; 53BC   03F8 0000 0009
        PULR    R7                              ; 53BF   02B7

L_53C0:
        PSHR    R5                              ; 53C0   0275
L_53C1:
        MVII    #$0200, R2                      ; 53C1   02BA 0200
        MVII    #$0018, R0                      ; 53C3   02B8 0018

        JSR     R5,     X_RAND2                 ; 53C5   0004 0114 029E

        ADDR    R0,     R2                      ; 53C8   00C2
        MVII    #$0003, R0                      ; 53C9   02B8 0003

        JSR     R5,     X_RAND1                 ; 53CB   0004 0114 027D

        SDBD                                    ; 53CE   0001
        MVII    #$0800, R3                      ; 53CF   02BB 0000 0008
        XORR    R3,     R0                      ; 53D2   01D8
L_53D3:
        MVI@    R2,     R1                      ; 53D3   0291
        XORR    R3,     R1                      ; 53D4   01D9
        CMPI    #$01FF, R1                      ; 53D5   0379 01FF
        BPL     L_53DB                          ; 53D7   0203 0002

        XORR    R0,     R1                      ; 53D9   01C1
        MVO@    R1,     R2                      ; 53DA   0251
L_53DB:
        ADDI    #$0018, R2                      ; 53DB   02FA 0018
        CMPI    #$02EF, R2                      ; 53DD   037A 02EF
        BMI     L_53D3                          ; 53DF   022B 000D
        PULR    R7                              ; 53E1   02B7

L_53E2:
        MVII    #$0100, R4                      ; 53E2   02BC 0100
        SDBD                                    ; 53E4   0001
        MVI@    R4,     R0                      ; 53E5   02A0
        SDBD                                    ; 53E6   0001
        CMPI    #$712E, R0                      ; 53E7   0378 002E 0071
        BNEQ    L_53F0                          ; 53EA   020C 0004

        SDBD                                    ; 53EC   0001
        MVII    #$1126, R0                      ; 53ED   02B8 0026 0011
L_53F0:
        MVO     R0,     G_0169                  ; 53F0   0240 0169
        SWAP    R0,     1                       ; 53F2   0040
        MVO     R0,     G_016A                  ; 53F3   0240 016A
        SDBD                                    ; 53F5   0001
        MVII    #$003F, R0                      ; 53F6   02B8 003F 0000
        MVO     R0,     G_016B                  ; 53F9   0240 016B
        SDBD                                    ; 53FB   0001
        MVII    #$0054, R0                      ; 53FC   02B8 0054 0000
        MVO     R0,     G_016C                  ; 53FF   0240 016C
        SDBD                                    ; 5401   0001
        MVII    #$000E, R0                      ; 5402   02B8 000E 0000
        SDBD                                    ; 5405   0001
        MVII    #$0054, R1                      ; 5406   02B9 0054 0000
        MVO     R0,     .ISRVEC.0               ; 5409   0240 0100
        MVO     R1,     .ISRVEC.1               ; 540B   0241 0101
        MOVR    R5,     R7                      ; 540D   00AF

        PSHR    R5                              ; 540E   0275

        JSR     R5,     L_5B7D                  ; 540F   0004 0158 037D

        MVI     G_0102, R0                      ; 5412   0280 0102
        CMPI    #$0004, R0                      ; 5414   0378 0004
        BNEQ    L_5434                          ; 5416   020C 001C

        MVII    #$016B, R4                      ; 5418   02BC 016B
        MOVR    R7,     R5                      ; 541A   00BD
        ADDI    #$0004, R5                      ; 541B   02FD 0004
        SDBD                                    ; 541D   0001
        MVI@    R4,     R7                      ; 541E   02A7

        SDBD                                    ; 541F   0001
        MVII    #$003F, R0                      ; 5420   02B8 003F 0000
        MVO     R0,     G_016B                  ; 5423   0240 016B
        SDBD                                    ; 5425   0001
        MVII    #$0054, R0                      ; 5426   02B8 0054 0000
        MVO     R0,     G_016C                  ; 5429   0240 016C
        MVII    #$0003, R0                      ; 542B   02B8 0003
        MVO     R0,     G_0102                  ; 542D   0240 0102

        JSR     R5,     X_PLAY_NOTE             ; 542F   0004 0118 02BD

        B       L_543B                          ; 5432   0200 0007

L_5434:
        MOVR    R7,     R5                      ; 5434   00BD
        ADDI    #$0006, R5                      ; 5435   02FD 0006
        MVII    #$0169, R4                      ; 5437   02BC 0169
        SDBD                                    ; 5439   0001
        MVI@    R4,     R7                      ; 543A   02A7

L_543B:
        JSR     R5,     L_526E                  ; 543B   0004 0150 026E

        PULR    R7                              ; 543E   02B7

        MVO     R0,     .STIC.VIDEN             ; 543F   0240 0020
        MOVR    R5,     R7                      ; 5441   00AF

L_5442:
        MVI     G_0174, R0                      ; 5442   0280 0174
        DECR    R0                              ; 5444   0010
        MVO     R0,     G_0174                  ; 5445   0240 0174
        BPL     L_546B                          ; 5447   0203 0022

        MVI     G_015E, R0                      ; 5449   0280 015E
        TSTR    R0                              ; 544B   0080
        BEQ     L_546B                          ; 544C   0204 001D

        MVO     R0,     G_0174                  ; 544E   0240 0174
        MVI     G_016D, R0                      ; 5450   0280 016D
        CMPI    #$0008, R0                      ; 5452   0378 0008
        BNEQ    L_545F                          ; 5454   020C 0009

        MVI     G_016F, R0                      ; 5456   0280 016F
        CMPI    #$0002, R0                      ; 5458   0378 0002
        BNEQ    L_545F                          ; 545A   020C 0003

        CLRR    R0                              ; 545C   01C0
        MVO     R0,     G_015E                  ; 545D   0240 015E
L_545F:
        SDBD                                    ; 545F   0001
        MVII    #$006C, R0                      ; 5460   02B8 006C 0000
        SDBD                                    ; 5463   0001
        MVII    #$0054, R1                      ; 5464   02B9 0054 0000
        MVO     R0,     G_016B                  ; 5467   0240 016B
        MVO     R1,     G_016C                  ; 5469   0241 016C
L_546B:
        MOVR    R5,     R7                      ; 546B   00AF

        PSHR    R5                              ; 546C   0275
        MVO     R0,     .STIC.VIDEN             ; 546D   0240 0020
        SDBD                                    ; 546F   0001
        MVII    #$3960, R1                      ; 5470   02B9 0060 0039
        MVII    #$0040, R2                      ; 5473   02BA 0040
        MVII    #$0010, R3                      ; 5475   02BB 0010

        JSR     R5,     L_5486                  ; 5477   0004 0154 0086
        DECLE   $0026,  $0026,  $0026,  $0026   ; 547A   0026 0026 0026 0026
        DECLE   $0026,  $0026,  $0026,  $0026   ; 547E   0026 0026 0026 0026
        DECLE   $0026,  $0026,  $0026,  $0000   ; 5482   0026 0026 0026 0000
L_5486:
        MVI@    R1,     R0                      ; 5486   0288
        SUBR    R2,     R1                      ; 5487   0111
        RRC     R0,     1                       ; 5488   0070
        MVI@    R1,     R0                      ; 5489   0288
        SWAP    R0,     1                       ; 548A   0040
        RRC     R0,     1                       ; 548B   0070
        SWAP    R0,     1                       ; 548C   0040
        MVO@    R0,     R1                      ; 548D   0248
        ADDR    R3,     R1                      ; 548E   00D9
        RLC     R0,     1                       ; 548F   0050
        MVI@    R1,     R0                      ; 5490   0288
        SWAP    R0,     1                       ; 5491   0040
        RRC     R0,     1                       ; 5492   0070
        SWAP    R0,     1                       ; 5493   0040
        MVO@    R0,     R1                      ; 5494   0248
        ADDR    R3,     R1                      ; 5495   00D9
        RLC     R0,     1                       ; 5496   0050
        MVI@    R1,     R0                      ; 5497   0288
        SWAP    R0,     1                       ; 5498   0040
        RRC     R0,     1                       ; 5499   0070
        SWAP    R0,     1                       ; 549A   0040
        MVO@    R0,     R1                      ; 549B   0248
        ADDR    R3,     R1                      ; 549C   00D9
        RLC     R0,     1                       ; 549D   0050
        MVI@    R1,     R0                      ; 549E   0288
        SWAP    R0,     1                       ; 549F   0040
        RRC     R0,     1                       ; 54A0   0070
        SWAP    R0,     1                       ; 54A1   0040
        MVO@    R0,     R1                      ; 54A2   0248
        ADDR    R3,     R1                      ; 54A3   00D9
        RLC     R0,     1                       ; 54A4   0050
        MVI@    R1,     R0                      ; 54A5   0288
        SWAP    R0,     1                       ; 54A6   0040
        RRC     R0,     1                       ; 54A7   0070
        SWAP    R0,     1                       ; 54A8   0040
        MVO@    R0,     R1                      ; 54A9   0248
        INCR    R1                              ; 54AA   0009
        SUB@    R5,     R7                      ; 54AB   032F

        JSR     R5,     L_54C8                  ; 54AC   0004 0154 00C8

        MVI     G_016F, R2                      ; 54AF   0282 016F
        ADDI    #$0002, R2                      ; 54B1   02FA 0002
        CMPI    #$0010, R2                      ; 54B3   037A 0010
        BNEQ    L_54C5                          ; 54B5   020C 000E

        CLRR    R2                              ; 54B7   01D2
        MVI     G_016D, R1                      ; 54B8   0281 016D
        INCR    R1                              ; 54BA   0009
        MVO     R1,     G_016D                  ; 54BB   0241 016D
L_54BD:
        SUBI    #$0005, R1                      ; 54BD   0339 0005
        BPL     L_54BD                          ; 54BF   0223 0003

        ADDI    #$0005, R1                      ; 54C1   02F9 0005
        MVO     R1,     G_016E                  ; 54C3   0241 016E
L_54C5:
        MVO     R2,     G_016F                  ; 54C5   0242 016F
        PULR    R7                              ; 54C7   02B7

L_54C8:
        PSHR    R5                              ; 54C8   0275
        MVI     G_016D, R3                      ; 54C9   0283 016D
        MVI     G_016E, R0                      ; 54CB   0280 016E
        SLL     R0,     2                       ; 54CD   004C
        SLL     R0,     2                       ; 54CE   004C
        SDBD                                    ; 54CF   0001
        XORI    #$3A00, R0                      ; 54D0   03F8 0000 003A
        ADD     G_016F, R7                      ; 54D3   02C7 016F
        B       L_54E5                          ; 54D5   0200 000E
        B       L_54ED                          ; 54D7   0200 0014
        B       L_54EE                          ; 54D9   0200 0013
        B       L_54FC                          ; 54DB   0200 001F
        B       L_550F                          ; 54DD   0200 0030
        B       L_5517                          ; 54DF   0200 0036
        B       L_54ED                          ; 54E1   0200 000A
        B       L_5526                          ; 54E3   0200 0041

L_54E5:
        SDBD                                    ; 54E5   0001
        ADDI    #$0120, R0                      ; 54E6   02F8 0020 0001
        ADDI    #$0204, R3                      ; 54E9   02FB 0204
        MVO@    R0,     R3                      ; 54EB   0258
        PULR    R7                              ; 54EC   02B7
L_54ED:
        PULR    R7                              ; 54ED   02B7

L_54EE:
        DECR    R3                              ; 54EE   0013
        BPL     L_54F5                          ; 54EF   0203 0004

        SDBD                                    ; 54F1   0001
        SUBI    #$0090, R3                      ; 54F2   033B 0090 0000
L_54F5:
        ADDI    #$0204, R3                      ; 54F5   02FB 0204
        MVI@    R3,     R0                      ; 54F7   0298
        XORI    #$0005, R0                      ; 54F8   03F8 0005
        MVO@    R0,     R3                      ; 54FA   0258
        PULR    R7                              ; 54FB   02B7

L_54FC:
        SUBI    #$0004, R3                      ; 54FC   033B 0004
        BMI     L_54ED                          ; 54FE   022B 0012

        ADDI    #$0218, R3                      ; 5500   02FB 0218
        MVII    #$0003, R0                      ; 5502   02B8 0003

        JSR     R5,     X_RAND2                 ; 5504   0004 0114 029E

        SLL     R0,     2                       ; 5507   004C
        SLL     R0,     1                       ; 5508   0048
        SDBD                                    ; 5509   0001
        ADDI    #$0900, R0                      ; 550A   02F8 0000 0009
        MVO@    R0,     R3                      ; 550D   0258
        PULR    R7                              ; 550E   02B7

L_550F:
        SDBD                                    ; 550F   0001
        ADDI    #$0128, R0                      ; 5510   02F8 0028 0001
        ADDI    #$0218, R3                      ; 5513   02FB 0218
        MVO@    R0,     R3                      ; 5515   0258
        PULR    R7                              ; 5516   02B7

L_5517:
        SUBI    #$0003, R3                      ; 5517   033B 0003
        BPL     L_551F                          ; 5519   0203 0004

        SDBD                                    ; 551B   0001
        SUBI    #$0090, R3                      ; 551C   033B 0090 0000
L_551F:
        ADDI    #$0204, R3                      ; 551F   02FB 0204
        MVI@    R3,     R0                      ; 5521   0298
        XORI    #$0005, R0                      ; 5522   03F8 0005
        MVO@    R0,     R3                      ; 5524   0258
        PULR    R7                              ; 5525   02B7

L_5526:
        SUBI    #$0004, R3                      ; 5526   033B 0004
        BMI     L_5539                          ; 5528   020B 000F

        ADDI    #$0204, R3                      ; 552A   02FB 0204
        MVII    #$0003, R0                      ; 552C   02B8 0003

        JSR     R5,     X_RAND2                 ; 552E   0004 0114 029E

        SLL     R0,     2                       ; 5531   004C
        SLL     R0,     1                       ; 5532   0048
        SDBD                                    ; 5533   0001
        ADDI    #$0900, R0                      ; 5534   02F8 0000 0009
        MVO@    R0,     R3                      ; 5537   0258
        PULR    R7                              ; 5538   02B7

L_5539:
        ADDI    #$0174, R3                      ; 5539   02FB 0174
        MVII    #$00FF, R0                      ; 553B   02B8 00FF
        MVO@    R0,     R3                      ; 553D   0258
        PULR    R7                              ; 553E   02B7

        PSHR    R5                              ; 553F   0275
        MVI@    R1,     R2                      ; 5540   028A
        SDBD                                    ; 5541   0001
        CMPI    #$3007, R2                      ; 5542   037A 0007 0030
        BEQ     L_5587                          ; 5545   0204 0040

        ANDI    #$000B, R2                      ; 5547   03BA 000B
        BEQ     L_56C6                          ; 5549   0204 017B

        CMPI    #$000B, R2                      ; 554B   037A 000B
        BEQ     L_56C6                          ; 554D   0204 0177

        CMPI    #$000A, R2                      ; 554F   037A 000A
        BEQ     L_556D                          ; 5551   0204 001A

        ADDR    R7,     R2                      ; 5553   00FA
        ADD@    R2,     R7                      ; 5554   02D7

        SWAP    R2,     2                       ; 5555   0046
        CMPR    R6,     R2                      ; 5556   0172
        DIS                                     ; 5557   0003
        ADDI    #$0007, R1                      ; 5558   02F9 0007
        MVI@    R1,     R2                      ; 555A   028A
        DECR    R2                              ; 555B   0012
        MVO@    R2,     R1                      ; 555C   024A
        SUBI    #$0007, R1                      ; 555D   0339 0007
        CMPI    #$0325, R1                      ; 555F   0379 0325
        BEQ     L_556A                          ; 5561   0204 0007

        MVI     G_01DC, R3                      ; 5563   0283 01DC
        DECR    R3                              ; 5565   0013
        BMI     L_56C6                          ; 5566   020B 015E
        BEQ     L_556D                          ; 5568   0204 0003

L_556A:
        TSTR    R2                              ; 556A   0092
        BPL     L_5598                          ; 556B   0203 002B

L_556D:
        DECR    R0                              ; 556D   0010
        BNEQ    L_557C                          ; 556E   020C 000C

        SDBD                                    ; 5570   0001
        MVII    #$5163, R0                      ; 5571   02B8 0063 0051
        MVO     R0,     G_035D                  ; 5574   0240 035D
        MVII    #$0010, R0                      ; 5576   02B8 0010
        MVO     R0,     G_011F                  ; 5578   0240 011F
        MVO     R0,     G_0120                  ; 557A   0240 0120
L_557C:
        CLRR    R0                              ; 557C   01C0
        MVO@    R0,     R1                      ; 557D   0248
        ADDI    #$0003, R1                      ; 557E   02F9 0003
        MVO@    R0,     R1                      ; 5580   0248
        ADDI    #$0002, R1                      ; 5581   02F9 0002
        MVII    #$0003, R0                      ; 5583   02B8 0003
        MVO@    R0,     R1                      ; 5585   0248
        PULR    R7                              ; 5586   02B7

L_5587:
        SDBD                                    ; 5587   0001
        MVII    #$B88E, R0                      ; 5588   02B8 008E 00B8
        MVO@    R0,     R1                      ; 558B   0248
        MVII    #$0005, R0                      ; 558C   02B8 0005
        MVO     R0,     G_032A                  ; 558E   0240 032A
        MVII    #$0004, R0                      ; 5590   02B8 0004
        MVO     R0,     G_032B                  ; 5592   0240 032B

        JSR     R5,     L_58EE                  ; 5594   0004 0158 00EE

        PULR    R7                              ; 5597   02B7

L_5598:
        MVII    #$0001, R2                      ; 5598   02BA 0001
        INCR    R7                              ; 559A   000F

        CLRR    R2                              ; 559B   01D2
L_559C:
        PSHR    R2                              ; 559C   0272
        MOVR    R0,     R4                      ; 559D   0084
        SLL     R0,     2                       ; 559E   004C
        SLL     R0,     1                       ; 559F   0048
        ADDR    R0,     R4                      ; 55A0   00C4
        ADDI    #$0175, R4                      ; 55A1   02FC 0175
        MOVR    R4,     R3                      ; 55A3   00A3
        ADDI    #$0006, R3                      ; 55A4   02FB 0006
        CMPI    #$0175, R4                      ; 55A6   037C 0175
        BEQ     L_55E0                          ; 55A8   0204 0036

        MVI@    R3,     R0                      ; 55AA   0298
        NEGR    R0                              ; 55AB   0020
        SDBD                                    ; 55AC   0001
        ADD@    R4,     R0                      ; 55AD   02E0
        SLL     R2,     1                       ; 55AE   004A
        ADDR    R2,     R7                      ; 55AF   00D7

        ADD     G_017B, R0                      ; 55B0   02C0 017B
        BMI     L_55DE                          ; 55B2   020B 002A

        SDBD                                    ; 55B4   0001
        CMPI    #$04A0, R0                      ; 55B5   0378 00A0 0004
        BGE     L_55DE                          ; 55B8   020D 0024

        SUBI    #$0002, R4                      ; 55BA   033C 0002
        MVO@    R0,     R4                      ; 55BC   0260
        SWAP    R0,     1                       ; 55BD   0040
        MVO@    R0,     R4                      ; 55BE   0260
        TSTR    R2                              ; 55BF   0092
        BNEQ    L_55DE                          ; 55C0   020C 001C

        SWAP    R0,     1                       ; 55C2   0040
        CMPI    #$0340, R0                      ; 55C3   0378 0340
        SDBD                                    ; 55C5   0001
        MVII    #$3801, R5                      ; 55C6   02BD 0001 0038
        BGT     L_55CF                          ; 55C9   020E 0004

        SDBD                                    ; 55CB   0001
        MVII    #$3811, R5                      ; 55CC   02BD 0011 0038
L_55CF:
        MVO@    R5,     R1                      ; 55CF   024D
        SWAP    R0,     1                       ; 55D0   0040
        ANDI    #$00FF, R0                      ; 55D1   03B8 00FF
        ADDI    #$0005, R1                      ; 55D3   02F9 0005
        CMPI    #$0003, R0                      ; 55D5   0378 0003
        BLE     L_55DB                          ; 55D7   0206 0002

        MVII    #$0003, R0                      ; 55D9   02B8 0003
L_55DB:
        MVO@    R0,     R1                      ; 55DB   0248
        SUBI    #$0005, R1                      ; 55DC   0339 0005
L_55DE:
        SUBI    #$0002, R4                      ; 55DE   033C 0002
L_55E0:
        SDBD                                    ; 55E0   0001
        MVI@    R4,     R2                      ; 55E1   02A2
        PSHR    R3                              ; 55E2   0273
        MOVR    R2,     R3                      ; 55E3   0093
        ANDI    #$001F, R2                      ; 55E4   03BA 001F
        SLR     R3,     2                       ; 55E6   0067
        SLR     R3,     2                       ; 55E7   0067
        SLR     R3,     1                       ; 55E8   0063
        MOVR    R7,     R5                      ; 55E9   00BD
        ADDI    #$012B, R5                      ; 55EA   02FD 012B
        ADDR    R3,     R5                      ; 55EC   00DD
        MVI@    R5,     R1                      ; 55ED   02A9
        MVI@    R5,     R0                      ; 55EE   02A8
        SUBR    R1,     R0                      ; 55EF   0108
        CLRR    R3                              ; 55F0   01DB
        SARC    R2,     1                       ; 55F1   007A
        BNC     L_55F5                          ; 55F2   0209 0001

L_55F4:
        ADDR    R0,     R3                      ; 55F4   00C3
L_55F5:
        SLL     R0,     1                       ; 55F5   0048
        SARC    R2,     1                       ; 55F6   007A
        BC      L_55F4                          ; 55F7   0221 0004
        BNEQ    L_55F5                          ; 55F9   022C 0005

        SLR     R3,     2                       ; 55FB   0067
        SLR     R3,     2                       ; 55FC   0067
        SLR     R3,     1                       ; 55FD   0063
        ADDR    R3,     R1                      ; 55FE   00D9
        INCR    R1                              ; 55FF   0009
        SLR     R1,     1                       ; 5600   0061
        PULR    R3                              ; 5601   02B3
        INCR    R3                              ; 5602   000B

        JSR     R5,     L_56F9                  ; 5603   0004 0154 02F9

        ADDI    #$0054, R0                      ; 5606   02F8 0054
        PULR    R2                              ; 5608   02B2
        PSHR    R2                              ; 5609   0272
        TSTR    R2                              ; 560A   0092
        BNEQ    L_5634                          ; 560B   020C 0027

        TSTR    R0                              ; 560D   0080
        BMI     L_5614                          ; 560E   020B 0004

        CMPI    #$00A8, R0                      ; 5610   0378 00A8
        BLE     L_5634                          ; 5612   0206 0020

L_5614:
        MVI     G_011B, R2                      ; 5614   0282 011B
        ADDI    #$01CD, R2                      ; 5616   02FA 01CD
        MVI@    R2,     R5                      ; 5618   0295
        CMPI    #$0001, R5                      ; 5619   037D 0001
        BNEQ    L_5634                          ; 561B   020C 0017

        MVI     G_01D3, R0                      ; 561D   0280 01D3
        DECR    R0                              ; 561F   0010
        MVO     R0,     G_01D3                  ; 5620   0240 01D3
        INCR    R5                              ; 5622   000D
        MVO@    R5,     R2                      ; 5623   0255
        MVI     G_031B, R1                      ; 5624   0281 031B

        JSR     R5,     .EXEC.7AE               ; 5626   0004 0114 03AE

        ADDI    #$0020, R1                      ; 5629   02F9 0020

        JSR     R5,     .EXEC.7AE               ; 562B   0004 0114 03AE

        MVII    #$0014, R0                      ; 562E   02B8 0014
        MVO     R0,     G_01DB                  ; 5630   0240 01DB
        PULR    R0                              ; 5632   02B0
        PULR    R7                              ; 5633   02B7

L_5634:
        SWAP    R0,     1                       ; 5634   0040
        MVI     G_031B, R2                      ; 5635   0282 031B
        ADDI    #$0002, R2                      ; 5637   02FA 0002
        MVO@    R0,     R2                      ; 5639   0250
        INCR    R3                              ; 563A   000B

        JSR     R5,     L_56F9                  ; 563B   0004 0154 02F9

        ADDI    #$0029, R0                      ; 563E   02F8 0029

        JSR     R5,     X_CLAMP                 ; 5640   0004 0114 0270
        DECLE   $0000                           ; 5643   0000

        SAR     R0,     1                       ; 5644   0068
        SWAP    R0,     1                       ; 5645   0040
        INCR    R2                              ; 5646   000A
        MVO@    R0,     R2                      ; 5647   0250
        SUBI    #$0003, R2                      ; 5648   033A 0003
        PULR    R0                              ; 564A   02B0
        TSTR    R0                              ; 564B   0080
        BNEQ    L_56A5                          ; 564C   020C 0057

        PSHR    R1                              ; 564E   0271
        SUBI    #$0004, R4                      ; 564F   033C 0004
        SDBD                                    ; 5651   0001
        MVI@    R4,     R5                      ; 5652   02A5
        SDBD                                    ; 5653   0001
        MVI@    R4,     R1                      ; 5654   02A1
        TSTR    R5                              ; 5655   00AD
        BPL     L_5659                          ; 5656   0203 0001

        NEGR    R5                              ; 5658   0025
L_5659:
        CMPI    #$0300, R5                      ; 5659   037D 0300
        BGT     L_565F                          ; 565B   020E 0002

        ADDI    #$0200, R0                      ; 565D   02F8 0200
L_565F:
        ADDI    #$0140, R0                      ; 565F   02F8 0140
        ADDI    #$0022, R4                      ; 5661   02FC 0022
        MVO@    R0,     R4                      ; 5663   0260
        SWAP    R0,     1                       ; 5664   0040
        MVO@    R0,     R4                      ; 5665   0260
        SWAP    R0,     1                       ; 5666   0040
        CMPR    R1,     R0                      ; 5667   0148
        PULR    R1                              ; 5668   02B1
        BGE     L_568C                          ; 5669   020D 0021

        MOVR    R2,     R1                      ; 566B   0091
        MVI     G_011B, R0                      ; 566C   0280 011B
        TSTR    R0                              ; 566E   0080
        BNEQ    L_5685                          ; 566F   020C 0014

        JSR     R5,     L_514D                  ; 5671   0004 0150 014D

        MVII    #$0001, R2                      ; 5674   02BA 0001
        AND     G_015E, R2                      ; 5676   0382 015E
        MVO     R2,     G_015E                  ; 5678   0242 015E
        MVII    #$00F8, R2                      ; 567A   02BA 00F8
        MVO     R2,     G_0168                  ; 567C   0242 0168
        MVII    #$0004, R0                      ; 567E   02B8 0004

        JSR     R5,     X_CLR_BIT               ; 5680   0004 0114 02E6

        SUB@    R4,     R4                      ; 5683   0324
        CLRR    R0                              ; 5684   01C0

L_5685:
        JSR     R5,     L_584C                  ; 5685   0004 0158 004C
        JSR     R5,     L_58EE                  ; 5688   0004 0158 00EE

        PULR    R7                              ; 568B   02B7

L_568C:
        ADDI    #$0002, R2                      ; 568C   02FA 0002
        MVI@    R2,     R0                      ; 568E   0290
        ADDI    #$0020, R2                      ; 568F   02FA 0020
        MVO@    R0,     R2                      ; 5691   0250
        SUBI    #$0002, R4                      ; 5692   033C 0002
        ADDI    #$0024, R3                      ; 5694   02FB 0024

        JSR     R5,     L_56F9                  ; 5696   0004 0154 02F9

        ADDI    #$0029, R0                      ; 5699   02F8 0029

        JSR     R5,     X_CLAMP                 ; 569B   0004 0114 0270
        DECLE   $0000                           ; 569E   0000

        SAR     R0,     1                       ; 569F   0068
        INCR    R2                              ; 56A0   000A
        SWAP    R0,     1                       ; 56A1   0040
        MVO@    R0,     R2                      ; 56A2   0250
        SUBI    #$0023, R2                      ; 56A3   033A 0023
L_56A5:
        ADDI    #$0006, R2                      ; 56A5   02FA 0006
        MVII    #$0001, R0                      ; 56A7   02B8 0001
        MVO@    R0,     R2                      ; 56A9   0250
        MVI     G_011B, R0                      ; 56AA   0280 011B
        TSTR    R0                              ; 56AC   0080
        BNEQ    L_56C6                          ; 56AD   020C 0017

        MVII    #$0177, R4                      ; 56AF   02BC 0177
        SDBD                                    ; 56B1   0001
        MVII    #$074C, R1                      ; 56B2   02B9 004C 0007
        INCR    R7                              ; 56B5   000F

L_56B6:
        CLRR    R2                              ; 56B6   01D2
L_56B7:
        SDBD                                    ; 56B7   0001
        MVI@    R4,     R0                      ; 56B8   02A0

        JSR     R5,     L_5D56                  ; 56B9   0004 015C 0156

        SUBI    #$0002, R4                      ; 56BC   033C 0002
        MVO@    R0,     R4                      ; 56BE   0260
        SWAP    R0,     1                       ; 56BF   0040
        MVO@    R0,     R4                      ; 56C0   0260
        MVII    #$0346, R1                      ; 56C1   02B9 0346
        TSTR    R2                              ; 56C3   0092
        BNEQ    L_56B6                          ; 56C4   022C 000F
L_56C6:
        PULR    R7                              ; 56C6   02B7

        ADDI    #$0005, R1                      ; 56C7   02F9 0005
        MVI@    R1,     R2                      ; 56C9   028A
        ANDI    #$000F, R2                      ; 56CA   03BA 000F
        CMPI    #$0005, R2                      ; 56CC   037A 0005
        BGE     L_56EE                          ; 56CE   020D 001E

        INCR    R1                              ; 56D0   0009
        MVII    #$0006, R2                      ; 56D1   02BA 0006
        MVO@    R2,     R1                      ; 56D3   024A
        SUBI    #$0006, R1                      ; 56D4   0339 0006
        SDBD                                    ; 56D6   0001
        MVII    #$3082, R2                      ; 56D7   02BA 0082 0030
        MVO@    R2,     R1                      ; 56DA   024A
        ADDI    #$0002, R1                      ; 56DB   02F9 0002
        MVII    #$00FC, R2                      ; 56DD   02BA 00FC
        SWAP    R2,     1                       ; 56DF   0042
        MOVR    R2,     R3                      ; 56E0   0093
        ADD@    R1,     R2                      ; 56E1   02CA
        MVO@    R2,     R1                      ; 56E2   024A
        INCR    R1                              ; 56E3   0009
        SAR     R3,     1                       ; 56E4   006B
        ADD@    R1,     R3                      ; 56E5   02CB
        MVO@    R3,     R1                      ; 56E6   024B
        TSTR    R0                              ; 56E7   0080
        BEQ     L_56C6                          ; 56E8   0224 0023

        JSR     R5,     L_588E                  ; 56EA   0004 0158 008E

        PULR    R7                              ; 56ED   02B7

L_56EE:
        SUBI    #$0005, R1                      ; 56EE   0339 0005

        JSR     R5,     .EXEC.7AE               ; 56F0   0004 0114 03AE

        MVI     G_01D3, R0                      ; 56F3   0280 01D3
        DECR    R0                              ; 56F5   0010
        MVO     R0,     G_01D3                  ; 56F6   0240 01D3
        PULR    R7                              ; 56F8   02B7

L_56F9:
        PSHR    R5                              ; 56F9   0275
        PSHR    R2                              ; 56FA   0272
        PSHR    R1                              ; 56FB   0271
        MVI@    R3,     R0                      ; 56FC   0298

        JSR     R5,     X_EXT_SIGN_LO           ; 56FD   0004 0114 0268

        SDBD                                    ; 5700   0001
        ADD@    R4,     R0                      ; 5701   02E0
        SUBI    #$0002, R4                      ; 5702   033C 0002
        MVO@    R0,     R4                      ; 5704   0260
        SWAP    R0,     1                       ; 5705   0040
        MVO@    R0,     R4                      ; 5706   0260
        NOP                                     ; 5707   0034
        SWAP    R0,     1                       ; 5708   0040
        SAR     R0,     2                       ; 5709   006C
        SAR     R0,     2                       ; 570A   006C
        SAR     R1,     2                       ; 570B   006D

        JSR     R5,     X_MPY                   ; 570C   0004 011C 01DC

        SAR     R2,     2                       ; 570F   006E
        SAR     R2,     2                       ; 5710   006E
        MOVR    R2,     R0                      ; 5711   0090
        PULR    R1                              ; 5712   02B1
        PULR    R2                              ; 5713   02B2
        PULR    R7                              ; 5714   02B7

        DECLE   $001B,  $001B,  $001C,  $001D   ; 5715   001B 001B 001C 001D
        DECLE   $001E,  $001F,  $0020,  $0021   ; 5719   001E 001F 0020 0021
        DECLE   $0022,  $0023,  $0024,  $0025   ; 571D   0022 0023 0024 0025
        DECLE   $0027,  $0028,  $002A,  $002C   ; 5721   0027 0028 002A 002C
        DECLE   $002E,  $0030,  $0032,  $0035   ; 5725   002E 0030 0032 0035

        RSWD    R0                              ; 5729   0038
        RSWD    R3                              ; 572A   003B
        RSWD    R6                              ; 572B   003E
        SWAP    R2,     1                       ; 572C   0042
        SWAP    R3,     2                       ; 572D   0047
        SLL     R0,     2                       ; 572E   004C
        RLC     R3,     1                       ; 572F   0053
        SLLC    R2,     1                       ; 5730   005A
        SLR     R2,     1                       ; 5731   0062
        SAR     R1,     2                       ; 5732   006D
        SARC    R2,     1                       ; 5733   007A
        MOVR    R1,     R2                      ; 5734   008A
        MOVR    R4,     R0                      ; 5735   00A0
        MOVR    R7,     R6                      ; 5736   00BE
        ADDR    R5,     R1                      ; 5737   00E9
        SUBR    R5,     R5                      ; 5738   012D
        ANDR    R5,     R3                      ; 5739   01AB
        ADD@    R3,     R3                      ; 573A   02DB
        PSHR    R5                              ; 573B   0275
        MOVR    R0,     R1                      ; 573C   0081
        MVII    #$001E, R0                      ; 573D   02B8 001E
        BPL     L_5742                          ; 573F   0203 0001

        CLRR    R0                              ; 5741   01C0
L_5742:
        MVI     G_0161, R2                      ; 5742   0282 0161
        CMPI    #$0005, R2                      ; 5744   037A 0005
        BNEQ    L_5749                          ; 5746   020C 0001

        SLR     R0,     1                       ; 5748   0060

L_5749:
        JSR     R5,     .EXEC.637               ; 5749   0004 0114 0237

        MVI     G_0324, R3                      ; 574C   0283 0324

        JSR     R5,     L_575F                  ; 574E   0004 0154 035F

        MVO     R2,     G_017C                  ; 5751   0242 017C

        JSR     R5,     .EXEC.63D               ; 5753   0004 0114 023D

        MVI     G_0324, R3                      ; 5756   0283 0324
        SLR     R3,     2                       ; 5758   0067

        JSR     R5,     L_575F                  ; 5759   0004 0154 035F

        MVO     R2,     G_017D                  ; 575C   0242 017D
        PULR    R7                              ; 575E   02B7

L_575F:
        TSTR    R2                              ; 575F   0092
        BPL     L_5763                          ; 5760   0203 0001

        SLR     R3,     1                       ; 5762   0063
L_5763:
        SARC    R3,     1                       ; 5763   007B
        BNC     L_5767                          ; 5764   0209 0001

        SAR     R2,     1                       ; 5766   006A
L_5767:
        MOVR    R5,     R7                      ; 5767   00AF

L_5768:
        PSHR    R5                              ; 5768   0275
        CLRR    R3                              ; 5769   01DB
        CLRR    R1                              ; 576A   01C9
        CMPI    #$0001, R0                      ; 576B   0378 0001
        BGT     L_5787                          ; 576D   020E 0018
        BLT     L_57CA                          ; 576F   0205 0059

        MVI     G_0324, R0                      ; 5771   0280 0324
        ANDI    #$0300, R0                      ; 5773   03B8 0300
        BEQ     L_5780                          ; 5775   0204 0009

        CMPI    #$0300, R0                      ; 5777   0378 0300
        BEQ     L_5800                          ; 5779   0204 0085

        MVI     G_035E, R0                      ; 577B   0280 035E
        SARC    R0,     1                       ; 577D   0078
        BC      L_5800                          ; 577E   0201 0080

L_5780:
        CLRR    R0                              ; 5780   01C0
        SUBI    #$0020, R3                      ; 5781   033B 0020
        SUBI    #$0024, R1                      ; 5783   0339 0024
        B       L_579A                          ; 5785   0200 0013

L_5787:
        MVI     G_01DC, R2                      ; 5787   0282 01DC
        CMPI    #$0001, R2                      ; 5789   037A 0001
        BLE     L_57CA                          ; 578B   0206 003D

        MVI     G_01BF, R2                      ; 578D   0282 01BF
        DECR    R2                              ; 578F   0012
        MVO     R2,     G_01BF                  ; 5790   0242 01BF
        BPL     L_57CA                          ; 5792   0203 0036

        MVI     G_015D, R2                      ; 5794   0282 015D
        SLL     R2,     2                       ; 5796   004E
        SLL     R2,     1                       ; 5797   004A
        MVO     R2,     G_01BF                  ; 5798   0242 01BF
L_579A:
        ADDI    #$0345, R3                      ; 579A   02FB 0345
        ADDI    #$01A2, R1                      ; 579C   02F9 01A2
        MVI@    R3,     R2                      ; 579E   029A
        TSTR    R2                              ; 579F   0092
        BNEQ    L_57CA                          ; 57A0   020C 0028

        MOVR    R0,     R4                      ; 57A2   0084
        BEQ     L_57A7                          ; 57A3   0204 0002

        MVO     R0,     G_01BD                  ; 57A5   0240 01BD
L_57A7:
        ADDI    #$0175, R4                      ; 57A7   02FC 0175
        SLL     R0,     2                       ; 57A9   004C
        SLL     R0,     1                       ; 57AA   0048
        ADDR    R0,     R4                      ; 57AB   00C4
        MVII    #$0006, R0                      ; 57AC   02B8 0006

        JSR     R5,     .EXEC.730               ; 57AE   0004 0114 0330

        MOVR    R3,     R4                      ; 57B1   009C
        SDBD                                    ; 57B2   0001
        MVII    #$3807, R0                      ; 57B3   02B8 0007 0038
        MVO@    R0,     R4                      ; 57B6   0260
        SDBD                                    ; 57B7   0001
        MVII    #$5139, R0                      ; 57B8   02B8 0039 0051
        MVO@    R0,     R4                      ; 57BB   0260
        ADDI    #$0003, R4                      ; 57BC   02FC 0003
        MVII    #$0004, R0                      ; 57BE   02B8 0004
        MVO@    R0,     R4                      ; 57C0   0260
        MVII    #$0001, R0                      ; 57C1   02B8 0001
        MVO@    R0,     R4                      ; 57C3   0260
        MVII    #$0008, R0                      ; 57C4   02B8 0008
        MVO@    R0,     R4                      ; 57C6   0260

        JSR     R5,     L_58DD                  ; 57C7   0004 0158 00DD

L_57CA:
        PULR    R7                              ; 57CA   02B7

        PSHR    R5                              ; 57CB   0275
        DECR    R0                              ; 57CC   0010
        BNEQ    L_57D6                          ; 57CD   020C 0007

        TSTR    R3                              ; 57CF   009B
        BEQ     L_57FF                          ; 57D0   0204 002D

        MVII    #$017E, R5                      ; 57D2   02BD 017E
        B       L_57DC                          ; 57D4   0200 0006

L_57D6:
        CMP     G_01BD, R3                      ; 57D6   0343 01BD
        BEQ     L_57FF                          ; 57D8   0204 0025

        MVII    #$01A2, R5                      ; 57DA   02BD 01A2
L_57DC:
        MOVR    R3,     R0                      ; 57DC   0098
        MOVR    R3,     R4                      ; 57DD   009C
        SLL     R3,     2                       ; 57DE   004F
        SLL     R3,     1                       ; 57DF   004B
        ADDR    R3,     R4                      ; 57E0   00DC
        ADDI    #$0175, R4                      ; 57E1   02FC 0175
        SDBD                                    ; 57E3   0001
        MVI@    R4,     R3                      ; 57E4   02A3
        SDBD                                    ; 57E5   0001
        SUB@    R5,     R3                      ; 57E6   032B
        BPL     L_57EA                          ; 57E7   0203 0001

        NEGR    R3                              ; 57E9   0023
L_57EA:
        CMPI    #$0020, R3                      ; 57EA   037B 0020
        BGT     L_57FF                          ; 57EC   020E 0011

        SDBD                                    ; 57EE   0001
        MVII    #$A007, R2                      ; 57EF   02BA 0007 00A0
        MVO@    R2,     R1                      ; 57F2   024A
        TSTR    R0                              ; 57F3   0080
        BEQ     L_5804                          ; 57F4   0204 000E

        JSR     R5,     .EXEC.76C               ; 57F6   0004 0114 036C
        JSR     R5,     L_584C                  ; 57F9   0004 0158 004C
        JSR     R5,     L_58EE                  ; 57FC   0004 0158 00EE

L_57FF:
        PULR    R7                              ; 57FF   02B7

L_5800:
        JSR     R5,     L_598A                  ; 5800   0004 0158 018A

        PULR    R7                              ; 5803   02B7

L_5804:
        JSR     R5,     L_58EE                  ; 5804   0004 0158 00EE

        MVI     G_015D, R0                      ; 5807   0280 015D
        TSTR    R0                              ; 5809   0080
        BEQ     L_5812                          ; 580A   0204 0006

        JSR     R5,     X_RAND1                 ; 580C   0004 0114 027D

        TSTR    R0                              ; 580F   0080
        BNEQ    L_5821                          ; 5810   020C 000F

L_5812:
        MVII    #$000A, R0                      ; 5812   02B8 000A

        JSR     R5,     X_RAND2                 ; 5814   0004 0114 029E
        JSR     R5,     X_POW2                  ; 5817   0004 0114 0345

        MOVR    R0,     R1                      ; 581A   0081
        COMR    R0                              ; 581B   0018
        AND     G_0324, R0                      ; 581C   0380 0324
        XORR    R1,     R0                      ; 581E   01C8
        MVO     R0,     G_0324                  ; 581F   0240 0324
L_5821:
        MVI     G_01BE, R1                      ; 5821   0281 01BE
        INCR    R1                              ; 5823   0009
        MVO     R1,     G_01BE                  ; 5824   0241 01BE
        SLL     R1,     2                       ; 5826   004D
        SDBD                                    ; 5827   0001
        MVII    #$0325, R4                      ; 5828   02BC 0025 0003
        SDBD                                    ; 582B   0001
        MVII    #$101A, R0                      ; 582C   02B8 001A 0010
        MVO@    R0,     R4                      ; 582F   0260
        INCR    R4                              ; 5830   000C
        MVI     G_031F, R0                      ; 5831   0280 031F
        MVO@    R0,     R4                      ; 5833   0260
        MVI     G_0320, R0                      ; 5834   0280 0320
        MVO@    R0,     R4                      ; 5836   0260
        MVII    #$0008, R0                      ; 5837   02B8 0008
        MVO@    R0,     R4                      ; 5839   0260
        MVII    #$03F0, R0                      ; 583A   02B8 03F0
        MVO@    R0,     R4                      ; 583C   0260
        MVO@    R1,     R4                      ; 583D   0261
        SDBD                                    ; 583E   0001
        MVII    #$1906, R0                      ; 583F   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5842   0240 035D
        MVII    #$000D, R0                      ; 5844   02B8 000D
        MVO     R0,     G_017D                  ; 5846   0240 017D
        CLRR    R0                              ; 5848   01C0
        MVO     R0,     G_017C                  ; 5849   0240 017C
        PULR    R7                              ; 584B   02B7

L_584C:
        PSHR    R5                              ; 584C   0275
        TSTR    R0                              ; 584D   0080
        BEQ     L_5856                          ; 584E   0204 0006

        MOVR    R0,     R2                      ; 5850   0082
        ADDI    #$01CD, R2                      ; 5851   02FA 01CD
        MVII    #$0002, R0                      ; 5853   02B8 0002
        MVO@    R0,     R2                      ; 5855   0250
L_5856:
        SDBD                                    ; 5856   0001
        MVII    #$1012, R0                      ; 5857   02B8 0012 0010
        MVO@    R0,     R1                      ; 585A   0248
        SDBD                                    ; 585B   0001
        MVII    #$5132, R0                      ; 585C   02B8 0032 0051
        INCR    R1                              ; 585F   0009
        MVO@    R0,     R1                      ; 5860   0248
        ADDI    #$0001, R1                      ; 5861   02F9 0001
        MVII    #$0004, R0                      ; 5863   02B8 0004
        SWAP    R0,     1                       ; 5865   0040
        ADD@    R1,     R0                      ; 5866   02C8
        MVO@    R0,     R1                      ; 5867   0248
        ADDI    #$0003, R1                      ; 5868   02F9 0003
        SDBD                                    ; 586A   0001
        MVII    #$00F4, R0                      ; 586B   02B8 00F4 0000
        MVO@    R0,     R1                      ; 586E   0248
        INCR    R1                              ; 586F   0009
        MVII    #$0003, R0                      ; 5870   02B8 0003
        MVO@    R0,     R1                      ; 5872   0248
        ADDI    #$001A, R1                      ; 5873   02F9 001A

        JSR     R5,     .EXEC.7AE               ; 5875   0004 0114 03AE

        PULR    R7                              ; 5878   02B7

L_5879:
        MVI     G_01D8, R0                      ; 5879   0280 01D8
        TSTR    R0                              ; 587B   0080
        BNEQ    L_5881                          ; 587C   020C 0003
        ADD     G_0162, R7                      ; 587E   02C7 0162
        INCR    R7                              ; 5880   000F
L_5881:
        MOVR    R5,     R7                      ; 5881   00AF

L_5882:
        MVII    #$0002, R0                      ; 5882   02B8 0002
        NEGR    R0                              ; 5884   0020
        B       L_5897                          ; 5885   0200 0010
L_5887:
        ADD     G_0162, R7                      ; 5887   02C7 0162
        MOVR    R5,     R7                      ; 5889   00AF

        MVII    #$0064, R0                      ; 588A   02B8 0064
        B       L_5897                          ; 588C   0200 0009

L_588E:
        MVII    #$00FA, R0                      ; 588E   02B8 00FA
        MVI     G_0162, R1                      ; 5890   0281 0162
        TSTR    R1                              ; 5892   0089
        BEQ     L_5897                          ; 5893   0204 0002

        MVII    #$0032, R0                      ; 5895   02B8 0032
L_5897:
        MVI     G_0164, R1                      ; 5897   0281 0164
        SWAP    R1,     1                       ; 5899   0041
        ADD     G_0163, R1                      ; 589A   02C1 0163
        ADDR    R1,     R0                      ; 589C   00C8
        BMI     L_5881                          ; 589D   022B 001D
        INCR    R7                              ; 589F   000F

L_58A0:
        CLRR    R0                              ; 58A0   01C0
L_58A1:
        MVO     R0,     G_0163                  ; 58A1   0240 0163
        SWAP    R0,     1                       ; 58A3   0040
        MVO     R0,     G_0164                  ; 58A4   0240 0164
        SWAP    R0,     1                       ; 58A6   0040
        MVII    #$0004, R1                      ; 58A7   02B9 0004
        MVII    #$0003, R3                      ; 58A9   02BB 0003
        MVII    #$0223, R4                      ; 58AB   02BC 0223
        J       X_PRNUM_RGT                     ; 58AD   0004 0318 00C5

        PSHR    R5                              ; 58B0   0275
        DECR    R0                              ; 58B1   0010
        BNEQ    L_58DC                          ; 58B2   020C 0028

        MVI     G_0325, R0                      ; 58B4   0280 0325
        TSTR    R0                              ; 58B6   0080
        BNEQ    L_58DC                          ; 58B7   020C 0023

        MVII    #$0325, R4                      ; 58B9   02BC 0325
        SDBD                                    ; 58BB   0001
        MVII    #$3007, R0                      ; 58BC   02B8 0007 0030
        MVO@    R0,     R4                      ; 58BF   0260
        INCR    R4                              ; 58C0   000C
        MVII    #$031F, R5                      ; 58C1   02BD 031F
        MVI@    R5,     R2                      ; 58C3   02AA
        MVO@    R2,     R4                      ; 58C4   0262
        MVI@    R5,     R2                      ; 58C5   02AA
        MVO@    R2,     R4                      ; 58C6   0262
        MVI     G_033F, R0                      ; 58C7   0280 033F
        MVI     G_0340, R1                      ; 58C9   0281 0340
        SWAP    R0,     1                       ; 58CB   0040
        SWAP    R1,     1                       ; 58CC   0041

        JSR     R5,     X_PACK_BYTES            ; 58CD   0004 0114 034F

        MOVR    R0,     R2                      ; 58D0   0082
        MVII    #$0008, R3                      ; 58D1   02BB 0008
        MVII    #$0325, R1                      ; 58D3   02B9 0325

        JSR     R5,     .EXEC.9A1               ; 58D5   0004 0118 01A1

        MVII    #$0002, R3                      ; 58D8   02BB 0002
        MVO     R3,     G_032A                  ; 58DA   0243 032A
L_58DC:
        PULR    R7                              ; 58DC   02B7

L_58DD:
        PSHR    R5                              ; 58DD   0275

        JSR     R5,     X_PLAY_SFX1             ; 58DE   0004 0118 03BB
        DECLE   $02E9                           ; 58E1  SFX data
        DECLE   $006D                           ; 58E2  SFX data
        DECLE   $000F,  $0008                   ; 58E3  SFX data
        DECLE   $02F5                           ; 58E5  SFX data
        DECLE   $0340,  $0070                   ; 58E6  SFX data
        DECLE   $0001,  $0060                   ; 58E8  SFX data
        DECLE   $03EE                           ; 58EA  SFX data
        DECLE   $008F,  $0017                   ; 58EB  SFX data
        DECLE   $02CF                           ; 58ED  SFX end

L_58EE:
        PSHR    R5                              ; 58EE   0275

        JSR     R5,     X_PLAY_SFX1             ; 58EF   0004 0118 03BB
        DECLE   $014F,  $0034                   ; 58F2  SFX data
        DECLE   $01E9                           ; 58F4  SFX data
        DECLE   $03ED                           ; 58F5  SFX data
        DECLE   $0375                           ; 58F6  SFX data
        DECLE   $0350,  $0000                   ; 58F7  SFX data
        DECLE   $03FE                           ; 58F9  SFX data
        DECLE   $0077,  $0000,  $0059           ; 58FA  SFX data
        DECLE   $0023,  $03EE                   ; 58FD  SFX data
        DECLE   $02CF                           ; 58FF  SFX end

UC_5900:
        ADDI    #$0004, R3                      ; 5900  SLIB UCALL target
        MVI@    R3,     R0                      ; 5902   0298
        XORI    #$0002, R0                      ; 5903   03F8 0002
        MVO@    R0,     R3                      ; 5905   0258
L_5906:
        PULR    R7                              ; 5906   02B7

L_5907:
        PSHR    R5                              ; 5907   0275

        JSR     R5,     X_PLAY_SFX2             ; 5908   0004 0118 03BE
        DECLE   $0083                           ; 590B  SFX prio
        DECLE   $0009,  $03ED,  $001D,  $0210   ; 590C   0009 03ED 001D 0210
        DECLE   $0000,  $0218                   ; 5910   0000 0218

        B       L_5B38                          ; 5912   0200 0224

        DECLE   $0000                           ; 5914   0000

        RRC     R3,     2                       ; 5915   0077
        COMR    R2                              ; 5916   001A
        SLLC    R1,     1                       ; 5917   0059
        NEGR    R3                              ; 5918   0023
        XOR@    R2,     R4                      ; 5919   03D4
        MVI     G_01C2, R0                      ; 591A   0280 01C2
        SLL     R0,     1                       ; 591C   0048
        SLL     R0,     2                       ; 591D   004C
        ADDI    #$000F, R0                      ; 591E   02F8 000F
        J       .EXEC.D48                       ; 5920   0004 031C 0148

L_5923:
        MVI     G_0324, R1                      ; 5923   0281 0324
        ANDI    #$0010, R1                      ; 5925   03B9 0010
        BNEQ    L_5937                          ; 5927   020C 000E

        PSHR    R5                              ; 5929   0275

        JSR     R5,     X_PLAY_SFX2             ; 592A   0004 0118 03BE
        DECLE   $0081                           ; 592D  SFX prio
        DECLE   $021D                           ; 592E   021D

        XOR@    R5,     R1                      ; 592F   03E9
        CMP     G_0140, R0                      ; 5930   0340 0140
        MOVR    R5,     R3                      ; 5932   00AB
        XORI    #$00C3, R1                      ; 5933   03F9 00C3
        XOR@    R4,     R4                      ; 5935   03E4
        ADD@    R1,     R7                      ; 5936   02CF
L_5937:
        MOVR    R5,     R7                      ; 5937   00AF

L_5938:
        PSHR    R5                              ; 5938   0275

        JSR     R5,     X_PLAY_SFX2             ; 5939   0004 0118 03BE
        DECLE   $0084                           ; 593C  SFX prio

        XORI    #$03B7, R1                      ; 593D   03F9 03B7
        INCR    R4                              ; 593F   000C
        RLC     R0,     1                       ; 5940   0050
        COMR    R5                              ; 5941   001D
        RRC     R3,     2                       ; 5942   0077
        RLC     R1,     2                       ; 5943   0055
        SLLC    R1,     1                       ; 5944   0059
        SWAP    R3,     1                       ; 5945   0043
        XOR@    R5,     R4                      ; 5946   03EC
L_5947:
        PSHR    R5                              ; 5947   0275

        JSR     R5,     X_PLAY_SFX2             ; 5948   0004 0118 03BE
        DECLE   $0084                           ; 594B  SFX prio

        SARC    R1,     1                       ; 594C   0079
        XORI    #$03FF, R4                      ; 594D   03FC 03FF
        XOR@    R5,     R5                      ; 594F   03ED
        INCR    R3                              ; 5950   000B
        COMR    R5                              ; 5951   001D
        XOR@    R4,     R3                      ; 5952   03E3
        XORI    #$02CF, R0                      ; 5953   03F8 02CF
        ADDI    #$0003, R3                      ; 5955   02FB 0003
        MVI@    R3,     R0                      ; 5957   0298
        DECR    R0                              ; 5958   0010
        XORI    #$0004, R0                      ; 5959   03F8 0004
        MVO@    R0,     R3                      ; 595B   0258
        ADDI    #$0007, R3                      ; 595C   02FB 0007
        MVII    #$000E, R0                      ; 595E   02B8 000E
        MVO@    R0,     R3                      ; 5960   0258
        PULR    R7                              ; 5961   02B7

L_5962:
        CLRR    R0                              ; 5962   01C0
        MVO     R0,     G_0146                  ; 5963   0240 0146

        JSR     R5,     X_PLAY_MUS2             ; 5965   0004 0118 035D
        DECLE   $001E                           ; 5968  Note (short)
        DECLE   $00DC                           ; 5969  Note (short)
        DECLE   $00DC                           ; 596A  Note (short)
        DECLE   $008E                           ; 596B  Note (short)
        DECLE   $01DE                           ; 596C  Note (short)
        DECLE   $019E                           ; 596D  Note (short)
        DECLE   $020E                           ; 596E  Note (short)
        DECLE   $0257                           ; 596F  Note (short)
        DECLE   $0000                           ; 5970  End of music
L_5971:
        PSHR    R5                              ; 5971   0275
        MVI     G_01D8, R0                      ; 5972   0280 01D8
        TSTR    R0                              ; 5974   0080
        BNEQ    L_5906                          ; 5975   022C 0070

        JSR     R5,     X_PLAY_SFX2             ; 5977   0004 0118 03BE
        DECLE   $007F                           ; 597A  SFX prio
        DECLE   $0379,  $01C5,  $0077,  $0082   ; 597B   0379 01C5 0077 0082
        DECLE   $0059,  $00EB,  $03CF           ; 597F   0059 00EB 03CF

        MVII    #$0038, R0                      ; 5982   02B8 0038
        SUB     G_0165, R0                      ; 5984   0300 0165
        SLL     R0,     2                       ; 5986   004C
        MVO     R0,     G_0155                  ; 5987   0240 0155
        PULR    R7                              ; 5989   02B7

L_598A:
        PSHR    R5                              ; 598A   0275

        JSR     R5,     X_PLAY_SFX1             ; 598B   0004 0118 03BB
        DECLE   $018D                           ; 598E  SFX data
        DECLE   $011D                           ; 598F  SFX data
        DECLE   $0079                           ; 5990  SFX data
        DECLE   $0375                           ; 5991  SFX data
        DECLE   $002B                           ; 5992  SFX data
        DECLE   $03F9                           ; 5993  SFX data
        DECLE   $0023,  $03E8                   ; 5994  SFX data
        DECLE   $02CF                           ; 5996  SFX end

        DECLE   $0000,  $0000,  $0000,  $0018   ; 5997   0000 0000 0000 0018
        DECLE   $0018,  $0000,  $0000,  $0000   ; 599B   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 599F   0000 0000 0018 003C
        DECLE   $0024,  $0018,  $0000,  $0000   ; 59A3   0024 0018 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 59A7   0000 0000 0018 003C
        DECLE   $005A,  $0066,  $003C,  $0000   ; 59AB   005A 0066 003C 0000
        DECLE   $0000,  $0018,  $003C,  $007E   ; 59AF   0000 0018 003C 007E
        DECLE   $00BD,  $00C3,  $0066,  $003C   ; 59B3   00BD 00C3 0066 003C
        DECLE   $002A,  $003C,  $0055,  $002E   ; 59B7   002A 003C 0055 002E
        DECLE   $00B4,  $002C,  $0012,  $0040   ; 59BB   00B4 002C 0012 0040
        DECLE   $0012,  $0084,  $0020,  $0089   ; 59BF   0012 0084 0020 0089
        DECLE   $0000,  $0014,  $0040,  $0009   ; 59C3   0000 0014 0040 0009
        DECLE   $0060,  $00F0,  $00F0,  $0058   ; 59C7   0060 00F0 00F0 0058
        DECLE   $0036                           ; 59CB   0036

        INCR    R7                              ; 59CC   000F

        INCR    R6                              ; 59CD   000E
L_59CE:
        SETC                                    ; 59CE   0007
        DECLE   $0060,  $00B0,  $00F0,  $0068   ; 59CF   0060 00B0 00F0 0068
        DECLE   $003E,  $000E,  $000A,  $0006   ; 59D3   003E 000E 000A 0006
        DECLE   $0000,  $0000,  $0000,  $0018   ; 59D7   0000 0000 0000 0018
        DECLE   $0018,  $0000,  $0000,  $0000   ; 59DB   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59DF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59E3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 59E7   0000 0000 0000 0010
        DECLE   $0010,  $0000,  $0000,  $0000   ; 59EB   0010 0000 0000 0000
        DECLE   $0000,  $003C,  $007E,  $00FF   ; 59EF   0000 003C 007E 00FF
        DECLE   $00FF,  $007E,  $003C,  $0000   ; 59F3   00FF 007E 003C 0000
        DECLE   $0010,  $0010,  $0010,  $0010   ; 59F7   0010 0010 0010 0010
        DECLE   $0028,  $00D6,  $0028,  $0000   ; 59FB   0028 00D6 0028 0000
L_59FF:
        PSHR    R5                              ; 59FF   0275

        JSR     R5,     L_514D                  ; 5A00   0004 0150 014D

        MVI     G_0162, R5                      ; 5A03   0285 0162
        TSTR    R5                              ; 5A05   00AD
        BNEQ    L_5A0B                          ; 5A06   020C 0003

        JSR     R5,     L_58A0                  ; 5A08   0004 0158 00A0
L_5A0B:
        JSR     R5,     L_5947                  ; 5A0B   0004 0158 0147

        MOVR    R7,     R4                      ; 5A0E   00BC
        ADDI    #$0022, R4                      ; 5A0F   02FC 0022
        MVII    #$031D, R5                      ; 5A11   02BD 031D
L_5A13:
        SDBD                                    ; 5A13   0001
        MVII    #$1012, R0                      ; 5A14   02B8 0012 0010
        MVO@    R0,     R5                      ; 5A17   0268
        MOVR    R7,     R0                      ; 5A18   00B8
        ADDI    #$0030, R0                      ; 5A19   02F8 0030
        MVO@    R0,     R5                      ; 5A1B   0268
        SDBD                                    ; 5A1C   0001
        MVI@    R4,     R0                      ; 5A1D   02A0
        MVO@    R0,     R5                      ; 5A1E   0268
        SWAP    R0,     1                       ; 5A1F   0040
        MVO@    R0,     R5                      ; 5A20   0268
        SDBD                                    ; 5A21   0001
        MVI@    R4,     R0                      ; 5A22   02A0
        MVO@    R0,     R5                      ; 5A23   0268
        CLRR    R0                              ; 5A24   01C0
        MVO@    R0,     R5                      ; 5A25   0268
        MVO@    R0,     R5                      ; 5A26   0268
        MVO@    R0,     R5                      ; 5A27   0268
        CMPI    #$034D, R5                      ; 5A28   037D 034D
        BNEQ    L_5A13                          ; 5A2A   022C 0018

        MVII    #$0003, R0                      ; 5A2C   02B8 0003
        MVO     R0,     G_032B                  ; 5A2E   0240 032B
        PULR    R7                              ; 5A30   02B7

        DECLE   $0006,  $0050,  $0000,  $00F6   ; 5A31   0006 0050 0000 00F6
        DECLE   $0009,  $0055,  $0005,  $0000   ; 5A35   0009 0055 0005 0000
        DECLE   $0008,  $0059,  $0000,  $000A   ; 5A39   0008 0059 0000 000A
        DECLE   $000C,  $004F,  $0008,  $00F6   ; 5A3D   000C 004F 0008 00F6
        DECLE   $000D,  $0056,  $000A,  $0000   ; 5A41   000D 0056 000A 0000
        DECLE   $000C,  $005A,  $0008,  $000A   ; 5A45   000C 005A 0008 000A
        DECLE   $0000,  $0000,  $0050,  $005A   ; 5A49   0000 0000 0050 005A
        DECLE   $0002,  $0004,  $0000           ; 5A4D   0002 0004 0000

        PSHR    R5                              ; 5A50   0275
        ADDI    #$0006, R1                      ; 5A51   02F9 0006
        MVII    #$0003, R2                      ; 5A53   02BA 0003
        MVO@    R2,     R1                      ; 5A55   024A
        INCR    R1                              ; 5A56   0009
        MVI@    R1,     R2                      ; 5A57   028A
        INCR    R2                              ; 5A58   000A
        MVO@    R2,     R1                      ; 5A59   024A
        ADDR    R7,     R2                      ; 5A5A   00FA
        ADD@    R2,     R7                      ; 5A5B   02D7

        DECLE   $0005                           ; 5A5C   0005

        COMR    R6                              ; 5A5D   001E
        GSWD    R1                              ; 5A5E   0031
        SWAP    R0,     2                       ; 5A5F   0044
        RLC     R2,     1                       ; 5A60   0052
        MVII    #$031D, R4                      ; 5A61   02BC 031D
        SDBD                                    ; 5A63   0001
        MVII    #$3092, R0                      ; 5A64   02B8 0092 0030
        MVII    #$0004, R2                      ; 5A67   02BA 0004
        SWAP    R2,     1                       ; 5A69   0042
L_5A6A:
        MVO@    R0,     R4                      ; 5A6A   0260
        INCR    R4                              ; 5A6B   000C
        MOVR    R4,     R5                      ; 5A6C   00A5
        MVI@    R4,     R1                      ; 5A6D   02A1
        SUBR    R2,     R1                      ; 5A6E   0111
        MVO@    R1,     R5                      ; 5A6F   0269
        MVI@    R4,     R1                      ; 5A70   02A1
        SUBR    R2,     R1                      ; 5A71   0111
        MVO@    R1,     R5                      ; 5A72   0269
        ADDI    #$0004, R4                      ; 5A73   02FC 0004
        CMPI    #$034D, R4                      ; 5A75   037C 034D
        BNEQ    L_5A6A                          ; 5A77   022C 000E
        PULR    R7                              ; 5A79   02B7

        MVII    #$0208, R4                      ; 5A7A   02BC 0208
        MVII    #$0002, R2                      ; 5A7C   02BA 0002
L_5A7E:
        MVII    #$0005, R3                      ; 5A7E   02BB 0005

L_5A80:
        JSR     R5,     L_53B5                  ; 5A80   0004 0150 03B5

        MVO@    R0,     R4                      ; 5A83   0260
        DECR    R3                              ; 5A84   0013
        BNEQ    L_5A80                          ; 5A85   022C 0006

        ADDI    #$000F, R4                      ; 5A87   02FC 000F
        DECR    R2                              ; 5A89   0012
        BNEQ    L_5A7E                          ; 5A8A   022C 000D
        PULR    R7                              ; 5A8C   02B7

        MVII    #$031D, R2                      ; 5A8D   02BA 031D
        SDBD                                    ; 5A8F   0001
        MVII    #$3082, R0                      ; 5A90   02B8 0082 0030
L_5A93:
        MVO@    R0,     R2                      ; 5A93   0250
        ADDI    #$0005, R2                      ; 5A94   02FA 0005
        MVII    #$0001, R4                      ; 5A96   02BC 0001
        MVO@    R4,     R2                      ; 5A98   0254
        ADDI    #$0003, R2                      ; 5A99   02FA 0003
        CMPI    #$034D, R2                      ; 5A9B   037A 034D
        BNEQ    L_5A93                          ; 5A9D   022C 000B
        PULR    R7                              ; 5A9F   02B7

        MVII    #$031D, R2                      ; 5AA0   02BA 031D
        SDBD                                    ; 5AA2   0001
        MVII    #$3097, R0                      ; 5AA3   02B8 0097 0030
L_5AA6:
        MVO@    R0,     R2                      ; 5AA6   0250
        ADDI    #$0008, R2                      ; 5AA7   02FA 0008
        CMPI    #$034D, R2                      ; 5AA9   037A 034D
        BNEQ    L_5AA6                          ; 5AAB   022C 0006
        PULR    R7                              ; 5AAD   02B7

        JSR     R5,     .EXEC.7B4               ; 5AAE   0004 0114 03B4

L_5AB1:
        PSHR    R5                              ; 5AB1   0275

        JSR     R5,     L_514D                  ; 5AB2   0004 0150 014D
        JSR     R5,     .EXEC.7B3               ; 5AB5   0004 0114 03B3

        CLRR    R0                              ; 5AB8   01C0
        MVO     R0,     G_015E                  ; 5AB9   0240 015E

        JSR     R5,     .EXEC.A61               ; 5ABB   0004 0118 0261

        DIS                                     ; 5ABE   0003
        SDBD                                    ; 5ABF   0001
        MVII    #$00CC, R0                      ; 5AC0   02B8 00CC 0000
        SDBD                                    ; 5AC3   0001
        MVII    #$005A, R1                      ; 5AC4   02B9 005A 0000
        MVO     R0,     G_016B                  ; 5AC7   0240 016B
        MVO     R1,     G_016C                  ; 5AC9   0241 016C
L_5ACB:
        PULR    R7                              ; 5ACB   02B7

        PSHR    R5                              ; 5ACC   0275
        MVI     G_01C0, R2                      ; 5ACD   0282 01C0
        INCR    R2                              ; 5ACF   000A
        ADDR    R7,     R2                      ; 5AD0   00FA
        ADD@    R2,     R7                      ; 5AD1   02D7

        JSRD    R4,     .EXEC.834               ; 5AD2   0004 001A 0034

        SAR     R2,     1                       ; 5AD5   006A
        MVO     R0,     .STIC.VIDEN             ; 5AD6   0240 0020
        CLRR    R0                              ; 5AD8   01C0
        MVO     R0,     G_0165                  ; 5AD9   0240 0165
        MVII    #$0001, R0                      ; 5ADB   02B8 0001
        MVO     R0,     G_01C0                  ; 5ADD   0240 01C0
        MVII    #$0002, R1                      ; 5ADF   02B9 0002
        MVO     R1,     G_01C3                  ; 5AE1   0241 01C3
        DECR    R1                              ; 5AE3   0011
        MVO     R1,     G_01C1                  ; 5AE4   0241 01C1
        MVII    #$0006, R0                      ; 5AE6   02B8 0006
        MVO     R0,     G_01C4                  ; 5AE8   0240 01C4
        B       L_5B4F                          ; 5AEA   0200 0063

        MVO     R0,     .STIC.VIDEN             ; 5AEC   0240 0020
        MVI     G_01C7, R0                      ; 5AEE   0280 01C7
        INCR    R0                              ; 5AF0   0008
        ANDI    #$0003, R0                      ; 5AF1   03B8 0003
        MVO     R0,     G_01C7                  ; 5AF3   0240 01C7
        BNEQ    L_5B4F                          ; 5AF5   020C 0058

        JSR     R5,     L_5B59                  ; 5AF7   0004 0158 0359

        MVI     G_01C2, R0                      ; 5AFA   0280 01C2
        CMPI    #$0006, R0                      ; 5AFC   0378 0006
        BNEQ    L_5B4F                          ; 5AFE   020C 004F

        MVII    #$0002, R2                      ; 5B00   02BA 0002
        MVO     R2,     G_01C0                  ; 5B02   0242 01C0
        B       L_5B4F                          ; 5B04   0200 0049

        MVO     R0,     .STIC.VIDEN             ; 5B06   0240 0020
        MVI     G_01C8, R0                      ; 5B08   0280 01C8
        INCR    R0                              ; 5B0A   0008
        ANDI    #$000F, R0                      ; 5B0B   03B8 000F
        MVO     R0,     G_01C8                  ; 5B0D   0240 01C8
        BNEQ    L_5B14                          ; 5B0F   020C 0003

        JSR     R5,     L_5BC3                  ; 5B11   0004 0158 03C3

L_5B14:
        MVI     G_01C9, R0                      ; 5B14   0280 01C9
        CMPI    #$0004, R0                      ; 5B16   0378 0004
        BNEQ    L_5B4F                          ; 5B18   020C 0035

        MVI     G_01C7, R0                      ; 5B1A   0280 01C7
        CMPI    #$00FF, R0                      ; 5B1C   0378 00FF
        BEQ     L_5B31                          ; 5B1E   0204 0011

        ADDI    #$0003, R0                      ; 5B20   02F8 0003
        MVO     R0,     G_01C7                  ; 5B22   0240 01C7
        MVII    #$0003, R3                      ; 5B24   02BB 0003

        JSR     R5,     L_5BA9                  ; 5B26   0004 0158 03A9

        SDBD                                    ; 5B29   0001
        MVII    #$0860, R0                      ; 5B2A   02B8 0060 0008
        MVO     R0,     .BTAB.EF                ; 5B2D   0240 02EF
        B       L_5B4F                          ; 5B2F   0200 001E

L_5B31:
        MVII    #$0001, R3                      ; 5B31   02BB 0001

        JSR     R5,     L_5BA9                  ; 5B33   0004 0158 03A9

        MVII    #$0003, R0                      ; 5B36   02B8 0003
L_5B38:
        MVO     R0,     G_01C0                  ; 5B38   0240 01C0
        B       L_5B4F                          ; 5B3A   0200 0013

        MVO     R0,     .STIC.VIDEN             ; 5B3C   0240 0020
        MVI     G_01C7, R0                      ; 5B3E   0280 01C7
        INCR    R0                              ; 5B40   0008
        ANDI    #$0003, R0                      ; 5B41   03B8 0003
        MVO     R0,     G_01C7                  ; 5B43   0240 01C7
        BNEQ    L_5B4F                          ; 5B45   020C 0008

        JSR     R5,     L_5B59                  ; 5B47   0004 0158 0359

        MVI     G_01C2, R0                      ; 5B4A   0280 01C2
        TSTR    R0                              ; 5B4C   0080
        BEQ     L_5B56                          ; 5B4D   0204 0007

L_5B4F:
        PULR    R5                              ; 5B4F   02B5

        JSR     R5,     X_PLAY_NOTE             ; 5B50   0004 0118 02BD
        JSR     R5,     L_53C1                  ; 5B53   0004 0150 03C1

L_5B56:
        J       L_5962                          ; 5B56   0004 0358 0162

L_5B59:
        MVII    #$0007, R1                      ; 5B59   02B9 0007
        MVI     G_01C3, R0                      ; 5B5B   0280 01C3
        DECR    R0                              ; 5B5D   0010
        BPL     L_5B62                          ; 5B5E   0203 0002

        MVII    #$0003, R1                      ; 5B60   02B9 0003
L_5B62:
        MVI     G_01C1, R2                      ; 5B62   0282 01C1
        DECR    R2                              ; 5B64   0012
        BNEQ    L_5B75                          ; 5B65   020C 000E

        ADD     G_01C2, R0                      ; 5B67   02C0 01C2
        BMI     L_5B75                          ; 5B69   020B 000A

        CMP     G_01C4, R0                      ; 5B6B   0340 01C4
        BLE     L_5B72                          ; 5B6D   0206 0003

        DECR    R0                              ; 5B6F   0010
        MVO     R2,     G_01C3                  ; 5B70   0242 01C3
L_5B72:
        MVO     R0,     G_01C2                  ; 5B72   0240 01C2
        MOVR    R1,     R2                      ; 5B74   008A
L_5B75:
        MVO     R2,     G_01C1                  ; 5B75   0242 01C1
        TSTR    R0                              ; 5B77   0080
        BNEQ    L_5B9F                          ; 5B78   020C 0025
        J       X_STOP_SFX                      ; 5B7A   0004 031C 02B4

L_5B7D:
        MOVR    R7,     R2                      ; 5B7D   00BA
        ADDI    #$0022, R2                      ; 5B7E   02FA 0022
        MOVR    R2,     R1                      ; 5B80   0091
        MVI     G_01C5, R0                      ; 5B81   0280 01C5
        DECR    R0                              ; 5B83   0010
        BPL     L_5B88                          ; 5B84   0203 0002

        MVI     G_01C2, R0                      ; 5B86   0280 01C2
L_5B88:
        MVO     R0,     G_01C5                  ; 5B88   0240 01C5
        ADDR    R0,     R2                      ; 5B8A   00C2
        MVI@    R2,     R0                      ; 5B8B   0290
        MVO     R0,     .STIC.HDLY              ; 5B8C   0240 0030
        MVI     G_01C6, R0                      ; 5B8E   0280 01C6
        DECR    R0                              ; 5B90   0010
        BPL     L_5B99                          ; 5B91   0203 0006

        MVI     G_01C2, R0                      ; 5B93   0280 01C2
        DECR    R0                              ; 5B95   0010
        BPL     L_5B99                          ; 5B96   0203 0001

        CLRR    R0                              ; 5B98   01C0
L_5B99:
        MVO     R0,     G_01C6                  ; 5B99   0240 01C6
        ADDR    R0,     R1                      ; 5B9B   00C1
        MVI@    R1,     R0                      ; 5B9C   0288
        MVO     R0,     .STIC.VDLY              ; 5B9D   0240 0031
L_5B9F:
        MOVR    R5,     R7                      ; 5B9F   00AF

        DECLE   $0000,  $0001,  $0003,  $0006   ; 5BA0   0000 0001 0003 0006
        DECLE   $0002,  $0007,  $0003,  $0005   ; 5BA4   0002 0007 0003 0005
        DECLE   $0004                           ; 5BA8   0004
L_5BA9:
        PSHR    R5                              ; 5BA9   0275

        JSR     R5,     L_53B5                  ; 5BAA   0004 0150 03B5

L_5BAD:
        MVI     G_01CA, R1                      ; 5BAD   0281 01CA
        MOVR    R1,     R2                      ; 5BAF   008A
        SLL     R1,     2                       ; 5BB0   004D
        ADDR    R2,     R1                      ; 5BB1   00D1
        ADDI    #$000D, R1                      ; 5BB2   02F9 000D
        ANDI    #$00FF, R1                      ; 5BB4   03B9 00FF
        MVO     R1,     G_01CA                  ; 5BB6   0241 01CA
        ADDI    #$0264, R1                      ; 5BB8   02F9 0264
        CMPI    #$02F0, R1                      ; 5BBA   0379 02F0
        BGE     L_5BBF                          ; 5BBC   020D 0001

        MVO@    R0,     R1                      ; 5BBE   0248
L_5BBF:
        DECR    R3                              ; 5BBF   0013
        BNEQ    L_5BAD                          ; 5BC0   022C 0014
        PULR    R7                              ; 5BC2   02B7

L_5BC3:
        PSHR    R5                              ; 5BC3   0275
        MVI     G_01C9, R0                      ; 5BC4   0280 01C9
        INCR    R0                              ; 5BC6   0008
        CMPI    #$0005, R0                      ; 5BC7   0378 0005
        BGE     L_5ACB                          ; 5BC9   022D 00FF

        MVO     R0,     G_01C9                  ; 5BCB   0240 01C9
        MVII    #$0005, R1                      ; 5BCD   02B9 0005
        SUBR    R0,     R1                      ; 5BCF   0101
        MVII    #$0200, R3                      ; 5BD0   02BB 0200
        MVII    #$0005, R2                      ; 5BD2   02BA 0005
L_5BD4:
        PSHR    R1                              ; 5BD4   0271
        MOVR    R3,     R4                      ; 5BD5   009C
        MOVR    R3,     R5                      ; 5BD6   009D
        INCR    R5                              ; 5BD7   000D
L_5BD8:
        DECR    R1                              ; 5BD8   0011
        BEQ     L_5BDF                          ; 5BD9   0204 0004

        MVI@    R5,     R0                      ; 5BDB   02A8
        MVO@    R0,     R4                      ; 5BDC   0260
        B       L_5BD8                          ; 5BDD   0220 0006

L_5BDF:
        ADDI    #$0014, R3                      ; 5BDF   02FB 0014
        PULR    R1                              ; 5BE1   02B1
        DECR    R2                              ; 5BE2   0012
        BNEQ    L_5BD4                          ; 5BE3   022C 0010

        MOVR    R1,     R2                      ; 5BE5   008A
        ADDI    #$01FF, R2                      ; 5BE6   02FA 01FF
        MOVR    R1,     R3                      ; 5BE8   008B
        ADDI    #$016F, R3                      ; 5BE9   02FB 016F
        MVI@    R3,     R0                      ; 5BEB   0298
        RSWD    R0                              ; 5BEC   0038
        BMI     L_5C00                          ; 5BED   020B 0011

        SLL     R1,     2                       ; 5BEF   004D
        SLL     R1,     2                       ; 5BF0   004D
        SDBD                                    ; 5BF1   0001
        ADDI    #$3B20, R1                      ; 5BF2   02F9 0020 003B
        XORR    R1,     R0                      ; 5BF5   01C8
        MVO@    R0,     R2                      ; 5BF6   0250
        ADDI    #$0014, R2                      ; 5BF7   02FA 0014
        SDBD                                    ; 5BF9   0001
        ADDI    #$0008, R1                      ; 5BFA   02F9 0008 0000
        MVO@    R1,     R2                      ; 5BFD   0251
        ADDI    #$0014, R2                      ; 5BFE   02FA 0014

L_5C00:
        JSR     R5,     L_53B5                  ; 5C00   0004 0150 03B5

        MVO@    R0,     R2                      ; 5C03   0250
        ADDI    #$0014, R2                      ; 5C04   02FA 0014
        CMPI    #$0264, R2                      ; 5C06   037A 0264
        BLT     L_5C00                          ; 5C08   0225 0009
        BNEQ    L_5ACB                          ; 5C0A   022C 0140

        MVII    #$0213, R2                      ; 5C0C   02BA 0213
        B       L_5C00                          ; 5C0E   0220 000F

        PSHR    R5                              ; 5C10   0275
L_5C11:
        PSHR    R0                              ; 5C11   0270
        MOVR    R0,     R3                      ; 5C12   0083
        SLL     R3,     2                       ; 5C13   004F
        SLL     R3,     1                       ; 5C14   004B
        ADDR    R0,     R3                      ; 5C15   00C3
        ADDI    #$0175, R3                      ; 5C16   02FB 0175
        MOVR    R0,     R1                      ; 5C18   0081
        ADDI    #$01CD, R1                      ; 5C19   02F9 01CD
        MVII    #$0009, R0                      ; 5C1B   02B8 0009

        JSR     R5,     X_RAND2                 ; 5C1D   0004 0114 029E

        SUBI    #$0004, R0                      ; 5C20   0338 0004

        JSR     R5,     L_5CBE                  ; 5C22   0004 015C 00BE

        MVII    #$0009, R0                      ; 5C25   02B8 0009

        JSR     R5,     X_RAND2                 ; 5C27   0004 0114 029E

        SUBI    #$0004, R0                      ; 5C2A   0338 0004

        JSR     R5,     L_5CC5                  ; 5C2C   0004 015C 00C5

        CLRR    R0                              ; 5C2F   01C0

        JSR     R5,     L_5CCC                  ; 5C30   0004 015C 00CC

        MVI@    R1,     R2                      ; 5C33   028A
        INCR    R2                              ; 5C34   000A
        ADDR    R7,     R2                      ; 5C35   00FA
        ADD@    R2,     R7                      ; 5C36   02D7

        CLRC                                    ; 5C37   0006
        DECR    R0                              ; 5C38   0010
        SAR     R1,     1                       ; 5C39   0069
        ADCR    R7                              ; 5C3A   002F

        SLL     R1,     2                       ; 5C3B   004D
L_5C3C:
        SLR     R1,     1                       ; 5C3C   0061

        JSR     R5,     L_5D64                  ; 5C3D   0004 015C 0164

        MVII    #$03E0, R0                      ; 5C40   02B8 03E0

        JSR     R5,     L_5D0A                  ; 5C42   0004 015C 010A

        B       L_5CA0                          ; 5C45   0200 0059

        MVII    #$000F, R0                      ; 5C47   02B8 000F
        NEGR    R0                              ; 5C49   0020

        JSR     R5,     L_5CC5                  ; 5C4A   0004 015C 00C5

        MOVR    R3,     R4                      ; 5C4D   009C
        ADDI    #$0002, R4                      ; 5C4E   02FC 0002
        SDBD                                    ; 5C50   0001
        MVI@    R4,     R2                      ; 5C51   02A2
        ADDI    #$0003, R4                      ; 5C52   02FC 0003
        MVII    #$0006, R0                      ; 5C54   02B8 0006
        NEGR    R0                              ; 5C56   0020
        RLC     R2,     1                       ; 5C57   0052
        ADCR    R7                              ; 5C58   002F

        NEGR    R0                              ; 5C59   0020
L_5C5A:
        ADD@    R4,     R0                      ; 5C5A   02E0

        JSR     R5,     X_EXT_SIGN_LO           ; 5C5B   0004 0114 0268
        JSR     R5,     L_5CBE                  ; 5C5E   0004 015C 00BE
        JSR     R5,     L_5D64                  ; 5C61   0004 015C 0164

        B       L_5CA0                          ; 5C64   0200 003A

        MVII    #$03C0, R0                      ; 5C66   02B8 03C0

        JSR     R5,     L_5D0A                  ; 5C68   0004 015C 010A

        MOVR    R3,     R4                      ; 5C6B   009C
        SDBD                                    ; 5C6C   0001
        MVI@    R4,     R0                      ; 5C6D   02A0
        CMPI    #$0340, R0                      ; 5C6E   0378 0340
        BLE     L_5C84                          ; 5C70   0206 0012

        JSR     R5,     L_5D15                  ; 5C72   0004 015C 0115

        MVI     G_01CE, R0                      ; 5C75   0280 01CE
        SUB     G_015D, R0                      ; 5C77   0300 015D
        SUB     G_015D, R0                      ; 5C79   0300 015D
        CMPI    #$0005, R0                      ; 5C7B   0378 0005
        BGT     L_5CA0                          ; 5C7D   020E 0021

        MVII    #$0004, R0                      ; 5C7F   02B8 0004
        MVO@    R0,     R1                      ; 5C81   0248
        B       L_5CA0                          ; 5C82   0200 001C

L_5C84:
        MVII    #$0005, R0                      ; 5C84   02B8 0005
        NEGR    R0                              ; 5C86   0020

        JSR     R5,     L_5CCC                  ; 5C87   0004 015C 00CC
        JSR     R5,     L_5D15                  ; 5C8A   0004 015C 0115

        PULR    R0                              ; 5C8D   02B0
        PSHR    R0                              ; 5C8E   0270
        PSHR    R1                              ; 5C8F   0271
        PSHR    R3                              ; 5C90   0273

        JSR     R5,     L_5768                  ; 5C91   0004 0154 0368

        PULR    R3                              ; 5C94   02B3
        PULR    R1                              ; 5C95   02B1
        B       L_5CA0                          ; 5C96   0200 0008

        JSR     R5,     L_5D64                  ; 5C98   0004 015C 0164

        MVII    #$0200, R0                      ; 5C9B   02B8 0200

        JSR     R5,     L_5D0A                  ; 5C9D   0004 015C 010A

L_5CA0:
        MOVR    R3,     R4                      ; 5CA0   009C
        ADDI    #$0006, R4                      ; 5CA1   02FC 0006
        MVI     G_01CB, R0                      ; 5CA3   0280 01CB
        MVO@    R0,     R4                      ; 5CA5   0260
        MVI     G_01CC, R0                      ; 5CA6   0280 01CC
        MVO@    R0,     R4                      ; 5CA8   0260
        MVI     G_01CD, R0                      ; 5CA9   0280 01CD
        MVO@    R0,     R4                      ; 5CAB   0260
        MVI@    R1,     R0                      ; 5CAC   0288
        CMPI    #$0004, R0                      ; 5CAD   0378 0004
        BLT     L_5CBC                          ; 5CAF   0205 000B

        SUBI    #$0009, R4                      ; 5CB1   033C 0009
        SDBD                                    ; 5CB3   0001
        MVI@    R4,     R0                      ; 5CB4   02A0
        SUBI    #$0340, R0                      ; 5CB5   0338 0340
        RLC     R0,     1                       ; 5CB7   0050
        MVII    #$0004, R0                      ; 5CB8   02B8 0004
        ADCR    R0                              ; 5CBA   0028
        MVO@    R0,     R1                      ; 5CBB   0248
L_5CBC:
        PULR    R0                              ; 5CBC   02B0
        PULR    R7                              ; 5CBD   02B7

L_5CBE:
        MOVR    R3,     R4                      ; 5CBE   009C
        ADDI    #$0007, R3                      ; 5CBF   02FB 0007
        MVII    #$01CC, R2                      ; 5CC1   02BA 01CC
        B       L_5CE1                          ; 5CC3   0200 001C

L_5CC5:
        MOVR    R3,     R4                      ; 5CC5   009C
        ADDI    #$0008, R3                      ; 5CC6   02FB 0008
        MVII    #$01CD, R2                      ; 5CC8   02BA 01CD
        B       L_5CE1                          ; 5CCA   0200 0015

L_5CCC:
        MOVR    R3,     R4                      ; 5CCC   009C
        NEGR    R0                              ; 5CCD   0020
        MVI     G_017B, R2                      ; 5CCE   0282 017B
        ADDR    R2,     R0                      ; 5CD0   00D0
        ADDI    #$0003, R2                      ; 5CD1   02FA 0003
        CMPI    #$0073, R2                      ; 5CD3   037A 0073
        BGE     L_5CD9                          ; 5CD5   020D 0002

        MVII    #$0073, R2                      ; 5CD7   02BA 0073
L_5CD9:
        CMPR    R2,     R0                      ; 5CD9   0150
        BLE     L_5CDD                          ; 5CDA   0206 0001

        MOVR    R2,     R0                      ; 5CDC   0090
L_5CDD:
        ADDI    #$0006, R3                      ; 5CDD   02FB 0006
        MVII    #$01CB, R2                      ; 5CDF   02BA 01CB
L_5CE1:
        PSHR    R5                              ; 5CE1   0275
        PSHR    R1                              ; 5CE2   0271
        PSHR    R4                              ; 5CE3   0274
        MOVR    R0,     R1                      ; 5CE4   0081
        MVI@    R3,     R0                      ; 5CE5   0298
        MVII    #$0028, R3                      ; 5CE6   02BB 0028
        MVI     G_0161, R4                      ; 5CE8   0284 0161
        DECR    R4                              ; 5CEA   0014
        BNEQ    L_5CEE                          ; 5CEB   020C 0001

        SLL     R3,     1                       ; 5CED   004B
L_5CEE:
        CMPI    #$01CB, R2                      ; 5CEE   037A 01CB
        BNEQ    L_5CF6                          ; 5CF0   020C 0004

        MVII    #$0010, R3                      ; 5CF2   02BB 0010
        B       L_5CF9                          ; 5CF4   0200 0003

L_5CF6:
        JSR     R5,     X_EXT_SIGN_LO           ; 5CF6   0004 0114 0268

L_5CF9:
        ADDR    R3,     R0                      ; 5CF9   00D8
        CMPR    R0,     R1                      ; 5CFA   0141
        BLT     L_5D00                          ; 5CFB   0205 0003

        MOVR    R0,     R1                      ; 5CFD   0081
        B       L_5D06                          ; 5CFE   0200 0006

L_5D00:
        SUBR    R3,     R0                      ; 5D00   0118
        SUBR    R3,     R0                      ; 5D01   0118
        CMPR    R0,     R1                      ; 5D02   0141
        BGE     L_5D06                          ; 5D03   020D 0001

        MOVR    R0,     R1                      ; 5D05   0081
L_5D06:
        MVO@    R1,     R2                      ; 5D06   0251
        PULR    R3                              ; 5D07   02B3
        PULR    R1                              ; 5D08   02B1
        PULR    R7                              ; 5D09   02B7

L_5D0A:
        PSHR    R5                              ; 5D0A   0275
        MOVR    R3,     R4                      ; 5D0B   009C
        SDBD                                    ; 5D0C   0001
        MVI@    R4,     R2                      ; 5D0D   02A2
        SUBR    R2,     R0                      ; 5D0E   0110
        SAR     R0,     2                       ; 5D0F   006C
        SAR     R0,     2                       ; 5D10   006C

        JSR     R5,     L_5CCC                  ; 5D11   0004 015C 00CC

        PULR    R7                              ; 5D14   02B7

L_5D15:
        PSHR    R5                              ; 5D15   0275
        PSHR    R1                              ; 5D16   0271
        MVII    #$0177, R4                      ; 5D17   02BC 0177
        SDBD                                    ; 5D19   0001
        MVI@    R4,     R0                      ; 5D1A   02A0
        MOVR    R3,     R5                      ; 5D1B   009D
        ADDI    #$0002, R5                      ; 5D1C   02FD 0002
        SDBD                                    ; 5D1E   0001
        SUB@    R5,     R0                      ; 5D1F   0328
        PSHR    R0                              ; 5D20   0270
        MOVR    R0,     R1                      ; 5D21   0081
        BPL     L_5D25                          ; 5D22   0203 0001

        NEGR    R1                              ; 5D24   0021
L_5D25:
        SDBD                                    ; 5D25   0001
        MVI@    R4,     R0                      ; 5D26   02A0
        SDBD                                    ; 5D27   0001
        SUB@    R5,     R0                      ; 5D28   0328
        PSHR    R0                              ; 5D29   0270
        BPL     L_5D2D                          ; 5D2A   0203 0001

        NEGR    R0                              ; 5D2C   0020
L_5D2D:
        CMPR    R0,     R1                      ; 5D2D   0141
        BGT     L_5D32                          ; 5D2E   020E 0002

        SLR     R1,     1                       ; 5D30   0061
        INCR    R7                              ; 5D31   000F

L_5D32:
        SLR     R0,     1                       ; 5D32   0060
L_5D33:
        ADDR    R1,     R0                      ; 5D33   00C8
        SLR     R0,     2                       ; 5D34   0064
        SLR     R0,     2                       ; 5D35   0064
        SLR     R0,     1                       ; 5D36   0060
        MVO     R0,     G_01CE                  ; 5D37   0240 01CE
        PULR    R2                              ; 5D39   02B2
        PULR    R0                              ; 5D3A   02B0
        SAR     R0,     1                       ; 5D3B   0068
        SAR     R2,     1                       ; 5D3C   006A
        MVI     G_0161, R5                      ; 5D3D   0285 0161
        DECR    R5                              ; 5D3F   0015
        BEQ     L_5D44                          ; 5D40   0204 0002

        SAR     R0,     1                       ; 5D42   0068
        SAR     R2,     1                       ; 5D43   006A
L_5D44:
        MVI     G_015F, R1                      ; 5D44   0281 015F

        JSR     R5,     L_5D56                  ; 5D46   0004 015C 0156

        PSHR    R2                              ; 5D49   0272

        JSR     R5,     L_5CBE                  ; 5D4A   0004 015C 00BE

        PULR    R0                              ; 5D4D   02B0

        JSR     R5,     L_5D56                  ; 5D4E   0004 015C 0156
        JSR     R5,     L_5CC5                  ; 5D51   0004 015C 00C5

        PULR    R1                              ; 5D54   02B1
        PULR    R7                              ; 5D55   02B7

L_5D56:
        PSHR    R1                              ; 5D56   0271
        TSTR    R0                              ; 5D57   0080
        BPL     L_5D5E                          ; 5D58   0203 0004

        NEGR    R1                              ; 5D5A   0021
        CMPR    R0,     R1                      ; 5D5B   0141
        B       L_5D5F                          ; 5D5C   0200 0001

L_5D5E:
        CMPR    R1,     R0                      ; 5D5E   0148
L_5D5F:
        BLE     L_5D62                          ; 5D5F   0206 0001

        MOVR    R1,     R0                      ; 5D61   0088
L_5D62:
        PULR    R1                              ; 5D62   02B1
        MOVR    R5,     R7                      ; 5D63   00AF

L_5D64:
        PSHR    R5                              ; 5D64   0275
        PSHR    R1                              ; 5D65   0271
        MOVR    R3,     R4                      ; 5D66   009C
        ADDI    #$0002, R4                      ; 5D67   02FC 0002
        SDBD                                    ; 5D69   0001
        MVI@    R4,     R2                      ; 5D6A   02A2
        SDBD                                    ; 5D6B   0001
        MVI@    R4,     R0                      ; 5D6C   02A0
        MOVR    R7,     R4                      ; 5D6D   00BC
        ADDI    #$004B, R4                      ; 5D6E   02FC 004B

        JSR     R5,     L_5DAC                  ; 5D70   0004 015C 01AC

        MOVR    R0,     R2                      ; 5D73   0082
        MOVR    R1,     R0                      ; 5D74   0088
        MOVR    R7,     R4                      ; 5D75   00BC
        ADDI    #$0046, R4                      ; 5D76   02FC 0046

        JSR     R5,     L_5DAC                  ; 5D78   0004 015C 01AC

        INCR    R1                              ; 5D7B   0009
        ADDR    R7,     R1                      ; 5D7C   00F9
        ADD@    R1,     R7                      ; 5D7D   02CF

        DECLE   $0005                           ; 5D7E   0005

        ADCR    R4                              ; 5D7F   002C
        INCR    R4                              ; 5D80   000C
        NEGR    R0                              ; 5D81   0020
        COMR    R0                              ; 5D82   0018
        MVII    #$0028, R0                      ; 5D83   02B8 0028

        JSR     R5,     L_5CC5                  ; 5D85   0004 015C 00C5

        B       L_5DAA                          ; 5D88   0200 0020

        CMPI    #$0001, R0                      ; 5D8A   0378 0001
        BEQ     L_5DAA                          ; 5D8C   0204 001C

        MVII    #$0028, R0                      ; 5D8E   02B8 0028
        NEGR    R0                              ; 5D90   0020

        JSR     R5,     L_5CC5                  ; 5D91   0004 015C 00C5

        B       L_5DAA                          ; 5D94   0200 0014

        MOVR    R0,     R1                      ; 5D96   0081
        MVII    #$0028, R0                      ; 5D97   02B8 0028
        NEGR    R0                              ; 5D99   0020

        JSR     R5,     L_5CC5                  ; 5D9A   0004 015C 00C5

        MOVR    R1,     R0                      ; 5D9D   0088
        CMPI    #$0001, R0                      ; 5D9E   0378 0001
        BEQ     L_5DAA                          ; 5DA0   0204 0008

        MVII    #$0028, R0                      ; 5DA2   02B8 0028
        BLT     L_5DA7                          ; 5DA4   0205 0001

        NEGR    R0                              ; 5DA6   0020

L_5DA7:
        JSR     R5,     L_5CBE                  ; 5DA7   0004 015C 00BE

L_5DAA:
        PULR    R1                              ; 5DAA   02B1
        PULR    R7                              ; 5DAB   02B7

L_5DAC:
        CLRR    R1                              ; 5DAC   01C9
        SAR     R2,     2                       ; 5DAD   006E
        SAR     R2,     2                       ; 5DAE   006E
        SAR     R2,     2                       ; 5DAF   006E
        ADDI    #$000A, R2                      ; 5DB0   02FA 000A
L_5DB2:
        CMP@    R4,     R2                      ; 5DB2   0362
        BLE     L_5DB8                          ; 5DB3   0206 0003

        INCR    R1                              ; 5DB5   0009
        B       L_5DB2                          ; 5DB6   0220 0005
L_5DB8:
        MOVR    R5,     R7                      ; 5DB8   00AF

        DECLE   $0002,  $0012,  $03FF,  $0000   ; 5DB9   0002 0012 03FF 0000
        DECLE   $000B,  $000F,  $0013,  $03FF   ; 5DBD   000B 000F 0013 03FF
L_5DC1:
        PSHR    R5                              ; 5DC1   0275
        MVI     G_01D8, R0                      ; 5DC2   0280 01D8
        TSTR    R0                              ; 5DC4   0080
        BNEQ    L_5DCA                          ; 5DC5   020C 0003

        JSR     R5,     L_5DE1                  ; 5DC7   0004 015C 01E1
L_5DCA:
        JSR     R5,     L_5E66                  ; 5DCA   0004 015C 0266

        MVI     G_01D1, R0                      ; 5DCD   0280 01D1
        INCR    R0                              ; 5DCF   0008
        MVO     R0,     G_01D1                  ; 5DD0   0240 01D1
        MVI     G_0161, R5                      ; 5DD2   0285 0161
        DECR    R5                              ; 5DD4   0015
        BEQ     L_5DDA                          ; 5DD5   0204 0003

        SARC    R0,     1                       ; 5DD7   0078
        BC      L_5E65                          ; 5DD8   0201 008B

L_5DDA:
        ANDI    #$0001, R0                      ; 5DDA   03B8 0001
        ADDI    #$0002, R0                      ; 5DDC   02F8 0002

        JSR     R5,     L_5C11                  ; 5DDE   0004 015C 0011

L_5DE1:
        PSHR    R5                              ; 5DE1   0275
        MVI     G_01D3, R0                      ; 5DE2   0280 01D3
        TSTR    R0                              ; 5DE4   0080
        BEQ     L_5DF6                          ; 5DE5   0204 000F

        MVII    #$01D9, R4                      ; 5DE7   02BC 01D9
        MOVR    R4,     R5                      ; 5DE9   00A5
        SDBD                                    ; 5DEA   0001
        MVI@    R4,     R0                      ; 5DEB   02A0
        DECR    R0                              ; 5DEC   0010
        MVO@    R0,     R5                      ; 5DED   0268
        SWAP    R0,     1                       ; 5DEE   0040
        MVO@    R0,     R5                      ; 5DEF   0268
        BPL     L_5E65                          ; 5DF0   0203 0073

        CLRR    R0                              ; 5DF2   01C0
        MVO     R0,     G_01D4                  ; 5DF3   0240 01D4
        PULR    R7                              ; 5DF5   02B7

L_5DF6:
        MVI     G_01DB, R0                      ; 5DF6   0280 01DB
        DECR    R0                              ; 5DF8   0010
        MVO     R0,     G_01DB                  ; 5DF9   0240 01DB
        BPL     L_5E65                          ; 5DFB   0203 0068

        MVII    #$00C8, R0                      ; 5DFD   02B8 00C8

        JSR     R5,     X_RAND2                 ; 5DFF   0004 0114 029E

        ADDI    #$0032, R0                      ; 5E02   02F8 0032
        MVO     R0,     G_01DB                  ; 5E04   0240 01DB
        MVII    #$00E8, R0                      ; 5E06   02B8 00E8
        MVO     R0,     G_01D9                  ; 5E08   0240 01D9
        MVII    #$0003, R0                      ; 5E0A   02B8 0003
        MVO     R0,     G_01DA                  ; 5E0C   0240 01DA
        MVII    #$0002, R0                      ; 5E0E   02B8 0002
        MVO     R0,     G_01D4                  ; 5E10   0240 01D4
        MVO     R0,     G_01D3                  ; 5E12   0240 01D3
        MOVR    R0,     R3                      ; 5E14   0083
        MVII    #$032D, R2                      ; 5E15   02BA 032D
        MVII    #$0187, R4                      ; 5E17   02BC 0187
        MVII    #$01CF, R5                      ; 5E19   02BD 01CF
L_5E1B:
        CLRR    R0                              ; 5E1B   01C0
        MVO@    R0,     R5                      ; 5E1C   0268
        PSHR    R5                              ; 5E1D   0275
        MVII    #$0040, R0                      ; 5E1E   02B8 0040
        MVO@    R0,     R4                      ; 5E20   0260
        MVII    #$0004, R0                      ; 5E21   02B8 0004
        MVO@    R0,     R4                      ; 5E23   0260
        SDBD                                    ; 5E24   0001
        MVII    #$0580, R0                      ; 5E25   02B8 0080 0005

        JSR     R5,     X_RAND2                 ; 5E28   0004 0114 029E

        SUBI    #$02C0, R0                      ; 5E2B   0338 02C0
        MVO@    R0,     R4                      ; 5E2D   0260
        SWAP    R0,     1                       ; 5E2E   0040
        MVO@    R0,     R4                      ; 5E2F   0260
        MVII    #$0080, R0                      ; 5E30   02B8 0080

        JSR     R5,     X_RAND2                 ; 5E32   0004 0114 029E

        ADDI    #$01C0, R0                      ; 5E35   02F8 01C0
        MVO@    R0,     R4                      ; 5E37   0260
        SWAP    R0,     1                       ; 5E38   0040
        MVO@    R0,     R4                      ; 5E39   0260
        MVI     G_017B, R0                      ; 5E3A   0280 017B
        MVO@    R0,     R4                      ; 5E3C   0260
        CLRR    R0                              ; 5E3D   01C0
        MVO@    R0,     R4                      ; 5E3E   0260
        MVO@    R0,     R4                      ; 5E3F   0260
        SDBD                                    ; 5E40   0001
        MVII    #$5104, R1                      ; 5E41   02B9 0004 0051

        JSR     R5,     X_INIT_MOB              ; 5E44   0004 0114 02B2

        SDBD                                    ; 5E47   0001
        ADDI    #$000E, R1                      ; 5E48   02F9 000E 0000
        ADDI    #$0020, R2                      ; 5E4B   02FA 0020

        JSR     R5,     X_INIT_MOB              ; 5E4D   0004 0114 02B2

        SUBI    #$0018, R2                      ; 5E50   033A 0018
        PULR    R5                              ; 5E52   02B5
        DECR    R3                              ; 5E53   0013
        BNEQ    L_5E1B                          ; 5E54   022C 003A

        CLRR    R0                              ; 5E56   01C0
        MVO     R0,     G_01D6                  ; 5E57   0240 01D6
        MVII    #$0014, R0                      ; 5E59   02B8 0014

        JSR     R5,     X_RAND2                 ; 5E5B   0004 0114 029E

        INCR    R0                              ; 5E5E   0008
        MVO     R0,     G_01D5                  ; 5E5F   0240 01D5
        MVII    #$000A, R0                      ; 5E61   02B8 000A
        MVO     R0,     G_01D7                  ; 5E63   0240 01D7
L_5E65:
        PULR    R7                              ; 5E65   02B7

L_5E66:
        PSHR    R5                              ; 5E66   0275
        MVI     G_01D3, R0                      ; 5E67   0280 01D3
        TSTR    R0                              ; 5E69   0080
        BEQ     L_5E65                          ; 5E6A   0224 0006

        MVI     G_01D5, R0                      ; 5E6C   0280 01D5
        DECR    R0                              ; 5E6E   0010
        BMI     L_5EA9                          ; 5E6F   020B 0038

        MVO     R0,     G_01D5                  ; 5E71   0240 01D5
        BNEQ    L_5EA9                          ; 5E73   020C 0034

        MVI     G_01D6, R1                      ; 5E75   0281 01D6
        MOVR    R1,     R3                      ; 5E77   008B
        MVII    #$01D0, R2                      ; 5E78   02BA 01D0
        INCR    R1                              ; 5E7A   0009
        ADDR    R7,     R1                      ; 5E7B   00F9
        ADD@    R1,     R7                      ; 5E7C   02CF

        DIS                                     ; 5E7D   0003
        INCR    R3                              ; 5E7E   000B
        NEGR    R6                              ; 5E7F   0026
        INCR    R3                              ; 5E80   000B
        MVO     R3,     G_01D6                  ; 5E81   0243 01D6
        MVII    #$0003, R0                      ; 5E83   02B8 0003

        JSR     R5,     L_5ED6                  ; 5E85   0004 015C 02D6

        MVII    #$0004, R0                      ; 5E88   02B8 0004

        JSR     R5,     L_5EE3                  ; 5E8A   0004 015C 02E3

        BC      L_5E95                          ; 5E8D   0201 0006

        MVII    #$0001, R0                      ; 5E8F   02B8 0001
        MVO     R0,     G_01D5                  ; 5E91   0240 01D5
        B       L_5EA9                          ; 5E93   0200 0014

L_5E95:
        MVII    #$001E, R0                      ; 5E95   02B8 001E

        JSR     R5,     X_RAND2                 ; 5E97   0004 0114 029E

        ADDI    #$000A, R0                      ; 5E9A   02F8 000A
        MVO     R0,     G_01D5                  ; 5E9C   0240 01D5
        INCR    R3                              ; 5E9E   000B
        MVO     R3,     G_01D6                  ; 5E9F   0243 01D6
        B       L_5EA9                          ; 5EA1   0200 0006

        DECR    R2                              ; 5EA3   0012
        MVII    #$0003, R0                      ; 5EA4   02B8 0003

        JSR     R5,     L_5ED6                  ; 5EA6   0004 015C 02D6

L_5EA9:
        MVII    #$01CF, R2                      ; 5EA9   02BA 01CF
        MVII    #$0005, R0                      ; 5EAB   02B8 0005

        JSR     R5,     L_5EE3                  ; 5EAD   0004 015C 02E3

        BC      L_5EC4                          ; 5EB0   0201 0012

        INCR    R2                              ; 5EB2   000A

        JSR     R5,     L_5EE3                  ; 5EB3   0004 015C 02E3

        BNC     L_5E65                          ; 5EB6   0229 0052

        MVII    #$0006, R0                      ; 5EB8   02B8 0006

        JSR     R5,     X_RAND1                 ; 5EBA   0004 0114 027D

        TSTR    R0                              ; 5EBD   0080
        BNEQ    L_5E65                          ; 5EBE   022C 005A

        MVII    #$0001, R0                      ; 5EC0   02B8 0001
        B       L_5ED3                          ; 5EC2   0200 000F

L_5EC4:
        MVI     G_01D7, R0                      ; 5EC4   0280 01D7
        DECR    R0                              ; 5EC6   0010
        MVO     R0,     G_01D7                  ; 5EC7   0240 01D7
        BNEQ    L_5E65                          ; 5EC9   022C 0065

        MVII    #$01CF, R2                      ; 5ECB   02BA 01CF
        MVII    #$0001, R0                      ; 5ECD   02B8 0001

        JSR     R5,     L_5ED6                  ; 5ECF   0004 015C 02D6

        INCR    R2                              ; 5ED2   000A
L_5ED3:
        PULR    R5                              ; 5ED3   02B5
        B       L_5ED6                          ; 5ED4   0200 0000

L_5ED6:
        PSHR    R1                              ; 5ED6   0271
        MVI@    R2,     R1                      ; 5ED7   0291
        CMPI    #$0002, R1                      ; 5ED8   0379 0002
        BEQ     L_5EE1                          ; 5EDA   0204 0005

        CMPI    #$0001, R1                      ; 5EDC   0379 0001
        BEQ     L_5EE1                          ; 5EDE   0204 0001

        MVO@    R0,     R2                      ; 5EE0   0250
L_5EE1:
        PULR    R1                              ; 5EE1   02B1
        MOVR    R5,     R7                      ; 5EE2   00AF

L_5EE3:
        PSHR    R5                              ; 5EE3   0275
        MVI@    R2,     R5                      ; 5EE4   0295
        CMPI    #$0002, R5                      ; 5EE5   037D 0002
        BEQ     L_5EF2                          ; 5EE7   0204 0009

        CMPI    #$0001, R5                      ; 5EE9   037D 0001
        BEQ     L_5EF2                          ; 5EEB   0204 0005

        CMPR    R0,     R5                      ; 5EED   0145
        BEQ     L_5EF2                          ; 5EEE   0204 0002

        CLRC                                    ; 5EF0   0006
        PULR    R7                              ; 5EF1   02B7

L_5EF2:
        SETC                                    ; 5EF2   0007
        PULR    R7                              ; 5EF3   02B7

L_5EF4:
        PSHR    R5                              ; 5EF4   0275
        MVI     G_01DE, R0                      ; 5EF5   0280 01DE
        TSTR    R0                              ; 5EF7   0080
        BEQ     L_5F0E                          ; 5EF8   0204 0014

        JSR     R5,     L_5F5D                  ; 5EFA   0004 015C 035D

        MVI     G_01DC, R0                      ; 5EFD   0280 01DC
        DECR    R0                              ; 5EFF   0010
        BPL     L_5F05                          ; 5F00   0203 0003

        JSR     R5,     L_5F0F                  ; 5F02   0004 015C 030F

L_5F05:
        MVO     R0,     G_01DC                  ; 5F05   0240 01DC
        CMPI    #$0008, R0                      ; 5F07   0378 0008
        BNEQ    L_5F0E                          ; 5F09   020C 0003

        JSR     R5,     L_5923                  ; 5F0B   0004 0158 0123

L_5F0E:
        PULR    R7                              ; 5F0E   02B7

L_5F0F:
        PSHR    R5                              ; 5F0F   0275
        MVII    #$0345, R2                      ; 5F10   02BA 0345
        MOVR    R7,     R1                      ; 5F12   00B9
        ADDI    #$0020, R1                      ; 5F13   02F9 0020

        JSR     R5,     X_INIT_MOB              ; 5F15   0004 0114 02B2

        MVO     R2,     G_01DD                  ; 5F18   0242 01DD
        MVI     G_01E0, R0                      ; 5F1A   0280 01E0
        DECR    R0                              ; 5F1C   0010
        BPL     L_5F21                          ; 5F1D   0203 0002

        MVII    #$0004, R0                      ; 5F1F   02B8 0004
L_5F21:
        MVO     R0,     G_01E0                  ; 5F21   0240 01E0

        JSR     R5,     X_POW2                  ; 5F23   0004 0114 0345

        MVO     R0,     G_01E1                  ; 5F26   0240 01E1
        AND     G_01DF, R0                      ; 5F28   0380 01DF
        BEQ     L_5F30                          ; 5F2A   0204 0004

        MVII    #$0030, R0                      ; 5F2C   02B8 0030
        SWAP    R0,     1                       ; 5F2E   0040
        MVO@    R0,     R2                      ; 5F2F   0250
L_5F30:
        MVII    #$0060, R0                      ; 5F30   02B8 0060
        PULR    R7                              ; 5F32   02B7

        DECLE   $0002,  $0038,  $0054,  $005F   ; 5F33   0002 0038 0054 005F
        DECLE   $0000,  $0054,  $0000,  $0000   ; 5F37   0000 0054 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F3B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0043,  $005F   ; 5F3F   0000 0000 0043 005F
        DECLE   $0000,  $0037,  $0001,  $0039   ; 5F43   0000 0037 0001 0039
        DECLE   $0001,  $003C,  $0001,  $0041   ; 5F47   0001 003C 0001 0041
        DECLE   $0002,  $0047,  $0002,  $004D   ; 5F4B   0002 0047 0002 004D
        DECLE   $0003,  $0059,  $0003,  $0065   ; 5F4F   0003 0059 0003 0065
        DECLE   $0004,  $0000,  $0000,  $00A4   ; 5F53   0004 0000 0000 00A4
        DECLE   $005F,  $0006,  $0000           ; 5F57   005F 0006 0000

        EIS                                     ; 5F5A   0002
        MOVR    R7,     R5                      ; 5F5B   00BD
        CMPR    R3,     R7                      ; 5F5C   015F
L_5F5D:
        PSHR    R5                              ; 5F5D   0275
        MVI     G_01DD, R1                      ; 5F5E   0281 01DD
        TSTR    R1                              ; 5F60   0089
        BEQ     L_5F0E                          ; 5F61   0224 0054

        MVI     G_034C, R4                      ; 5F63   0284 034C
        MVI@    R4,     R2                      ; 5F65   02A2
        CMPI    #$0004, R2                      ; 5F66   037A 0004
        BEQ     L_5F73                          ; 5F68   0204 0009

        MVI@    R4,     R3                      ; 5F6A   02A3
        SWAP    R3,     1                       ; 5F6B   0043
        MVO     R4,     G_034C                  ; 5F6C   0244 034C
        MVO     R2,     G_034A                  ; 5F6E   0242 034A
        MVO     R3,     G_0348                  ; 5F70   0243 0348
        PULR    R7                              ; 5F72   02B7

L_5F73:
        CLRR    R0                              ; 5F73   01C0
        MVO     R0,     G_01DD                  ; 5F74   0240 01DD
        MVII    #$0345, R1                      ; 5F76   02B9 0345
        MVI@    R1,     R0                      ; 5F78   0288
        SDBD                                    ; 5F79   0001
        CMPI    #$3000, R0                      ; 5F7A   0378 0000 0030
        BEQ     L_5F8B                          ; 5F7D   0204 000C

        MVI     G_016D, R0                      ; 5F7F   0280 016D
        CMPI    #$0008, R0                      ; 5F81   0378 0008
        BNEQ    L_5F8B                          ; 5F83   020C 0006

        MVI     G_016F, R0                      ; 5F85   0280 016F
        CMPI    #$0002, R0                      ; 5F87   0378 0002
        BGE     L_5F8F                          ; 5F89   020D 0004

L_5F8B:
        CLRR    R0                              ; 5F8B   01C0
        MVO     R0,     G_0345                  ; 5F8C   0240 0345
        PULR    R7                              ; 5F8E   02B7

L_5F8F:
        SDBD                                    ; 5F8F   0001
        MVII    #$3002, R0                      ; 5F90   02B8 0002 0030
        MVO     R0,     G_0345                  ; 5F93   0240 0345
        MVII    #$0090, R0                      ; 5F95   02B8 0090
        MVO     R0,     G_0349                  ; 5F97   0240 0349
        MVII    #$0003, R0                      ; 5F99   02B8 0003
        MVO     R0,     G_034B                  ; 5F9B   0240 034B
        CLRR    R0                              ; 5F9D   01C0
        MVO     R0,     G_01DE                  ; 5F9E   0240 01DE

        JSR     R5,     L_5938                  ; 5FA0   0004 0158 0138

        PULR    R7                              ; 5FA3   02B7

        ADDI    #$0004, R1                      ; 5FA4   02F9 0004
        MVI@    R1,     R2                      ; 5FA6   028A
        ADDI    #$0020, R2                      ; 5FA7   02FA 0020
        MVO@    R2,     R1                      ; 5FA9   024A
        INCR    R1                              ; 5FAA   0009
        MVI@    R1,     R2                      ; 5FAB   028A
        DECR    R2                              ; 5FAC   0012
        BMI     L_5FB7                          ; 5FAD   020B 0008

        MVO@    R2,     R1                      ; 5FAF   024A
        INCR    R1                              ; 5FB0   0009
        NEGR    R2                              ; 5FB1   0022
        SLL     R2,     1                       ; 5FB2   004A
        ADDI    #$000B, R2                      ; 5FB3   02FA 000B
        MVO@    R2,     R1                      ; 5FB5   024A
        MOVR    R5,     R7                      ; 5FB6   00AF

L_5FB7:
        CLRR    R0                              ; 5FB7   01C0
        MVO     R0,     G_01D3                  ; 5FB8   0240 01D3
        J       L_59FF                          ; 5FBA   0004 0358 01FF

        PSHR    R5                              ; 5FBD   0275
        MVI     G_0325, R3                      ; 5FBE   0283 0325
        SDBD                                    ; 5FC0   0001
        CMPI    #$B88E, R3                      ; 5FC1   037B 008E 00B8
        BNEQ    L_5FF9                          ; 5FC4   020C 0033

        MVII    #$0030, R2                      ; 5FC6   02BA 0030
        SWAP    R2,     1                       ; 5FC8   0042
        MVO@    R2,     R1                      ; 5FC9   024A

        JSR     R5,     L_5887                  ; 5FCA   0004 0158 0087

        MVI     G_0162, R0                      ; 5FCD   0280 0162
        TSTR    R0                              ; 5FCF   0080
        MVII    #$0002, R2                      ; 5FD0   02BA 0002
        BNEQ    L_5FDF                          ; 5FD2   020C 000B

        MVI     G_01E1, R0                      ; 5FD4   0280 01E1
        XOR     G_01DF, R0                      ; 5FD6   03C0 01DF
        MVO     R0,     G_01DF                  ; 5FD8   0240 01DF
        MVI     G_01DE, R2                      ; 5FDA   0282 01DE
        DECR    R2                              ; 5FDC   0012
        MVO     R2,     G_01DE                  ; 5FDD   0242 01DE
L_5FDF:
        MOVR    R2,     R3                      ; 5FDF   0093
        MVII    #$0001, R0                      ; 5FE0   02B8 0001
        MVO     R0,     G_01C1                  ; 5FE2   0240 01C1
        MVII    #$0002, R0                      ; 5FE4   02B8 0002
        MVO     R0,     G_01C3                  ; 5FE6   0240 01C3
        MVII    #$0006, R0                      ; 5FE8   02B8 0006
        SUBR    R3,     R0                      ; 5FEA   0118
        MVO     R0,     G_01C4                  ; 5FEB   0240 01C4

        JSR     R5,     L_5B7D                  ; 5FED   0004 0158 037D

        TSTR    R3                              ; 5FF0   009B
        BNEQ    L_5FF6                          ; 5FF1   020C 0003

        JSR     R5,     L_5AB1                  ; 5FF3   0004 0158 02B1
L_5FF6:
        JSR     R5,     L_5907                  ; 5FF6   0004 0158 0107

L_5FF9:
        PULR    R7                              ; 5FF9   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5FFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5029       <entry>
;;  $5030       $503C  
;;  $5034       $5039  
;;  $503E       $502D  
;;  $504D       $5045  
;;  $5051       $504B  
;;  $5052       $504F  
;;  $505E       $5061  
;;  $5082       <entry>
;;  $50F3       $50C9   $50F9  
;;  $50FB       $50F5  
;;  $5103       $50FE  
;;  $514D       $5671   $5A00   $5AB2  
;;  $5181       <entry>
;;  $526E       $543B  
;;  $527A       $50A6  
;;  $527B       $5277  
;;  $529B       $5294  
;;  $52A6       $52C5   $52CC  
;;  $52AD       $52B5  
;;  $52C9       $52B9  
;;  $52CE       $52C7  
;;  $535C       $50C6  
;;  $5379       $536A  
;;  $537A       $5365  
;;  $537E       $5191  
;;  $5390       $538C  
;;  $539A       $5382   $538A  
;;  $539B       $5086  
;;  $539E       $53A5  
;;  $53AD       $53B2  
;;  $53B5       $539E   $5A80   $5BAA   $5C00  
;;  $53C0       $518B  
;;  $53C1       $5B53  
;;  $53D3       $53DF  
;;  $53DB       $53D7  
;;  $53E2       $5083  
;;  $53F0       $53EA  
;;  $5434       $5416  
;;  $543B       $5432  
;;  $5442       $5188  
;;  $545F       $5454   $545A  
;;  $546B       $5447   $544C  
;;  $5486       $5477  
;;  $54BD       $54BF  
;;  $54C5       $54B5  
;;  $54C8       $54AC  
;;  $54E5       $54D5  
;;  $54ED       $54D7   $54E1   $54FE  
;;  $54EE       $54D9  
;;  $54F5       $54EF  
;;  $54FC       $54DB  
;;  $550F       $54DD  
;;  $5517       $54DF  
;;  $551F       $5519  
;;  $5526       $54E3  
;;  $5539       $5528  
;;  $556A       $5561  
;;  $556D       $5551   $5568  
;;  $557C       $556E  
;;  $5587       $5545  
;;  $5598       $556B  
;;  $559C       $559A  
;;  $55CF       $55C9  
;;  $55DB       $55D7  
;;  $55DE       $55B2   $55B8   $55C0  
;;  $55E0       $55A8  
;;  $55F4       $55F7  
;;  $55F5       $55F2   $55F9  
;;  $5614       $560E  
;;  $5634       $560B   $5612   $561B  
;;  $5659       $5656  
;;  $565F       $565B  
;;  $5685       $566F  
;;  $568C       $5669  
;;  $56A5       $564C  
;;  $56B6       $56C4  
;;  $56B7       $56B5  
;;  $56C6       $5549   $554D   $5566   $56AD   $56E8  
;;  $56EE       $56CE  
;;  $56F9       $5603   $563B   $5696  
;;  $5742       $573F  
;;  $5749       $5746  
;;  $575F       $574E   $5759  
;;  $5763       $5760  
;;  $5767       $5764  
;;  $5768       $5C91  
;;  $5780       $5775  
;;  $5787       $576D  
;;  $579A       $5785  
;;  $57A7       $57A3  
;;  $57CA       $576F   $578B   $5792   $57A0  
;;  $57D6       $57CD  
;;  $57DC       $57D4  
;;  $57EA       $57E7  
;;  $57FF       $57D0   $57D8   $57EC  
;;  $5800       $5779   $577E  
;;  $5804       $57F4  
;;  $5812       $580A  
;;  $5821       $5810  
;;  $584C       $5685   $57F9  
;;  $5856       $584E  
;;  $5879       $5185  
;;  $5881       $587C   $589D  
;;  $5882       $5880  
;;  $5887       $5FCA  
;;  $588E       $56EA  
;;  $5897       $5885   $588C   $5893  
;;  $58A0       $5100   $5A08  
;;  $58A1       $589F  
;;  $58DC       $58B2   $58B7  
;;  $58DD       $57C7  
;;  $58EE       $5594   $5688   $57FC   $5804  
;;  $5900       <entry>
;;  $5906       $5975  
;;  $5907       $5FF6  
;;  $5923       $5F0B  
;;  $5937       $5927  
;;  $5938       $5FA0  
;;  $5947       $5A0B  
;;  $5962       $5B56  
;;  $5971       $5182  
;;  $598A       $537A   $5800  
;;  $59CE       $59CC  
;;  $59FF       $5FBA  
;;  $5A0B       $5A06  
;;  $5A13       $5A2A  
;;  $5A6A       $5A77  
;;  $5A7E       $5A8A  
;;  $5A80       $5A85  
;;  $5A93       $5A9D  
;;  $5AA6       $5AAB  
;;  $5AB1       $5FF3  
;;  $5ACB       $5BC9   $5C0A  
;;  $5B14       $5B0F  
;;  $5B31       $5B1E  
;;  $5B38       $5912  
;;  $5B4F       $5AEA   $5AF5   $5AFE   $5B04   $5B18   $5B2F   $5B3A   $5B45  
;;  $5B56       $5B4D  
;;  $5B59       $5194   $5AF7   $5B47  
;;  $5B62       $5B5E  
;;  $5B72       $5B6D  
;;  $5B75       $5B65   $5B69  
;;  $5B7D       $540F   $5FED  
;;  $5B88       $5B84  
;;  $5B99       $5B91   $5B96  
;;  $5B9F       $5B78  
;;  $5BA9       $5B26   $5B33  
;;  $5BAD       $5BC0  
;;  $5BBF       $5BBC  
;;  $5BC3       $5B11  
;;  $5BD4       $5BE3  
;;  $5BD8       $5BDD  
;;  $5BDF       $5BD9  
;;  $5C00       $5BED   $5C08   $5C0E  
;;  $5C11       $5DDE  
;;  $5C3C       $5C3A  
;;  $5C5A       $5C58  
;;  $5C84       $5C70  
;;  $5CA0       $5C45   $5C64   $5C7D   $5C82   $5C96  
;;  $5CBC       $5CAF  
;;  $5CBE       $5C22   $5C5E   $5D4A   $5DA7  
;;  $5CC5       $5C2C   $5C4A   $5D51   $5D85   $5D91   $5D9A  
;;  $5CCC       $5C30   $5C87   $5D11  
;;  $5CD9       $5CD5  
;;  $5CDD       $5CDA  
;;  $5CE1       $5CC3   $5CCA  
;;  $5CEE       $5CEB  
;;  $5CF6       $5CF0  
;;  $5CF9       $5CF4  
;;  $5D00       $5CFB  
;;  $5D06       $5CFE   $5D03  
;;  $5D0A       $5C42   $5C68   $5C9D  
;;  $5D15       $5C72   $5C8A  
;;  $5D25       $5D22  
;;  $5D2D       $5D2A  
;;  $5D32       $5D2E  
;;  $5D33       $5D31  
;;  $5D44       $5D40  
;;  $5D56       $56B9   $5D46   $5D4E  
;;  $5D5E       $5D58  
;;  $5D5F       $5D5C  
;;  $5D62       $5D5F  
;;  $5D64       $5C3D   $5C61   $5C98  
;;  $5DA7       $5DA4  
;;  $5DAA       $5D88   $5D8C   $5D94   $5DA0  
;;  $5DAC       $5D70   $5D78  
;;  $5DB2       $5DB6  
;;  $5DB8       $5DB3  
;;  $5DC1       $518E  
;;  $5DCA       $5DC5  
;;  $5DDA       $5DD5  
;;  $5DE1       $5DC7  
;;  $5DF6       $5DE5  
;;  $5E1B       $5E54  
;;  $5E65       $5DD8   $5DF0   $5DFB   $5E6A   $5EB6   $5EBE   $5EC9  
;;  $5E66       $5DCA  
;;  $5E95       $5E8D  
;;  $5EA9       $5E6F   $5E73   $5E93   $5EA1  
;;  $5EC4       $5EB0  
;;  $5ED3       $5EC2  
;;  $5ED6       $5E85   $5EA6   $5ECF   $5ED4  
;;  $5EE1       $5EDA   $5EDE  
;;  $5EE3       $5E8A   $5EAD   $5EB3  
;;  $5EF2       $5EE7   $5EEB   $5EEE  
;;  $5EF4       $527B  
;;  $5F05       $5F00  
;;  $5F0E       $5EF8   $5F09   $5F61  
;;  $5F0F       $5F02  
;;  $5F21       $5F1D  
;;  $5F30       $5F2A  
;;  $5F5D       $5EFA  
;;  $5F73       $5F68  
;;  $5F8B       $5F7D   $5F83  
;;  $5F8F       $5F89  
;;  $5FB7       $5FAD  
;;  $5FDF       $5FD2  
;;  $5FF6       $5FF1  
;;  $5FF9       $5FC4  
;; ======================================================================== ;;
