
        ORG     $5000
.HEADER:
        BIDECLE $5666           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5991           ; 5004  Ptr: Start of game
        BIDECLE $5071           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5044           ; 5008  Ptr: GRAM init sequence
        BIDECLE $528A           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0004           ; 5013  Border color init

        DECLE   $01A0,  $0190,  $01B0,  $01C0   ; 5014   01A0 0190 01B0 01C0
        DECLE   $01D0,  $0198,  $01E0,  $01F0   ; 5018   01D0 0198 01E0 01F0
.TIMER:
        DECLE   $0089,  $005D,  $0001,  $0000; 501C  Timer dispatch/interval
        DECLE   $00E3,  $005D,  $003C,  $0000; 5020  Timer dispatch/interval
        DECLE   $00AA,  $005D,  $0058,  $0002; 5024  Timer dispatch/interval
        DECLE   $0072,  $0055,  $0001,  $0000; 5028  Timer dispatch/interval
        DECLE   $009A,  $0052,  $000F,  $0000; 502C  Timer dispatch/interval
        BIDECLE $0000           ; 5030  End of timer table


        PSHR    R5                              ; 5032   0275
        SLR     R0,     2                       ; 5033   0064
        MVO     R0,     G_0188                  ; 5034   0240 0188
        MVII    #$0006, R0                      ; 5036   02B8 0006

        JSR     R5,     X_RAND1                 ; 5038   0004 0114 027D

        ADDI    #$0028, R0                      ; 503B   02F8 0028
        ADDI    #$0006, R1                      ; 503D   02F9 0006
        MVO@    R0,     R1                      ; 503F   0248

        JSR     R5,     L_55B0                  ; 5040   0004 0154 01B0

        PULR    R7                              ; 5043   02B7

.GRAM_INIT_5044:
        DECLE   $0032           ; 5044  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 5045  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 5047  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 5049  #10-17:  CART #10-17 ----
        DECLE   $0031,  $0280   ; 504B  #18-1D:  CART #18-1D ----
        DECLE   $02F1,  $0016   ; 504D  #1E   :  Algo #1
        DECLE   $0355,  $0086   ; 504F  #1F   :  Algo #1
        DECLE   $02D9,  $025E   ; 5051  #20   :  Algo #1
        DECLE   $0281,  $0156   ; 5053  #21   :  Algo #1
        DECLE   $02D5,  $0096   ; 5055  #22   :  Algo #1
        DECLE   $02D1,  $02AE   ; 5057  #23   :  Algo #1
        DECLE   $02D5,  $008E   ; 5059  #24   :  Algo #1
        DECLE   $03B5,  $02C6   ; 505B  #25   :  Algo #1
        DECLE   $02DD,  $03F6   ; 505D  #26   :  Algo #1
        DECLE   $0369,  $0086   ; 505F  #27   :  Algo #1
        DECLE   $0271,  $03AE   ; 5061  #28   :  Algo #1
        DECLE   $0235,  $008E   ; 5063  #29   :  Algo #1
        DECLE   $01C1,  $00C6   ; 5065  #2A   :  Algo #1
        DECLE   $021D,  $01EE   ; 5067  #2B   :  Algo #1
        DECLE   $0279,  $01C6   ; 5069  #2C   :  Algo #1
        DECLE   $037F,  $03E6   ; 506B  #2D   :  Algo #1
        DECLE   $013D,  $00C0   ; 506D  #2E-2F:  GRAM #1E-1F -Y--
        DECLE   $003D,  $0080   ; 506F  #30-31:  CART #1E-1F ----

.GFX_LIST_5071:
        DECLE   $0002,  $0001,  $0005,  $000B   ; 5071  CART PIC #00
        DECLE   $002D,  $009B,  $005D,  $007F   ; 5075  
        DECLE   $0000,  $0088,  $0056,  $0045   ; 5079  CART PIC #01
        DECLE   $00DA,  $006A,  $00DB,  $006D   ; 507D  
        DECLE   $0000,  $0000,  $0040,  $0080   ; 5081  CART PIC #02
        DECLE   $0050,  $0008,  $00B1,  $006A   ; 5085  
        DECLE   $0000,  $0000,  $000A,  $0026   ; 5089  CART PIC #03
        DECLE   $00AD,  $006B,  $00A9,  $00AA   ; 508D  
        DECLE   $0000,  $0080,  $0048,  $0058   ; 5091  CART PIC #04
        DECLE   $0092,  $00A4,  $00F5,  $00AD   ; 5095  
        DECLE   $00F5,  $00D2,  $00EA,  $007B   ; 5099  CART PIC #05
        DECLE   $00DD,  $007F,  $00FB,  $0097   ; 509D  
        DECLE   $00B9,  $00FC,  $00AD,  $00AB   ; 50A1  CART PIC #06
        DECLE   $00DD,  $006F,  $007F,  $00BE   ; 50A5  
        DECLE   $0000,  $0040,  $0070,  $00AA   ; 50A9  CART PIC #07
        DECLE   $00BD,  $00FF,  $00DA,  $00A4   ; 50AD  
        DECLE   $003F,  $007F,  $00FF,  $00FF   ; 50B1  CART PIC #08
        DECLE   $007F,  $003F,  $0007,  $0000   ; 50B5  
        DECLE   $0048,  $0023,  $004C,  $0015   ; 50B9  CART PIC #09
        DECLE   $0002,  $000A,  $0001,  $0004   ; 50BD  
        DECLE   $00D5,  $0029,  $00F6,  $008E   ; 50C1  CART PIC #0A
        DECLE   $003F,  $00F7,  $0061,  $0082   ; 50C5  
        DECLE   $0059,  $00DB,  $00FB,  $007F   ; 50C9  CART PIC #0B
        DECLE   $00FB,  $00FF,  $00DF,  $00FF   ; 50CD  
        DECLE   $00E0,  $00F8,  $00FC,  $00FE   ; 50D1  CART PIC #0C
        DECLE   $00FE,  $00FC,  $00F0,  $0000   ; 50D5  
        DECLE   $0077,  $00FA,  $00E8,  $0020   ; 50D9  CART PIC #0D
        DECLE   $0080,  $0000,  $0000,  $0000   ; 50DD  
        DECLE   $00FF,  $005F,  $0037,  $004D   ; 50E1  CART PIC #0E
        DECLE   $0015,  $0003,  $0000,  $0000   ; 50E5  
        DECLE   $00DF,  $0075,  $00DE,  $00FB   ; 50E9  CART PIC #0F
        DECLE   $007E,  $0075,  $00D2,  $0049   ; 50ED  
        DECLE   $00FB,  $00BF,  $00FF,  $00F5   ; 50F1  CART PIC #10
        DECLE   $00D0,  $0080,  $0000,  $0000   ; 50F5  
        DECLE   $003F,  $007F,  $00FF,  $007F   ; 50F9  CART PIC #11
        DECLE   $001F,  $003F,  $007F,  $009F   ; 50FD  
        DECLE   $0000,  $0010,  $0038,  $0038   ; 5101  CART PIC #12
        DECLE   $0038,  $0038,  $0038,  $0010   ; 5105  
        DECLE   $0010,  $0038,  $0038,  $0038   ; 5109  CART PIC #13
        DECLE   $0038,  $0038,  $0010,  $0010   ; 510D  
        DECLE   $0010,  $0014,  $0019,  $009A   ; 5111  CART PIC #14
        DECLE   $005A,  $007D,  $005D,  $00BD   ; 5115  
        DECLE   $00BA,  $0009,  $0000,  $0000   ; 5119  CART PIC #15
        DECLE   $0000,  $0000,  $0000,  $0000   ; 511D  
        DECLE   $0001,  $0007,  $001F,  $007F   ; 5121  CART PIC #16
        DECLE   $003F,  $001F,  $0007,  $0001   ; 5125  
        DECLE   $0000,  $0018,  $0004,  $0002   ; 5129  CART PIC #17
        DECLE   $00E3,  $001C,  $0008,  $0070   ; 512D  
        DECLE   $0000,  $0030,  $000C,  $0002   ; 5131  CART PIC #18
        DECLE   $0007,  $00FC,  $0008,  $0010   ; 5135  
        DECLE   $0040,  $0020,  $0020,  $0010   ; 5139  CART PIC #19
        DECLE   $00E8,  $001F,  $0010,  $0020   ; 513D  
        DECLE   $0000,  $00C0,  $00F0,  $00E0   ; 5141  CART PIC #1A
        DECLE   $00C0,  $009C,  $00E2,  $0081   ; 5145  
        DECLE   $0002,  $000C,  $0010,  $0020   ; 5149  CART PIC #1B
        DECLE   $004F,  $00F8,  $0010,  $000C   ; 514D  
        DECLE   $0000,  $0002,  $0004,  $0008   ; 5151  CART PIC #1C
        DECLE   $0013,  $00FC,  $0004,  $0002   ; 5155  
        DECLE   $0081,  $0042,  $0022,  $0034   ; 5159  CART PIC #1D
        DECLE   $001C,  $0000,  $0000,  $0000   ; 515D  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5161  CART PIC #1E
        DECLE   $0008,  $0030,  $0060,  $0060   ; 5165  
        DECLE   $0060,  $0030,  $0008,  $0000   ; 5169  CART PIC #1F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 516D  
L_5171:
        PSHR    R5                              ; 5171   0275
        SDBD                                    ; 5172   0001
        MVII    #$3600, R1                      ; 5173   02B9 0000 0036
        MVI     .BTAB.00,R0                     ; 5176   0280 0200
        ANDR    R1,     R0                      ; 5178   0188
        MOVR    R2,     R4                      ; 5179   0094
        SDBD                                    ; 517A   0001
        AND@    R4,     R1                      ; 517B   03A1
        CMPR    R0,     R1                      ; 517C   0141
        BEQ     L_5245                          ; 517D   0204 00C6

        JSR     R5,     L_5F53                  ; 517F   0004 015C 0353
        DECLE   $0000,  $0010,  $0020,  $0031   ; 5182   0000 0010 0020 0031
        DECLE   $0262,  $01E2,  $0242,  $0252   ; 5186   0262 01E2 0242 0252
        DECLE   $0031,  $0020,  $0030,  $0040   ; 518A   0031 0020 0030 0040
        DECLE   $0040,  $0000,  $0000,  $0050   ; 518E   0040 0000 0000 0050
        DECLE   $0060,  $0060,  $0050,  $0070   ; 5192   0060 0060 0050 0070
        DECLE   $0070,  $0020,  $0082,  $0302   ; 5196   0070 0020 0082 0302
        DECLE   $0302,  $0302,  $0202,  $0011   ; 519A   0302 0302 0202 0011
        DECLE   $0090,  $0050,  $0050,  $00A0   ; 519E   0090 0050 0050 00A0
        DECLE   $0050,  $0050,  $00B0,  $00B0   ; 51A2   0050 0050 00B0 00B0
        DECLE   $001D,  $0050,  $0050,  $0050   ; 51A6   001D 0050 0050 0050
        DECLE   $0060,  $0070,  $0020,  $0082   ; 51AA   0060 0070 0020 0082
        DECLE   $0272,  $0282,  $01F2,  $00C2   ; 51AE   0272 0282 01F2 00C2
        DECLE   $0090,  $00D0,  $0262,  $0232   ; 51B2   0090 00D0 0262 0232
        DECLE   $0252,  $00E0,  $00F0,  $0050   ; 51B6   0252 00E0 00F0 0050
        DECLE   $0060,  $00F0,  $0100,  $00D0   ; 51BA   0060 00F0 0100 00D0
        DECLE   $00E0,  $00D0,  $0090,  $0071   ; 51BE   00E0 00D0 0090 0071
        DECLE   $0112,  $0282,  $02E2,  $00C2   ; 51C2   0112 0282 02E2 00C2
        DECLE   $0090,  $00A0,  $00D0,  $0141   ; 51C6   0090 00A0 00D0 0141
        DECLE   $0030,  $0124,  $0031,  $0124   ; 51CA   0030 0124 0031 0124
        DECLE   $0134,  $0031,  $0124,  $0011   ; 51CE   0134 0031 0124 0011
        DECLE   $0020,  $0134,  $0124,  $0011   ; 51D2   0020 0134 0124 0011
        DECLE   $0000,  $0010,  $0040,  $0000   ; 51D6   0000 0010 0040 0000
        DECLE   $0060,  $0140,  $0124,  $0000   ; 51DA   0060 0140 0124 0000
        DECLE   $0040,  $0140,  $0140,  $0031   ; 51DE   0040 0140 0140 0031
        DECLE   $0140,  $0010,  $0140,  $0140   ; 51E2   0140 0010 0140 0140
        DECLE   $0140,  $0000,  $00B0,  $0060   ; 51E6   0140 0000 00B0 0060
        DECLE   $00B0,  $001D,  $00B0,  $0060   ; 51EA   00B0 001D 00B0 0060
        DECLE   $0140,  $0060,  $00B0,  $0060   ; 51EE   0140 0060 00B0 0060
        DECLE   $0060,  $0040,  $0011,  $0000   ; 51F2   0060 0040 0011 0000

        MOVR    R6,     R0                      ; 51F6   00B0
        MOVR    R6,     R0                      ; 51F7   00B0
        SLR     R0,     1                       ; 51F8   0060
        MOVR    R6,     R0                      ; 51F9   00B0
        SLR     R0,     1                       ; 51FA   0060
        SLR     R0,     1                       ; 51FB   0060
        COMR    R5                              ; 51FC   001D
        MOVR    R6,     R0                      ; 51FD   00B0
        ADCR    R5                              ; 51FE   002D
        SLR     R2,     2                       ; 51FF   0066
        RRC     R2,     2                       ; 5200   0076
        ADDR    R6,     R6                      ; 5201   00F6
        ADD     .STIC.A.7,R6                    ; 5202   02C6 0017
        ADD     .STIC.A.7,R6                    ; 5204   02C6 0017
        CMPR    R2,     R6                      ; 5206   0156
L_5207:
        DECR    R7                              ; 5207   0017

        CMPR    R2,     R6                      ; 5208   0156
        CMPR    R2,     R6                      ; 5209   0156
        ADD     .BTAB.C6,R6                     ; 520A   02C6 02C6
        CMPR    R2,     R6                      ; 520C   0156
        ADDR    R4,     R6                      ; 520D   00E6
        SUBR    R0,     R6                      ; 520E   0106
        SLR     R2,     2                       ; 520F   0066
        ADDR    R6,     R6                      ; 5210   00F6
        COMR    R5                              ; 5211   001D
        SUBR    R0,     R6                      ; 5212   0106
        ADDR    R2,     R6                      ; 5213   00D6
L_5214:
        DECR    R7                              ; 5214   0017

        DECLE   $0268,  $01E8,  $01E8,  $0218   ; 5215   0268 01E8 01E8 0218
        DECLE   $0248,  $0258,  $0027,  $0268   ; 5219   0248 0258 0027 0268
        DECLE   $02F8,  $0228,  $0238           ; 521D   02F8 0228 0238

        MVO@    R0,     R3                      ; 5220   0258
L_5221:
        DECR    R7                              ; 5221   0017

        DECLE   $00E6,  $0106,  $00E6,  $0027   ; 5222   00E6 0106 00E6 0027

        CMPR    R5,     R0                      ; 5226   0168
        CMPR    R7,     R2                      ; 5227   017A
        ANDR    R1,     R2                      ; 5228   018A
        CMPR    R7,     R2                      ; 5229   017A
        ANDR    R1,     R2                      ; 522A   018A
        CMPR    R7,     R2                      ; 522B   017A
        ANDR    R3,     R2                      ; 522C   019A
        ANDR    R5,     R0                      ; 522D   01A8
L_522E:
        DECR    R7                              ; 522E   0017

        DECLE   $0118,  $01BA,  $01BA,  $01CA   ; 522F   0118 01BA 01BA 01CA
        DECLE   $01CA,  $0208,  $0067,  $0298   ; 5233   01CA 0208 0067 0298
        DECLE   $02E8,  $01F8,  $02A8,  $02B8   ; 5237   02E8 01F8 02A8 02B8
        DECLE   $0278,  $00C8,  $01D8,  $0088   ; 523B   0278 00C8 01D8 0088
        DECLE   $02A8,  $02A8,  $01F8,  $0288   ; 523F   02A8 02A8 01F8 0288
        DECLE   $02D8,  $0037                   ; 5243   02D8 0037
L_5245:
        PULR    R7                              ; 5245   02B7

L_5246:
        PSHR    R5                              ; 5246   0275

        JSR     R5,     X_PLAY_SFX2             ; 5247   0004 0118 03BE
        DECLE   $0015                           ; 524A  SFX prio
        DECLE   $03E9                           ; 524B  SFX data
        DECLE   $0033,  $0018                   ; 524C  SFX data
        DECLE   $0003,  $0050                   ; 524E  SFX data
        DECLE   $02C0,  $00B0                   ; 5250  SFX data
        DECLE   $011B                           ; 5252  SFX data
        DECLE   $00AB                           ; 5253  SFX data
        DECLE   $0077,  $0085,  $0052           ; 5254  SFX data
        DECLE   $00EB                           ; 5257  SFX data
        DECLE   $03E9                           ; 5258  SFX data
        DECLE   $00AB                           ; 5259  SFX data
        DECLE   $0021,  $03E8                   ; 525A  SFX data
        DECLE   $0032                           ; 525C  SFX data
        DECLE   $026B                           ; 525D  SFX data
        DECLE   $03C2                           ; 525E  SFX data
        DECLE   $0001,  $0014                   ; 525F  SFX data
        DECLE   $02EB                           ; 5261  SFX data
        DECLE   $0003,  $039C                   ; 5262  SFX data
        DECLE   $0003,  $0038                   ; 5264  SFX data
        DECLE   $0040,  $0080                   ; 5266  SFX data
        DECLE   $011B                           ; 5268  SFX data
        DECLE   $0011,  $0008                   ; 5269  SFX data
        DECLE   $000C,  $00F0                   ; 526B  SFX data
        DECLE   $028B                           ; 526D  SFX data
        DECLE   $026B                           ; 526E  SFX data
        DECLE   $0001,  $03E8                   ; 526F  SFX data
        DECLE   $01EB                           ; 5271  SFX data
        DECLE   $0003,  $035C                   ; 5272  SFX data
        DECLE   $0003,  $0028                   ; 5274  SFX data
        DECLE   $0340,  $0050                   ; 5276  SFX data
        DECLE   $009B                           ; 5278  SFX data
        DECLE   $03C2                           ; 5279  SFX data
        DECLE   $0001,  $0010                   ; 527A  SFX data
        DECLE   $03FB                           ; 527C  SFX data
        DECLE   $03EB                           ; 527D  SFX data
        DECLE   $0003,  $032C                   ; 527E  SFX data
        DECLE   $03F9                           ; 5280  SFX data
        DECLE   $0317,  $0100                   ; 5281  SFX data
        DECLE   $0003,  $031A                   ; 5283  SFX data
UC_5285:
        MVII    #$003F, R0                      ; 5285  SLIB UCALL target
        MVO     R0,     .PSG0.chan_enable       ; 5287   0240 01F8
        PULR    R7                              ; 5289   02B7

.TITLE:
        DECLE   $0052                           ; 528A  Cartridge year
        STRING  "Frog Bog"                      ; 528B  Title string
        DECLE   $0000                           ; 5293  

.TITLECODE:
        INCR    R7                              ; 5294   000F

        DECLE   $02BF                           ; 5295   02BF
L_5296:
        J       L_5A6B                          ; 5296   0004 0358 026B

        MOVR    R7,     R5                      ; 5299   00BD
L_529A:
        PSHR    R5                              ; 529A   0275
        MVI     .BTAB.00,R0                     ; 529B   0280 0200
        SWAP    R0,     1                       ; 529D   0040
        ANDI    #$0036, R0                      ; 529E   03B8 0036
        BNEQ    L_52AE                          ; 52A0   020C 000C

        MVII    #$0002, R0                      ; 52A2   02B8 0002

        JSR     R5,     X_RAND1                 ; 52A4   0004 0114 027D
        JSR     R5,     L_5BD7                  ; 52A7   0004 0158 03D7
        JSR     R5,     L_52DC                  ; 52AA   0004 0150 02DC

        PULR    R7                              ; 52AD   02B7

L_52AE:
        JSR     R5,     L_5246                  ; 52AE   0004 0150 0246

        PULR    R7                              ; 52B1   02B7

L_52B2:
        PSHR    R5                              ; 52B2   0275

        JSR     R5,     X_PLAY_SFX2             ; 52B3   0004 0118 03BE
        DECLE   $0078                           ; 52B6  SFX prio
        DECLE   $03C9,  $000C,  $0100,  $020B   ; 52B7   03C9 000C 0100 020B
        DECLE   $0040,  $0180,  $0048,  $0080   ; 52BB   0040 0180 0048 0080
        DECLE   $0001,  $00C0,  $01EB,  $0001   ; 52BF   0001 00C0 01EB 0001
        DECLE   $0000,  $0001                   ; 52C3   0000 0001

        XORI    #$03EB, R2                      ; 52C5   03FA 03EB
        ADD@    R1,     R7                      ; 52C7   02CF

L_52C8:
        PSHR    R5                              ; 52C8   0275

        JSR     R5,     X_PLAY_SFX2             ; 52C9   0004 0118 03BE
        DECLE   $0064                           ; 52CC  SFX prio
        DECLE   $0079,  $0335,  $037E,  $02AD   ; 52CD   0079 0335 037E 02AD
        DECLE   $016B,  $003E,  $000F           ; 52D1   016B 003E 000F

        XORI    #$03AB, R6                      ; 52D4   03FE 03AB
        INCR    R7                              ; 52D6   000F

        DECLE   $0000                           ; 52D7   0000
L_52D8:
        XOR@    R5,     R6                      ; 52D8   03EE
        MOVR    R1,     R7                      ; 52D9   008F

        DECR    R3                              ; 52DA   0013
        ADD@    R1,     R7                      ; 52DB   02CF

L_52DC:
        PSHR    R5                              ; 52DC   0275

        JSR     R5,     X_PLAY_SFX2             ; 52DD   0004 0118 03BE
        DECLE   $0028                           ; 52E0  SFX prio

        XOR@    R5,     R1                      ; 52E1   03E9
        SWAP    R0,     1                       ; 52E2   0040
        SWAP    R0,     1                       ; 52E3   0040
        COMR    R3                              ; 52E4   001B
        INCR    R4                              ; 52E5   000C
        TSTR    R0                              ; 52E6   0080
        MVI@    R1,     R3                      ; 52E7   028B
        XOR@    R5,     R3                      ; 52E8   03EB
        ADD@    R1,     R7                      ; 52E9   02CF

L_52EA:
        PSHR    R5                              ; 52EA   0275

        JSR     R5,     L_5B5E                  ; 52EB   0004 0158 035E
        DECLE   $0000,  $0004                   ; 52EE   0000 0004

        MVI@    R3,     R0                      ; 52F0   0298

        JSR     R5,     L_5A51                  ; 52F1   0004 0158 0251
        JSR     R5,     X_UNPK_BYTES            ; 52F4   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; 52F7   0004 0118 022F

        MVO@    R1,     R2                      ; 52FA   0251
        PULR    R7                              ; 52FB   02B7

L_52FC:
        PSHR    R5                              ; 52FC   0275

        JSR     R5,     L_5B5E                  ; 52FD   0004 0158 035E
        DECLE   $0007,  $0000                   ; 5300   0007 0000

        MVI@    R2,     R0                      ; 5302   0290
        TSTR    R0                              ; 5303   0080
        BNEQ    L_5433                          ; 5304   020C 012D

        JSR     R5,     L_5B5E                  ; 5306   0004 0158 035E
        DECLE   $0004                           ; 5309   0004

        DIS                                     ; 530A   0003
        MVI@    R3,     R0                      ; 530B   0298
        SWAP    R0,     1                       ; 530C   0040
        MOVR    R0,     R1                      ; 530D   0081
        ANDI    #$00FF, R0                      ; 530E   03B8 00FF
        XORR    R0,     R1                      ; 5310   01C1
        CMPI    #$0054, R0                      ; 5311   0378 0054
        BGE     L_5319                          ; 5313   020D 0004

        XORR    R1,     R0                      ; 5315   01C8
        MOVR    R0,     R1                      ; 5316   0081
        B       L_531C                          ; 5317   0200 0003

L_5319:
        MVII    #$0054, R0                      ; 5319   02B8 0054
        CLRR    R1                              ; 531B   01C9
L_531C:
        SWAP    R0,     1                       ; 531C   0040
        MVO@    R0,     R3                      ; 531D   0258
        MVO@    R1,     R2                      ; 531E   0251
        INCR    R2                              ; 531F   000A
        MVI@    R2,     R0                      ; 5320   0290
        CMPI    #$0000, R0                      ; 5321   0378 0000
        BNEQ    L_53C2                          ; 5323   020C 009D

        DECR    R2                              ; 5325   0012
        MVI@    R2,     R0                      ; 5326   0290
        TSTR    R0                              ; 5327   0080
        BEQ     L_5339                          ; 5328   0204 000F

        JSR     R5,     L_5B5E                  ; 532A   0004 0158 035E
        DECLE   $0000,  $0004                   ; 532D   0000 0004

        MVI@    R3,     R0                      ; 532F   0298
        SWAP    R0,     1                       ; 5330   0040
        SDBD                                    ; 5331   0001
        ADDI    #$0700, R0                      ; 5332   02F8 0000 0007
        SWAP    R0,     1                       ; 5335   0040
        MVO@    R0,     R3                      ; 5336   0258
        B       L_53C0                          ; 5337   0200 0087

L_5339:
        JSR     R5,     L_5B5E                  ; 5339   0004 0158 035E

        SETC                                    ; 533C   0007
        INCR    R2                              ; 533D   000A
        MVI@    R3,     R0                      ; 533E   0298
        SWAP    R0,     1                       ; 533F   0040
        ANDI    #$00FF, R0                      ; 5340   03B8 00FF
        MVII    #$0001, R5                      ; 5342   02BD 0001
        CMPI    #$0016, R0                      ; 5344   0378 0016
        BNC     L_5358                          ; 5346   0209 0010

        MVII    #$0002, R5                      ; 5348   02BD 0002
        CMPI    #$004D, R0                      ; 534A   0378 004D
        BLE     L_535E                          ; 534C   0206 0010

        CMPI    #$005E, R0                      ; 534E   0378 005E
        BNC     L_5358                          ; 5350   0209 0006

        MVII    #$0003, R5                      ; 5352   02BD 0003
        CMPI    #$0085, R0                      ; 5354   0378 0085
        BLE     L_5362                          ; 5356   0206 000A

L_5358:
        MVO@    R5,     R2                      ; 5358   0255
        DECR    R2                              ; 5359   0012
        CLRR    R0                              ; 535A   01C0
        MVO@    R0,     R2                      ; 535B   0250
        B       L_5366                          ; 535C   0200 0008

L_535E:
        MVII    #$0001, R0                      ; 535E   02B8 0001
        B       L_5364                          ; 5360   0200 0002

L_5362:
        MVII    #$0002, R0                      ; 5362   02B8 0002
L_5364:
        DECR    R2                              ; 5364   0012
        MVO@    R0,     R2                      ; 5365   0250
L_5366:
        MVI@    R2,     R0                      ; 5366   0290
        TSTR    R0                              ; 5367   0080
        BEQ     L_536F                          ; 5368   0204 0005

        JSR     R5,     L_5B75                  ; 536A   0004 0158 0375

        B       L_5433                          ; 536D   0200 00C4

L_536F:
        JSR     R5,     L_5B5E                  ; 536F   0004 0158 035E
        DECLE   $0007,  $0000                   ; 5372   0007 0000

        MVI@    R2,     R0                      ; 5374   0290
        TSTR    R0                              ; 5375   0080
        BEQ     L_5433                          ; 5376   0204 00BB

        JSR     R5,     L_5B5E                  ; 5378   0004 0158 035E
        DECLE   $0007,  $0004                   ; 537B   0007 0004

        CLRR    R0                              ; 537D   01C0
        MVO@    R0,     R3                      ; 537E   0258
        DECR    R3                              ; 537F   0013
        MVII    #$0058, R0                      ; 5380   02B8 0058
        SWAP    R0,     1                       ; 5382   0040
        MVO@    R0,     R3                      ; 5383   0258
        DECR    R3                              ; 5384   0013
        MVI@    R3,     R1                      ; 5385   0299
        SWAP    R1,     1                       ; 5386   0041
        ANDI    #$00FF, R1                      ; 5387   03B9 00FF
        ADDI    #$000A, R3                      ; 5389   02FB 000A
        MVI@    R3,     R0                      ; 538B   0298
        SWAP    R0,     1                       ; 538C   0040
        ANDI    #$00FF, R0                      ; 538D   03B8 00FF

        JSR     R5,     X_EXT_SIGN_LO           ; 538F   0004 0114 0268

        ADDR    R1,     R0                      ; 5392   00C8
        SUBI    #$000A, R3                      ; 5393   033B 000A
        MVI@    R2,     R1                      ; 5395   0291
        ADDR    R7,     R1                      ; 5396   00F9
        ADD@    R1,     R7                      ; 5397   02CF

        DIS                                     ; 5398   0003
        DECR    R3                              ; 5399   0013
        INCR    R3                              ; 539A   000B
        CMPI    #$0008, R0                      ; 539B   0378 0008
        BLE     L_53B9                          ; 539D   0206 001A

        MVII    #$0008, R0                      ; 539F   02B8 0008
        B       L_53B9                          ; 53A1   0200 0016

        CMPI    #$0094, R0                      ; 53A3   0378 0094
        BGE     L_53B9                          ; 53A5   020D 0012

        MVII    #$0094, R0                      ; 53A7   02B8 0094
        B       L_53B9                          ; 53A9   0200 000E

        MVII    #$005A, R0                      ; 53AB   02B8 005A
        SUBI    #$0002, R3                      ; 53AD   033B 0002
        MVI@    R3,     R1                      ; 53AF   0299
        ADDI    #$0002, R3                      ; 53B0   02FB 0002
        SWAP    R1,     1                       ; 53B2   0041
        ANDI    #$0002, R1                      ; 53B3   03B9 0002
        BEQ     L_53B9                          ; 53B5   0204 0002

        MVII    #$0052, R0                      ; 53B7   02B8 0052
L_53B9:
        SWAP    R0,     1                       ; 53B9   0040
        MVO@    R0,     R3                      ; 53BA   0258

        JSR     R5,     L_5C11                  ; 53BB   0004 015C 0011

        B       L_5433                          ; 53BE   0200 0073
L_53C0:
        B       L_53F7                          ; 53C0   0200 0035

L_53C2:
        JSR     R5,     L_5B5E                  ; 53C2   0004 0158 035E
        DECLE   $0005,  $0000                   ; 53C5   0005 0000

        MVI@    R2,     R0                      ; 53C7   0290
        CMPI    #$0002, R0                      ; 53C8   0378 0002
        BNEQ    L_53F7                          ; 53CA   020C 002B
        B       L_53D6                          ; 53CC   0200 0008

        DECLE   $0032,  $003F,  $0037           ; 53CE   0032 003F 0037

        ADCR    R7                              ; 53D1   002F

        NEGR    R3                              ; 53D2   0023
L_53D3:
        COMR    R0                              ; 53D3   0018
        DECLE   $000C,  $0005                   ; 53D4   000C 0005
L_53D6:
        PSHR    R2                              ; 53D6   0272
        PSHR    R3                              ; 53D7   0273

        JSR     R5,     L_5B5E                  ; 53D8   0004 0158 035E
        DECLE   $0002,  $0004                   ; 53DB   0002 0004

        MVI@    R2,     R1                      ; 53DD   0291
        DECR    R1                              ; 53DE   0011
        BMI     L_53F1                          ; 53DF   020B 0010

        MVO@    R1,     R2                      ; 53E1   0251
        ADDR    R7,     R1                      ; 53E2   00F9
        SUBI    #$0015, R1                      ; 53E3   0339 0015
        MVI@    R1,     R0                      ; 53E5   0288
        DECR    R2                              ; 53E6   0012
        MVI@    R2,     R1                      ; 53E7   0291

        JSR     R5,     .EXEC.629               ; 53E8   0004 0114 0229
        JSR     R5,     L_5A51                  ; 53EB   0004 0158 0251

        MVO@    R0,     R3                      ; 53EE   0258
        B       L_53F5                          ; 53EF   0200 0004

L_53F1:
        ADDI    #$0003, R2                      ; 53F1   02FA 0003
        CLRR    R0                              ; 53F3   01C0
        MVO@    R0,     R2                      ; 53F4   0250
L_53F5:
        PULR    R3                              ; 53F5   02B3
        PULR    R2                              ; 53F6   02B2

L_53F7:
        JSR     R5,     L_5B5E                  ; 53F7   0004 0158 035E
        DECLE   $0004,  $0000                   ; 53FA   0004 0000

        MVI@    R2,     R0                      ; 53FC   0290
        TSTR    R0                              ; 53FD   0080
        BEQ     L_5433                          ; 53FE   0204 0033
L_5400:
        B       L_5412                          ; 5400   0200 0010

        DECLE   $0003,  $0002,  $0002,  $0001   ; 5402   0003 0002 0002 0001
        DECLE   $0001,  $0201,  $0202,  $0202   ; 5406   0001 0201 0202 0202
        DECLE   $0203,  $0204,  $0204,  $0205   ; 540A   0203 0204 0204 0205
        DECLE   $0205,  $0005,  $0004,  $0004   ; 540E   0205 0005 0004 0004
L_5412:
        JSR     R5,     L_52EA                  ; 5412   0004 0150 02EA
        JSR     R5,     L_5B5E                  ; 5415   0004 0158 035E
        DECLE   $0000,  $0000                   ; 5418   0000 0000

        MVI@    R2,     R3                      ; 541A   0293
        ADDR    R7,     R3                      ; 541B   00FB
        SUBI    #$001A, R3                      ; 541C   033B 001A
        MVI@    R3,     R1                      ; 541E   0299
        MOVR    R1,     R4                      ; 541F   008C
        ANDI    #$0200, R1                      ; 5420   03B9 0200
        BEQ     L_5428                          ; 5422   0204 0004

        MVII    #$00EB, R0                      ; 5424   02B8 00EB
        B       L_542A                          ; 5426   0200 0002

L_5428:
        MVII    #$0015, R0                      ; 5428   02B8 0015

L_542A:
        JSR     R5,     L_5AF2                  ; 542A   0004 0158 02F2

        MOVR    R4,     R0                      ; 542D   00A0
        ANDI    #$000F, R0                      ; 542E   03B8 000F

        JSR     R5,     L_5B3F                  ; 5430   0004 0158 033F

L_5433:
        PULR    R7                              ; 5433   02B7

        DECLE   $0040,  $0056,  $0055,  $01F0   ; 5434   0040 0056 0055 01F0
        DECLE   $0040,  $005D,  $0055,  $03F0   ; 5438   0040 005D 0055 03F0
        DECLE   $0040,  $0064,  $0055,  $03F0   ; 543C   0040 0064 0055 03F0
        DECLE   $0000,  $006B,  $0055,  $03F0   ; 5440   0000 006B 0055 03F0
        DECLE   $0009,  $0004,  $0008,  $0002   ; 5444   0009 0004 0008 0002
        DECLE   $0050,  $0001                   ; 5448   0050 0001

        INCR    R2                              ; 544A   000A
        INCR    R7                              ; 544B   000F

        EIS                                     ; 544C   0002
L_544D:
        DECR    R4                              ; 544D   0014
        DECLE   $0037,  $0001,  $0011,  $0005   ; 544E   0037 0001 0011 0005
        DECLE   $0003,  $0019,  $0005           ; 5452   0003 0019 0005

        INCR    R7                              ; 5455   000F

        INCR    R2                              ; 5456   000A
L_5457:
        COMR    R1                              ; 5457   0019
        SDBD                                    ; 5458   0001
        MVII    #$3988, R4                      ; 5459   02BC 0088 0039
        CLRR    R0                              ; 545C   01C0
        MVO@    R0,     R4                      ; 545D   0260
        MVO@    R0,     R4                      ; 545E   0260
        MVII    #$0002, R0                      ; 545F   02B8 0002
        MVO@    R0,     R4                      ; 5461   0260
        J       L_5E49                          ; 5462   0004 035C 0249

        DECLE   $0259,  $021E,  $0248,  $0267   ; 5465   0259 021E 0248 0267
        DECLE   $025F,  $022F,  $0254,  $0206   ; 5469   025F 022F 0254 0206
L_546D:
        PSHR    R5                              ; 546D   0275
        MVII    #$0184, R3                      ; 546E   02BB 0184
        MVI@    R3,     R2                      ; 5470   029A
        TSTR    R2                              ; 5471   0092
        BEQ     L_54B4                          ; 5472   0204 0040

        INCR    R2                              ; 5474   000A
        MVO@    R2,     R3                      ; 5475   025A

        JSR     R5,     .EXEC.7AE               ; 5476   0004 0114 03AE

        CMPI    #$0003, R2                      ; 5479   037A 0003
        BNEQ    L_54ED                          ; 547B   020C 0070

        SDBD                                    ; 547D   0001
        MVII    #$1906, R0                      ; 547E   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5481   0240 035D
        MOVR    R7,     R0                      ; 5483   00B8
        SUBI    #$002C, R0                      ; 5484   0338 002C

        JSR     R5,     L_5E3A                  ; 5486   0004 015C 023A

        SDBD                                    ; 5489   0001
        MVII    #$098F, R0                      ; 548A   02B8 008F 0009
        MOVR    R7,     R5                      ; 548D   00BD
        SUBI    #$0029, R5                      ; 548E   033D 0029
        MVII    #$0006, R1                      ; 5490   02B9 0006
L_5492:
        MVI@    R5,     R2                      ; 5492   02AA
        MVO@    R0,     R2                      ; 5493   0250
        DECR    R1                              ; 5494   0011
        BPL     L_5492                          ; 5495   0223 0004

        MVII    #$000F, R0                      ; 5497   02B8 000F
        MVO     R0,     G_0183                  ; 5499   0240 0183
        CLRR    R0                              ; 549B   01C0

        JSR     R5,     L_54A2                  ; 549C   0004 0154 00A2

        MVII    #$0001, R0                      ; 549F   02B8 0001
        INCR    R7                              ; 54A1   000F

L_54A2:
        PSHR    R5                              ; 54A2   0275
L_54A3:
        MVO     R0,     G_0188                  ; 54A3   0240 0188

        JSR     R5,     L_5B5E                  ; 54A5   0004 0158 035E
        DECLE   $0005                           ; 54A8   0005

        INCR    R6                              ; 54A9   000E
        CLRR    R5                              ; 54AA   01ED
        MVO@    R5,     R3                      ; 54AB   025D
        MVI@    R2,     R1                      ; 54AC   0291
        DECR    R1                              ; 54AD   0011
        BNEQ    L_54B3                          ; 54AE   020C 0003

        JSR     R5,     L_5B75                  ; 54B0   0004 0158 0375

L_54B3:
        PULR    R7                              ; 54B3   02B7

L_54B4:
        MVII    #$0002, R0                      ; 54B4   02B8 0002

        JSR     R5,     X_RAND1                 ; 54B6   0004 0114 027D

        MOVR    R0,     R3                      ; 54B9   0083
        MOVR    R7,     R4                      ; 54BA   00BC
        SUBI    #$008B, R4                      ; 54BB   033C 008B
L_54BD:
        ADDI    #$0004, R4                      ; 54BD   02FC 0004
        DECR    R0                              ; 54BF   0010
        BPL     L_54BD                          ; 54C0   0223 0004

        MVII    #$0018, R0                      ; 54C2   02B8 0018
        SWAP    R0,     1                       ; 54C4   0040
        XOR@    R4,     R0                      ; 54C5   03E0
        MVO@    R0,     R1                      ; 54C6   0248
        SDBD                                    ; 54C7   0001
        MVI@    R4,     R0                      ; 54C8   02A0
        INCR    R1                              ; 54C9   0009
        MVO@    R0,     R1                      ; 54CA   0248
        MVI@    R4,     R0                      ; 54CB   02A0
        ADDI    #$0004, R1                      ; 54CC   02F9 0004
        MVO@    R0,     R1                      ; 54CE   0248
        MVII    #$0001, R0                      ; 54CF   02B8 0001
        INCR    R1                              ; 54D1   0009
        MVO@    R0,     R1                      ; 54D2   0248
        INCR    R1                              ; 54D3   0009
        MVO@    R3,     R1                      ; 54D4   024B
        MVII    #$0001, R0                      ; 54D5   02B8 0001

        JSR     R5,     X_RAND1                 ; 54D7   0004 0114 027D

        TSTR    R0                              ; 54DA   0080
        BEQ     L_54E0                          ; 54DB   0204 0003

        MVII    #$00A7, R0                      ; 54DD   02B8 00A7
        SWAP    R0,     1                       ; 54DF   0040
L_54E0:
        SUBI    #$0005, R1                      ; 54E0   0339 0005
        MVO@    R0,     R1                      ; 54E2   0248
        MVII    #$0005, R0                      ; 54E3   02B8 0005

        JSR     R5,     X_RAND1                 ; 54E5   0004 0114 027D

        ADDI    #$0028, R0                      ; 54E8   02F8 0028
        INCR    R1                              ; 54EA   0009
        SWAP    R0,     1                       ; 54EB   0040
        MVO@    R0,     R1                      ; 54EC   0248
L_54ED:
        PULR    R7                              ; 54ED   02B7

        PSHR    R5                              ; 54EE   0275
        MOVR    R1,     R2                      ; 54EF   008A
        MVII    #$0004, R0                      ; 54F0   02B8 0004

        JSR     R5,     X_RAND1                 ; 54F2   0004 0114 027D

        MOVR    R7,     R4                      ; 54F5   00BC
        SUBI    #$00AE, R4                      ; 54F6   033C 00AE
        ADDI    #$0007, R2                      ; 54F8   02FA 0007
        ADD@    R2,     R4                      ; 54FA   02D4
        ADD@    R2,     R4                      ; 54FB   02D4
        ADD@    R2,     R4                      ; 54FC   02D4
        ADD@    R4,     R0                      ; 54FD   02E0
        DECR    R2                              ; 54FE   0012
        MVO@    R0,     R2                      ; 54FF   0250
        MVI@    R4,     R0                      ; 5500   02A0
        SLL     R0,     1                       ; 5501   0048
        INCR    R0                              ; 5502   0008

        JSR     R5,     X_RAND2                 ; 5503   0004 0114 029E

        MOVR    R0,     R1                      ; 5506   0081
        DECR    R4                              ; 5507   0014
        SUB@    R4,     R1                      ; 5508   0321
        SUBI    #$0006, R2                      ; 5509   033A 0006
        MVI@    R2,     R3                      ; 550B   0293
        SDBD                                    ; 550C   0001
        ANDI    #$FDFF, R3                      ; 550D   03BB 00FF 00FD
        MVII    #$0003, R0                      ; 5510   02B8 0003

        JSR     R5,     X_RAND2                 ; 5512   0004 0114 029E

        TSTR    R0                              ; 5515   0080
        BEQ     L_5528                          ; 5516   0204 0010

        DECR    R0                              ; 5518   0010
        BEQ     L_5524                          ; 5519   0204 0009

        MOVR    R2,     R5                      ; 551B   0095
        ADDI    #$0002, R5                      ; 551C   02FD 0002
        MVII    #$0040, R0                      ; 551E   02B8 0040
        SWAP    R0,     1                       ; 5520   0040
        CMP@    R5,     R0                      ; 5521   0368
        BPL     L_5528                          ; 5522   0203 0004

L_5524:
        XORI    #$0200, R3                      ; 5524   03FB 0200
        ADDI    #$0008, R1                      ; 5526   02F9 0008
L_5528:
        MVO@    R3,     R2                      ; 5528   0253
        MVI@    R4,     R0                      ; 5529   02A0

        JSR     R5,     .EXEC.629               ; 552A   0004 0114 0229

        ADDI    #$0004, R2                      ; 552D   02FA 0004
        MVO@    R0,     R2                      ; 552F   0250
        PULR    R7                              ; 5530   02B7

L_5531:
        PSHR    R5                              ; 5531   0275
        MVII    #$004C, R0                      ; 5532   02B8 004C
        SWAP    R0,     1                       ; 5534   0040
        MVII    #$0020, R1                      ; 5535   02B9 0020
        SWAP    R1,     1                       ; 5537   0041
        MVII    #$0321, R2                      ; 5538   02BA 0321

        JSR     R5,     L_5540                  ; 553A   0004 0154 0140

        MVII    #$0341, R2                      ; 553D   02BA 0341
        PULR    R5                              ; 553F   02B5
L_5540:
        MVI@    R2,     R3                      ; 5540   0293
        MOVR    R3,     R4                      ; 5541   009C
        ANDI    #$0080, R4                      ; 5542   03BC 0080
        BEQ     L_5549                          ; 5544   0204 0003

        XORI    #$00FF, R3                      ; 5546   03FB 00FF
        INCR    R3                              ; 5548   000B
L_5549:
        DECR    R2                              ; 5549   0012
        CMP@    R2,     R1                      ; 554A   0351
        BPL     L_5553                          ; 554B   0203 0006

        CMP@    R2,     R0                      ; 554D   0350
        BPL     L_5555                          ; 554E   0203 0005

        XORI    #$00FF, R3                      ; 5550   03FB 00FF
        INCR    R3                              ; 5552   000B
L_5553:
        INCR    R2                              ; 5553   000A
        MVO@    R3,     R2                      ; 5554   0253
L_5555:
        MOVR    R5,     R7                      ; 5555   00AF

        DECLE   $016D,  $0054,  $00EE,  $0054   ; 5556   016D 0054 00EE 0054
        DECLE   $0004,  $004A,  $0000,  $016D   ; 555A   0004 004A 0000 016D
        DECLE   $0054,  $00EE,  $0054,  $0002   ; 555E   0054 00EE 0054 0002
        DECLE   $0052,  $0000                   ; 5562   0052 0000

        CMPR    R5,     R5                      ; 5564   016D
        RLC     R0,     2                       ; 5565   0054
        ADDR    R5,     R6                      ; 5566   00EE
        RLC     R0,     2                       ; 5567   0054

        JSRD    R4,     L_5400                  ; 5568   0004 0056 0000
        DECLE   $016D,  $0054,  $00EE,  $0054   ; 556B   016D 0054 00EE 0054
        DECLE   $0002,  $005E,  $0000           ; 556F   0002 005E 0000
L_5572:
        PSHR    R5                              ; 5572   0275
        CLRR    R0                              ; 5573   01C0

        JSR     R5,     L_557D                  ; 5574   0004 0154 017D

        MVII    #$0004, R0                      ; 5577   02B8 0004

        JSR     R5,     L_557D                  ; 5579   0004 0154 017D

        PULR    R7                              ; 557C   02B7

L_557D:
        PSHR    R5                              ; 557D   0275
        MOVR    R0,     R3                      ; 557E   0083
        SLR     R3,     2                       ; 557F   0067
        ADDI    #$0181, R3                      ; 5580   02FB 0181
        MVI@    R3,     R2                      ; 5582   029A
        DECR    R2                              ; 5583   0012
        BMI     L_5588                          ; 5584   020B 0002

        MVO@    R2,     R3                      ; 5586   025A
        PULR    R7                              ; 5587   02B7

L_5588:
        JSR     R5,     .EXEC.76C               ; 5588   0004 0114 036C

        MVII    #$0004, R0                      ; 558B   02B8 0004
        MVI@    R1,     R2                      ; 558D   028A
        ANDI    #$0006, R2                      ; 558E   03BA 0006
        BEQ     L_55A0                          ; 5590   0204 000E

        ADDI    #$0007, R1                      ; 5592   02F9 0007
        MVI@    R1,     R2                      ; 5594   028A
        ADDR    R7,     R2                      ; 5595   00FA
        SUBI    #$0152, R2                      ; 5596   033A 0152
        MVII    #$000A, R0                      ; 5598   02B8 000A

        JSR     R5,     X_RAND2                 ; 559A   0004 0114 029E

        ADD@    R2,     R0                      ; 559D   02D0
        SUBI    #$0007, R1                      ; 559E   0339 0007
L_55A0:
        MVO@    R0,     R3                      ; 55A0   0258
        MVI@    R1,     R2                      ; 55A1   028A
        XORI    #$0006, R2                      ; 55A2   03FA 0006
        MVO@    R2,     R1                      ; 55A4   024A
        PULR    R7                              ; 55A5   02B7
        MOVR    R2,     R7                      ; 55A6   0097

        SLLC    R3,     2                       ; 55A7   005F
        ADDR    R2,     R3                      ; 55A8   00D3
        RLC     R1,     2                       ; 55A9   0055
        ADDR    R3,     R7                      ; 55AA   00DF

        SLLC    R2,     2                       ; 55AB   005E
        ADDR    R3,     R7                      ; 55AC   00DF

        SLLC    R2,     2                       ; 55AD   005E
        ADDR    R3,     R7                      ; 55AE   00DF

        SLLC    R2,     2                       ; 55AF   005E
L_55B0:
        PSHR    R5                              ; 55B0   0275

        JSR     R5,     L_5B5E                  ; 55B1   0004 0158 035E
        DECLE   $0008,  $0000                   ; 55B4   0008 0000

        MVII    #$0001, R0                      ; 55B6   02B8 0001
        MVO@    R0,     R2                      ; 55B8   0250
        SUBI    #$0002, R2                      ; 55B9   033A 0002
        MVI@    R2,     R0                      ; 55BB   0290
        CMPI    #$0001, R0                      ; 55BC   0378 0001
        BNEQ    L_55C4                          ; 55BE   020C 0004

        MVII    #$0002, R0                      ; 55C0   02B8 0002
        B       L_55C6                          ; 55C2   0200 0002

L_55C4:
        MVII    #$0005, R0                      ; 55C4   02B8 0005
L_55C6:
        SUBI    #$0005, R2                      ; 55C6   033A 0005
        MVO@    R0,     R2                      ; 55C8   0250
        INCR    R2                              ; 55C9   000A
        MVII    #$0004, R0                      ; 55CA   02B8 0004
        MVO@    R0,     R2                      ; 55CC   0250
        ADDI    #$0003, R2                      ; 55CD   02FA 0003
        MVII    #$0002, R0                      ; 55CF   02B8 0002
        MVO@    R0,     R2                      ; 55D1   0250
        PULR    R7                              ; 55D2   02B7

        PSHR    R5                              ; 55D3   0275
        MVO     R1,     G_0188                  ; 55D4   0241 0188
        SLL     R1,     2                       ; 55D6   004D
        ADDI    #$0002, R1                      ; 55D7   02F9 0002
        PSHR    R0                              ; 55D9   0270
        MOVR    R1,     R0                      ; 55DA   0088

        JSR     R5,     .EXEC.76C               ; 55DB   0004 0114 036C

        PULR    R0                              ; 55DE   02B0
        ADDI    #$0006, R1                      ; 55DF   02F9 0006
        MVII    #$0190, R5                      ; 55E1   02BD 0190
        MVO@    R5,     R1                      ; 55E3   024D

        JSR     R5,     L_5B5E                  ; 55E4   0004 0158 035E
        DECLE   $0008,  $0000                   ; 55E7   0008 0000

        CMPI    #$000A, R0                      ; 55E9   0378 000A
        BNEQ    L_55FC                          ; 55EB   020C 000F

        MVII    #$0001, R5                      ; 55ED   02BD 0001
        MVO@    R5,     R2                      ; 55EF   0255
        SUBI    #$0003, R2                      ; 55F0   033A 0003
        MVI@    R2,     R0                      ; 55F2   0290
        CMPI    #$0001, R0                      ; 55F3   0378 0001
        BNEQ    L_560B                          ; 55F5   020C 0014

        JSR     R5,     L_5B75                  ; 55F7   0004 0158 0375

        B       L_560B                          ; 55FA   0200 000F

L_55FC:
        TSTR    R0                              ; 55FC   0080
        BNEQ    L_5604                          ; 55FD   020C 0005

        MVII    #$0000, R5                      ; 55FF   02BD 0000
        MVO@    R5,     R2                      ; 5601   0255
        B       L_5604                          ; 5602   0200 0000

L_5604:
        CMPI    #$000B, R0                      ; 5604   0378 000B
        BNEQ    L_560B                          ; 5606   020C 0003

        MVII    #$0002, R5                      ; 5608   02BD 0002
        MVO@    R5,     R2                      ; 560A   0255
L_560B:
        PULR    R7                              ; 560B   02B7

        DECLE   $0006,  $0028,  $0076,  $0059   ; 560C   0006 0028 0076 0059
        DECLE   $0000,  $0023,  $0000,  $0054   ; 5610   0000 0023 0000 0054
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5614   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5618   0000 0000 0000 0000
        DECLE   $0057,  $0018,  $0066,  $0059   ; 561C   0057 0018 0066 0059
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5620   0000 0000 0000 0000
        DECLE   $0000,  $03F8,  $0000,  $0000   ; 5624   0000 03F8 0000 0000
        DECLE   $00C8,  $0000,  $0000,  $0000   ; 5628   00C8 0000 0000 0000
        DECLE   $0057,  $0010,  $006F,  $0059   ; 562C   0057 0010 006F 0059
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5630   0000 0000 0000 0000
        DECLE   $0000,  $03F8,  $0000,  $0000   ; 5634   0000 03F8 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5638   0000 0000 0000 0000
        DECLE   $0006,  $002A,  $0076,  $0059   ; 563C   0006 002A 0076 0059
        DECLE   $0000,  $0074,  $0000,  $0054   ; 5640   0000 0074 0000 0054
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5644   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5648   0000 0000 0000 0000
        DECLE   $0050,  $001A,  $0066,  $0059   ; 564C   0050 001A 0066 0059
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5650   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0000,  $0000   ; 5654   0000 0010 0000 0000
        DECLE   $00C8,  $0000,  $0000,  $0000   ; 5658   00C8 0000 0000 0000
        DECLE   $0050,  $0012,  $006F,  $0059   ; 565C   0050 0012 006F 0059
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5660   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0000,  $0000   ; 5664   0000 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5668   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 566C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5670   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5674   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5678   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 567C   0000 0000 0000 0000
        DECLE   $0003,  $0003,  $0006,  $000C   ; 5680   0003 0003 0006 000C
        DECLE   $000C,  $0000,  $0000,  $0000   ; 5684   000C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5688   0000 0000 0000 0000
        DECLE   $00F8,  $00EC,  $000E,  $0007   ; 568C   00F8 00EC 000E 0007
        DECLE   $0003,  $0003,  $0003,  $0007   ; 5690   0003 0003 0003 0007
        DECLE   $00FE,  $00F0,  $0040,  $0060   ; 5694   00FE 00F0 0040 0060
        DECLE   $007C,  $006C,  $0006,  $0007   ; 5698   007C 006C 0006 0007
        DECLE   $0003,  $0043,  $0067,  $0066   ; 569C   0003 0043 0067 0066
        DECLE   $0034,  $001C,  $0008,  $0000   ; 56A0   0034 001C 0008 0000
        DECLE   $0000,  $0000                   ; 56A4   0000 0000

        SLR     R0,     1                       ; 56A6   0060
        SLR     R0,     1                       ; 56A7   0060
        SLR     R0,     1                       ; 56A8   0060
        RRC     R2,     2                       ; 56A9   0076
        COMR    R6                              ; 56AA   001E
        INCR    R2                              ; 56AB   000A
        DIS                                     ; 56AC   0003
        DIS                                     ; 56AD   0003
        ADDR    R0,     R7                      ; 56AE   00C7
        ADDR    R1,     R7                      ; 56AF   00CF

        DECLE   $00EC,  $0078,  $0018,  $0000   ; 56B0   00EC 0078 0018 0000
        DECLE   $0000,  $0000                   ; 56B4   0000 0000

        GSWD    R0                              ; 56B6   0030
        DECR    R0                              ; 56B7   0010
        MOVR    R3,     R0                      ; 56B8   0098
        ADDR    R1,     R6                      ; 56B9   00CE
        ADDR    R0,     R7                      ; 56BA   00C7

        SAR     R3,     2                       ; 56BB   006F
        ADCR    R7                              ; 56BC   002F

        RSWD    R3                              ; 56BD   003B
L_56BE:
        GSWD    R0                              ; 56BE   0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56BF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56C3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0007,  $000F   ; 56C7   0000 0000 0007 000F
        DECLE   $001F,  $0037,  $0037,  $0032   ; 56CB   001F 0037 0037 0032
        DECLE   $003B,  $001B,  $0001,  $0000   ; 56CF   003B 001B 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 56D3   0000 0000 0000 0018
        DECLE   $0018,  $0018,  $000C,  $0007   ; 56D7   0018 0018 000C 0007
        DECLE   $0067,  $0063,  $0067,  $0037   ; 56DB   0067 0063 0067 0037
        DECLE   $001F,  $000D,  $0000,  $0000   ; 56DF   001F 000D 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56E3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56E7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56EB   0000 0000 0000 0000
        DECLE   $0000,  $00A0,  $0014,  $006A   ; 56EF   0000 00A0 0014 006A
        DECLE   $0015,  $000E,  $0005,  $0000   ; 56F3   0015 000E 0005 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56F7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56FB   0000 0000 0000 0000
        DECLE   $0012,  $0080,  $0015,  $0020   ; 56FF   0012 0080 0015 0020
        DECLE   $0010,  $0005,  $0000,  $0000   ; 5703   0010 0005 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5707   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 570B   0000 0000 0000 0000
        DECLE   $0015,  $0040,  $0080,  $0080   ; 570F   0015 0040 0080 0080
        DECLE   $0000,  $0040,  $0015,  $0000   ; 5713   0000 0040 0015 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5717   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0024   ; 571B   0000 0000 0000 0024
        DECLE   $0000,  $0080,  $0000,  $0000   ; 571F   0000 0080 0000 0000
        DECLE   $0040,  $0000,  $0008,  $0000   ; 5723   0040 0000 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5727   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 572B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 572F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5733   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5737   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 573B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 573F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $007E   ; 5743   0000 0000 0000 007E
        DECLE   $0091,  $0060,  $000E,  $001F   ; 5747   0091 0060 000E 001F

        INCR    R7                              ; 574B   000F

        COMR    R4                              ; 574C   001C
L_574D:
        INCR    R6                              ; 574D   000E
        DECLE   $001F                           ; 574E   001F

        INCR    R7                              ; 574F   000F

        SETC                                    ; 5750   0007
L_5751:
        SARC    R3,     2                       ; 5751   007F
        DECLE   $0083,  $007F,  $0041,  $003E   ; 5752   0083 007F 0041 003E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5756   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 575A   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0003,  $0007   ; 575E   0000 0001 0003 0007
        DECLE   $0007,  $0007,  $0007,  $0003   ; 5762   0007 0007 0007 0003
        DECLE   $0000                           ; 5766   0000

        INCR    R2                              ; 5767   000A
        COMR    R6                              ; 5768   001E
L_5769:
        DECR    R7                              ; 5769   0017

        DECLE   $001F,  $001F,  $003E,  $003C   ; 576A   001F 001F 003E 003C
        DECLE   $007C,  $00FC,  $00FC,  $00FE   ; 576E   007C 00FC 00FC 00FE
        DECLE   $00FE,  $00FC,  $007F,  $003F   ; 5772   00FE 00FC 007F 003F
        DECLE   $0000,  $0066,  $006B,  $004F   ; 5776   0000 0066 006B 004F
        DECLE   $007E,  $007C,  $003C,  $007C   ; 577A   007E 007C 003C 007C
        DECLE   $007C,  $00F7,  $00F3,  $00B0   ; 577E   007C 00F7 00F3 00B0
        DECLE   $0030,  $0060,  $0060,  $0060   ; 5782   0030 0060 0060 0060
        DECLE   $0000,  $0006,  $000E,  $0018   ; 5786   0000 0006 000E 0018
        DECLE   $0030,  $0024,  $003E,  $003B   ; 578A   0030 0024 003E 003B
        DECLE   $00FE,  $00FC,  $00F8,  $00F0   ; 578E   00FE 00FC 00F8 00F0
        DECLE   $00B0,  $0036,  $001E,  $0000   ; 5792   00B0 0036 001E 0000
        DECLE   $001C,  $003C,  $0060,  $0040   ; 5796   001C 003C 0060 0040
        DECLE   $00D8,  $00FC,  $00F6,  $00FE   ; 579A   00D8 00FC 00F6 00FE
        DECLE   $00FC,  $0070,  $0060,  $0037   ; 579E   00FC 0070 0060 0037
        DECLE   $001F,  $0000,  $0000,  $0000   ; 57A2   001F 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001C   ; 57A6   0000 0000 0000 001C
        DECLE   $0036,  $00E0,  $00F0,  $00FC   ; 57AA   0036 00E0 00F0 00FC
        DECLE   $00FA,  $00BE,  $0046,  $0060   ; 57AE   00FA 00BE 0046 0060
        DECLE   $0037,  $001C,  $0000,  $0000   ; 57B2   0037 001C 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 57B6   0000 0000 0000

        COMR    R0                              ; 57B9   0018
        MOVR    R7,     R6                      ; 57BA   00BE
        ADDR    R4,     R7                      ; 57BB   00E7

        DECLE   $00F3,  $00F3,  $00F8,  $00F8   ; 57BC   00F3 00F3 00F8 00F8
        DECLE   $00BC,  $00BE,  $009A,  $009E   ; 57C0   00BC 00BE 009A 009E
        DECLE   $00CC,  $00C0,  $0000,  $0000   ; 57C4   00CC 00C0 0000 0000
        DECLE   $0000,  $0020,  $00E0,  $00F8   ; 57C8   0000 0020 00E0 00F8
        DECLE   $00FC,  $00FE,  $00FB,  $003F   ; 57CC   00FC 00FE 00FB 003F
        DECLE   $00AE,  $00A0,  $0038,  $0018   ; 57D0   00AE 00A0 0038 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57D8   0000 0000 0000 0000
        DECLE   $0000                           ; 57DC   0000

        COMR    R0                              ; 57DD   0018
        MOVR    R7,     R6                      ; 57DE   00BE
        ADDR    R4,     R7                      ; 57DF   00E7

        DECLE   $00F3,  $00F3,  $00F8,  $00F8   ; 57E0   00F3 00F3 00F8 00F8
        DECLE   $00BC,  $00BE,  $0000,  $0000   ; 57E4   00BC 00BE 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0002   ; 57EC   0000 0000 0001 0002
        DECLE   $0088,  $0014,  $00A8,  $0056   ; 57F0   0088 0014 00A8 0056
        DECLE   $0028,  $00A0,  $0000,  $0000   ; 57F4   0028 00A0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57F8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0048   ; 57FC   0000 0000 0000 0048
        DECLE   $0001,  $00A8,  $0004,  $0008   ; 5800   0001 00A8 0004 0008
        DECLE   $0050,  $0000,  $0000,  $0000   ; 5804   0050 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5808   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00A8   ; 580C   0000 0000 0000 00A8
        DECLE   $0002,  $0001,  $0001,  $0000   ; 5810   0002 0001 0001 0000
        DECLE   $0002,  $0054,  $0000,  $0000   ; 5814   0002 0054 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5818   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0088,  $0000   ; 581C   0000 0000 0088 0000
        DECLE   $0001,  $0000,  $0000,  $0002   ; 5820   0001 0000 0000 0002
        DECLE   $0000,  $0090,  $0000,  $0000   ; 5824   0000 0090 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5828   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0014   ; 582C   0000 0000 0000 0014
        DECLE   $001C,  $002C,  $003E,  $003E   ; 5830   001C 002C 003E 003E
        DECLE   $007C,  $00FC,  $0000,  $0000   ; 5834   007C 00FC 0000 0000
        DECLE   $0000,  $0000                   ; 5838   0000 0000

        INCR    R2                              ; 583A   000A
        INCR    R7                              ; 583B   000F

        INCR    R3                              ; 583C   000B
L_583D:
        COMR    R6                              ; 583D   001E
        DECLE   $003C,  $0039,  $003F,  $0078   ; 583E   003C 0039 003F 0078
        DECLE   $0078,  $007B,  $00FF,  $00FC   ; 5842   0078 007B 00FF 00FC
        DECLE   $0040,  $0050,  $00A0,  $00D0   ; 5846   0040 0050 00A0 00D0
        DECLE   $00F8,  $00FC,  $0018,  $00BC   ; 584A   00F8 00FC 0018 00BC
        DECLE   $00F8,  $00FC,  $00F8,  $00FE   ; 584E   00F8 00FC 00F8 00FE
        DECLE   $00E1,  $00FE,  $00C1,  $007E   ; 5852   00E1 00FE 00C1 007E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5856   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000A   ; 585A   0000 0000 0000 000A
        DECLE   $007E,  $00FB,  $00FF,  $00FF   ; 585E   007E 00FB 00FF 00FF
        DECLE   $00F6,  $0038,  $00CC,  $00F6   ; 5862   00F6 0038 00CC 00F6
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5866   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 586A   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0040,  $0020,  $0020   ; 586E   0000 0040 0020 0020
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 5872   00C0 0000 0000 0000
        DECLE   $0000,  $0008,  $0004,  $0004   ; 5876   0000 0008 0004 0004
        DECLE   $00F8,  $0000,  $0000,  $0000   ; 587A   00F8 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 587E   0000 0000 0000 0000
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5882   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5886   0000 0000 0000 0000
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 588A   00FF 0000 0000 0000
        DECLE   $0000,  $0008,  $0004,  $0004   ; 588E   0000 0008 0004 0004
        DECLE   $00F8,  $0000,  $0000,  $0000   ; 5892   00F8 0000 0000 0000
        DECLE   $0000,  $0040,  $0020,  $0020   ; 5896   0000 0040 0020 0020
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 589A   00C0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0044   ; 589E   0000 0000 0000 0044
        DECLE   $0029,  $0052,  $002C,  $0000   ; 58A2   0029 0052 002C 0000
        DECLE   $000C,  $000C,  $00C6,  $00C6   ; 58A6   000C 000C 00C6 00C6
        DECLE   $00E3,  $0033,  $0019,  $0019   ; 58AA   00E3 0033 0019 0019
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58AE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58B2   0000 0000 0000 0000
        DECLE   $0030,  $0048,  $0084,  $0084   ; 58B6   0030 0048 0084 0084
        DECLE   $0044,  $0067,  $00B7,  $009C   ; 58BA   0044 0067 00B7 009C
        DECLE   $009C,  $0078,  $0030,  $00E0   ; 58BE   009C 0078 0030 00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58C6   0000 0000 0000 0000
        DECLE   $0030,  $004B,  $004F,  $004C   ; 58CA   0030 004B 004F 004C
        DECLE   $003C,  $0058,  $0030,  $00E0   ; 58CE   003C 0058 0030 00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58D2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58D6   0000 0000 0000 0000
        DECLE   $0000,  $0003,  $0007,  $000C   ; 58DA   0000 0003 0007 000C
        DECLE   $001C,  $001A,  $0039,  $00F9   ; 58DE   001C 001A 0039 00F9
        DECLE   $002E,  $0028,  $0010,  $0000   ; 58E2   002E 0028 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58E6   0000 0000 0000 0000
        DECLE   $0030,  $004B,  $004F,  $004C   ; 58EA   0030 004B 004F 004C
        DECLE   $003C,  $0058,  $0030,  $00E0   ; 58EE   003C 0058 0030 00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58F2   0000 0000 0000 0000
        DECLE   $0000,  $0022,  $0055,  $006B   ; 58F6   0000 0022 0055 006B
        DECLE   $005D,  $002A,  $001E,  $00FD   ; 58FA   005D 002A 001E 00FD
        DECLE   $0002,  $0000,  $0000,  $0000   ; 58FE   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5902   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5906   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $00FD   ; 590A   0000 0000 0002 00FD
        DECLE   $001E,  $002A,  $005D,  $006B   ; 590E   001E 002A 005D 006B
        DECLE   $0055,  $0022,  $0000,  $0000   ; 5912   0055 0022 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0034   ; 5916   0000 0000 0008 0034
        DECLE   $0052,  $004A,  $002B,  $00FF   ; 591A   0052 004A 002B 00FF
        DECLE   $003E,  $0000,  $0000,  $0000   ; 591E   003E 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5922   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5926   0000 0000 0000 0000
        DECLE   $000C,  $0032,  $004B,  $00FF   ; 592A   000C 0032 004B 00FF
        DECLE   $003E,  $0000,  $0000,  $0000   ; 592E   003E 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5932   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5936   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $00FF   ; 593A   0000 0000 0001 00FF
        DECLE   $003E,  $002A,  $004A,  $0052   ; 593E   003E 002A 004A 0052
        DECLE   $0034,  $0008,  $0000,  $0000   ; 5942   0034 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5946   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $00FF   ; 594A   0000 0000 0001 00FF
        DECLE   $003E,  $004A,  $0032,  $000C   ; 594E   003E 004A 0032 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5952   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 5956   0000 0000 0000 0008
        DECLE   $003E,  $0055,  $0063,  $0000   ; 595A   003E 0055 0063 0000
        DECLE   $0000,  $0063,  $0055,  $003E   ; 595E   0000 0063 0055 003E
        DECLE   $0008,  $0000,  $0000,  $0000   ; 5962   0008 0000 0000 0000
        DECLE   $0300,  $0000,  $0032,  $0050   ; 5966   0300 0000 0032 0050
        DECLE   $000E,  $0020,  $0001,  $002D   ; 596A   000E 0020 0001 002D
        DECLE   $005D,  $0000,  $0000,  $0000   ; 596E   005D 0000 0000 0000
        DECLE   $0000,  $000E,  $0000,  $0000   ; 5972   0000 000E 0000 0000
        DECLE   $0000,  $0000,  $0034,  $005F   ; 5976   0000 0000 0034 005F
        DECLE   $0007,  $0040,  $0004           ; 597A   0007 0040 0004

        SAR     R0,     2                       ; 597D   006C
        SLLC    R2,     2                       ; 597E   005E
        CMPR    R5,     R4                      ; 597F   016C
        SLLC    R2,     2                       ; 5980   005E
        PSHR    R5                              ; 5981   0275
        MVII    #$0008, R0                      ; 5982   02B8 0008
        CLRR    R1                              ; 5984   01C9
        DECR    R1                              ; 5985   0011
        SDBD                                    ; 5986   0001
        MVII    #$3980, R4                      ; 5987   02BC 0080 0039

        JSR     R5,     X_FILL_MEM              ; 598A   0004 0114 0341

        PULR    R5                              ; 598D   02B5
        J       L_5E49                          ; 598E   0004 035C 0249

.START:
        PSHR    R5                              ; 5991   0275

        JSR     R5,     L_5A38                  ; 5992   0004 0158 0238

        MVI     G_0103, R0                      ; 5995   0280 0103
        CMPI    #$0006, R0                      ; 5997   0378 0006
        BEQ     L_59C7                          ; 5999   0204 002C

        MOVR    R7,     R0                      ; 599B   00B8
        SUBI    #$001B, R0                      ; 599C   0338 001B

        JSR     R5,     L_5E3A                  ; 599E   0004 015C 023A

        SDBD                                    ; 59A1   0001
        MVII    #$5F7B, R4                      ; 59A2   02BC 007B 005F
        MVII    #$015F, R1                      ; 59A5   02B9 015F
        MVII    #$0010, R0                      ; 59A7   02B8 0010

        JSR     R5,     .EXEC.730               ; 59A9   0004 0114 0330

        MVII    #$015F, R2                      ; 59AC   02BA 015F

        JSR     R5,     L_5171                  ; 59AE   0004 0150 0171

        SDBD                                    ; 59B1   0001
        MVII    #$5020, R1                      ; 59B2   02B9 0020 0050

        JSR     R5,     X_TIMER_STOP            ; 59B5   0004 0118 0038

        SDBD                                    ; 59B8   0001
        MVII    #$5028, R1                      ; 59B9   02B9 0028 0050

        JSR     R5,     X_TIMER_STOP            ; 59BC   0004 0118 0038

        MVII    #$0001, R0                      ; 59BF   02B8 0001
        MVO     R0,     G_0177                  ; 59C1   0240 0177
        MVO     R0,     G_0180                  ; 59C3   0240 0180
        B       L_59F1                          ; 59C5   0200 002A

L_59C7:
        MVII    #$0200, R2                      ; 59C7   02BA 0200
        MVO     R2,     .BTAB.00                ; 59C9   0242 0200
        SDBD                                    ; 59CB   0001
        MVII    #$5F89, R2                      ; 59CC   02BA 0089 005F

        JSR     R5,     L_5171                  ; 59CF   0004 0150 0171

        SDBD                                    ; 59D2   0001
        MVII    #$5024, R1                      ; 59D3   02B9 0024 0050

        JSR     R5,     X_TIMER_STOP            ; 59D6   0004 0118 0038

        SDBD                                    ; 59D9   0001
        MVII    #$0987, R0                      ; 59DA   02B8 0087 0009
        MVO     R0,     .BTAB.09                ; 59DD   0240 0209
        ADDI    #$0008, R0                      ; 59DF   02F8 0008
        MVO     R0,     .BTAB.1D                ; 59E1   0240 021D
        MVII    #$0009, R0                      ; 59E3   02B8 0009
        MVO     R0,     G_015E                  ; 59E5   0240 015E
        MVII    #$0004, R0                      ; 59E7   02B8 0004
        MVO     R0,     G_0187                  ; 59E9   0240 0187
        MVII    #$0000, R0                      ; 59EB   02B8 0000
        MVO     R0,     G_0177                  ; 59ED   0240 0177
        MVO     R0,     G_0180                  ; 59EF   0240 0180
L_59F1:
        MVII    #$0003, R0                      ; 59F1   02B8 0003
        MVO     R0,     G_0103                  ; 59F3   0240 0103
        SDBD                                    ; 59F5   0001
        MVII    #$560C, R1                      ; 59F6   02B9 000C 0056
        MVII    #$0325, R2                      ; 59F9   02BA 0325

        JSR     R5,     X_INIT_MOBS             ; 59FB   0004 0114 02B4

        SDBD                                    ; 59FE   0001
        MVII    #$563C, R1                      ; 59FF   02B9 003C 0056
        MVII    #$0345, R2                      ; 5A02   02BA 0345

        JSR     R5,     X_INIT_MOBS             ; 5A04   0004 0114 02B4

        MVII    #$031D, R1                      ; 5A07   02B9 031D

        JSR     R5,     L_546D                  ; 5A09   0004 0154 006D

        MVII    #$033D, R1                      ; 5A0C   02B9 033D

        JSR     R5,     L_546D                  ; 5A0E   0004 0154 006D

        MVII    #$0002, R0                      ; 5A11   02B8 0002

        JSR     R5,     .EXEC.6CF               ; 5A13   0004 0114 02CF

        MVII    #$0003, R0                      ; 5A16   02B8 0003

        JSR     R5,     .EXEC.6CF               ; 5A18   0004 0114 02CF

        MVII    #$0006, R0                      ; 5A1B   02B8 0006

        JSR     R5,     .EXEC.6CF               ; 5A1D   0004 0114 02CF

        MVII    #$0007, R0                      ; 5A20   02B8 0007

        JSR     R5,     .EXEC.6CF               ; 5A22   0004 0114 02CF

        SDBD                                    ; 5A25   0001
        MVII    #$55A6, R0                      ; 5A26   02B8 00A6 0055
        MVO     R0,     G_035D                  ; 5A29   0240 035D
        MVII    #$0002, R0                      ; 5A2B   02B8 0002
        MVO     R0,     G_0115                  ; 5A2D   0240 0115
        MVII    #$0006, R0                      ; 5A2F   02B8 0006
        MVO     R0,     G_0117                  ; 5A31   0240 0117
        MVII    #$00A0, R0                      ; 5A33   02B8 00A0
        MVO     R0,     G_0116                  ; 5A35   0240 0116
        PULR    R7                              ; 5A37   02B7

L_5A38:
        MVII    #$016F, R1                      ; 5A38   02B9 016F
        MVII    #$0012, R0                      ; 5A3A   02B8 0012

        JSR     R4,     .EXEC.730               ; 5A3C   0004 0014 0330
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A3F   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0000   ; 5A43   0000 0001 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A47   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0002   ; 5A4B   0000 0000 0001 0002
        DECLE   $0000,  $0000                   ; 5A4F   0000 0000
L_5A51:
        PSHR    R5                              ; 5A51   0275
        PSHR    R2                              ; 5A52   0272
        PSHR    R3                              ; 5A53   0273

        JSR     R5,     X_UNPK_BYTES            ; 5A54   0004 0114 0357

        MOVR    R0,     R2                      ; 5A57   0082
        MOVR    R1,     R3                      ; 5A58   008B
        SAR     R2,     2                       ; 5A59   006E
        PSHR    R2                              ; 5A5A   0272
        SAR     R2,     2                       ; 5A5B   006E
        SUB@    R6,     R2                      ; 5A5C   0332
        SAR     R3,     2                       ; 5A5D   006F
        PSHR    R3                              ; 5A5E   0273
        SAR     R3,     2                       ; 5A5F   006F
        SUB@    R6,     R3                      ; 5A60   0333
        ADDR    R2,     R0                      ; 5A61   00D0
        SUBR    R3,     R0                      ; 5A62   0118
        ADDR    R3,     R1                      ; 5A63   00D9
        ADDR    R2,     R1                      ; 5A64   00D1

        JSR     R5,     X_PACK_BYTES            ; 5A65   0004 0114 034F

        PULR    R3                              ; 5A68   02B3
        PULR    R2                              ; 5A69   02B2
        PULR    R7                              ; 5A6A   02B7

L_5A6B:
        MVI     .PSG0.rgt_hand,R0               ; 5A6B   0280 01FE
        SLL     R0,     2                       ; 5A6D   004C
        SLL     R0,     2                       ; 5A6E   004C
        MVO     R5,     G_034A                  ; 5A6F   0245 034A
        XOR     .PSG0.lft_hand,R0               ; 5A71   03C0 01FF
        ADD     G_02F0, R0                      ; 5A73   02C0 02F0
        MOVR    R0,     R5                      ; 5A75   0085
        ADD@    R5,     R0                      ; 5A76   02E8
        ADD@    R5,     R0                      ; 5A77   02E8
        ADD@    R5,     R0                      ; 5A78   02E8
        ADD@    R5,     R0                      ; 5A79   02E8
        ADD@    R5,     R0                      ; 5A7A   02E8
        ADD@    R5,     R0                      ; 5A7B   02E8
        ADD@    R5,     R0                      ; 5A7C   02E8
        ADD@    R5,     R0                      ; 5A7D   02E8
        ADD@    R5,     R0                      ; 5A7E   02E8
        ADD@    R5,     R0                      ; 5A7F   02E8
        ADD@    R5,     R0                      ; 5A80   02E8
        SDBD                                    ; 5A81   0001
        CMPI    #$6ACB, R0                      ; 5A82   0378 00CB 006A
        BNEQ    L_5AD8                          ; 5A85   020C 0051

        MVII    #$0007, R3                      ; 5A87   02BB 0007
        MVII    #$023D, R4                      ; 5A89   02BC 023D

        JSR     R5,     X_PRINT_R5              ; 5A8B   0004 0118 007B
        STRING  " TAS & ASN & PK"               ; 5A8E  
        DECLE   $0000                           ; 5A9D   0000

        SDBD                                    ; 5A9E   0001
        MVII    #$098F, R0                      ; 5A9F   02B8 008F 0009
        MVO@    R0,     R4                      ; 5AA2   0260
        CLRR    R1                              ; 5AA3   01C9
        MVO@    R1,     R4                      ; 5AA4   0261
        MVO@    R1,     R4                      ; 5AA5   0261
        SUBI    #$0008, R0                      ; 5AA6   0338 0008
        MVO     R0,     .BTAB.38                ; 5AA8   0240 0238
        MVII    #$025D, R4                      ; 5AAA   02BC 025D
        MVII    #$0070, R0                      ; 5AAC   02B8 0070

        JSR     R5,     X_FILL_ZERO             ; 5AAE   0004 0114 0338

        MVII    #$0293, R4                      ; 5AB1   02BC 0293

        JSR     R5,     X_PRINT_R5              ; 5AB3   0004 0118 007B
        STRING  "Froys"                         ; 5AB6  
        DECLE   $0000                           ; 5ABB   0000

        MVII    #$02CA, R4                      ; 5ABC   02BC 02CA

        JSR     R5,     X_PRINT_R5              ; 5ABE   0004 0118 007B
        STRING  "DEI"                           ; 5AC1   0044 0045 0049
        DECLE   $0000                           ; 5AC4   0000

        MVII    #$0006, R0                      ; 5AC5   02B8 0006
        MVII    #$02D5, R4                      ; 5AC7   02BC 02D5

        JSR     R5,     X_FILL_ZERO             ; 5AC9   0004 0114 0338

        MOVR    R7,     R0                      ; 5ACC   00B8
        SDBD                                    ; 5ACD   0001
        ADDI    #$0014, R0                      ; 5ACE   02F8 0014 0000

        JSR     R5,     L_5E3A                  ; 5AD1   0004 015C 023A

        MVII    #$000E, R0                      ; 5AD4   02B8 000E
        MVO     R0,     G_0183                  ; 5AD6   0240 0183
L_5AD8:
        MVI     G_034A, R7                      ; 5AD8   0287 034A

        INCR    R0                              ; 5ADA   0008
        INCR    R0                              ; 5ADB   0008
        COMR    R4                              ; 5ADC   001C
        RRC     R3,     2                       ; 5ADD   0077
        COMR    R4                              ; 5ADE   001C
        INCR    R0                              ; 5ADF   0008
        INCR    R0                              ; 5AE0   0008
        PSHR    R5                              ; 5AE1   0275
        MVII    #$0007, R0                      ; 5AE2   02B8 0007
        SDBD                                    ; 5AE4   0001
        MVII    #$3984, R1                      ; 5AE5   02B9 0084 0039
        MOVR    R7,     R4                      ; 5AE8   00BC
        SUBI    #$000F, R4                      ; 5AE9   033C 000F

        JSR     R5,     .EXEC.730               ; 5AEB   0004 0114 0330

        PULR    R5                              ; 5AEE   02B5
        J       L_5E49                          ; 5AEF   0004 035C 0249

L_5AF2:
        PSHR    R5                              ; 5AF2   0275
        PSHR    R1                              ; 5AF3   0271
        PSHR    R2                              ; 5AF4   0272
        PSHR    R3                              ; 5AF5   0273
        SWAP    R0,     1                       ; 5AF6   0040

        JSR     R5,     L_5B5E                  ; 5AF7   0004 0158 035E
        DECLE   $0000,  $0000                   ; 5AFA   0000 0000

        MVI@    R3,     R1                      ; 5AFC   0299
        ANDI    #$0200, R1                      ; 5AFD   03B9 0200
        BNEQ    L_5B06                          ; 5AFF   020C 0005

        TSTR    R0                              ; 5B01   0080
        BPL     L_5B34                          ; 5B02   0203 0030
        B       L_5B09                          ; 5B04   0200 0003

L_5B06:
        TSTR    R0                              ; 5B06   0080
        BMI     L_5B34                          ; 5B07   020B 002B

L_5B09:
        ADDI    #$0002, R3                      ; 5B09   02FB 0002
        ADD@    R3,     R0                      ; 5B0B   02D8
        MVO@    R0,     R3                      ; 5B0C   0258
        ADDI    #$000A, R3                      ; 5B0D   02FB 000A
        MVI@    R3,     R0                      ; 5B0F   0298
        MOVR    R0,     R5                      ; 5B10   0085
        ANDI    #$00FF, R5                      ; 5B11   03BD 00FF
        SDBD                                    ; 5B13   0001
        ANDI    #$FF00, R0                      ; 5B14   03B8 0000 00FF
        NEGR    R0                              ; 5B17   0020
        SDBD                                    ; 5B18   0001
        ADDI    #$0800, R0                      ; 5B19   02F8 0000 0008
        XORR    R5,     R0                      ; 5B1C   01E8
        MVO@    R0,     R3                      ; 5B1D   0258
        ADDI    #$0008, R3                      ; 5B1E   02FB 0008
        MVI@    R3,     R0                      ; 5B20   0298
        NEGR    R0                              ; 5B21   0020
        MVO@    R0,     R3                      ; 5B22   0258
        SUBI    #$0014, R3                      ; 5B23   033B 0014
        MVII    #$0200, R1                      ; 5B25   02B9 0200
        MVI@    R3,     R0                      ; 5B27   0298
        XORR    R1,     R0                      ; 5B28   01C8
        MVO@    R0,     R3                      ; 5B29   0258
        ADDI    #$0008, R3                      ; 5B2A   02FB 0008
        MVI@    R3,     R0                      ; 5B2C   0298
        XORR    R1,     R0                      ; 5B2D   01C8
        MVO@    R0,     R3                      ; 5B2E   0258
        ADDI    #$0008, R3                      ; 5B2F   02FB 0008
        MVI@    R3,     R0                      ; 5B31   0298
        XORR    R1,     R0                      ; 5B32   01C8
        MVO@    R0,     R3                      ; 5B33   0258
L_5B34:
        PULR    R3                              ; 5B34   02B3
        PULR    R2                              ; 5B35   02B2
        PULR    R1                              ; 5B36   02B1
        PULR    R7                              ; 5B37   02B7

        DECLE   $0000,  $0000,  $00FE,  $00FF   ; 5B38   0000 0000 00FE 00FF

        ADDR    R7,     R5                      ; 5B3C   00FD
        ADDR    R7,     R3                      ; 5B3D   00FB
        ADDR    R7,     R6                      ; 5B3E   00FE
L_5B3F:
        PSHR    R5                              ; 5B3F   0275
        PSHR    R2                              ; 5B40   0272
        PSHR    R3                              ; 5B41   0273

        JSR     R5,     L_5B5E                  ; 5B42   0004 0158 035E
        DECLE   $0000                           ; 5B45   0000

        INCR    R4                              ; 5B46   000C
        MVI@    R3,     R5                      ; 5B47   029D
        SDBD                                    ; 5B48   0001
        ANDI    #$FF00, R5                      ; 5B49   03BD 0000 00FF
        CMPI    #$0007, R0                      ; 5B4C   0378 0007
        BGE     L_5B55                          ; 5B4E   020D 0005

        MOVR    R0,     R2                      ; 5B50   0082
        ADDR    R7,     R2                      ; 5B51   00FA
        SUBI    #$001A, R2                      ; 5B52   033A 001A
        XOR@    R2,     R5                      ; 5B54   03D5
L_5B55:
        MVO@    R5,     R3                      ; 5B55   025D
        INCR    R3                              ; 5B56   000B
        MVO@    R0,     R3                      ; 5B57   0258
        ADDI    #$0008, R3                      ; 5B58   02FB 0008
        MVO@    R0,     R3                      ; 5B5A   0258
        PULR    R3                              ; 5B5B   02B3
        PULR    R2                              ; 5B5C   02B2
        PULR    R7                              ; 5B5D   02B7

L_5B5E:
        PSHR    R0                              ; 5B5E   0270
        MVII    #$016F, R2                      ; 5B5F   02BA 016F
        MVII    #$0325, R3                      ; 5B61   02BB 0325
        MVI     G_0188, R0                      ; 5B63   0280 0188
        CMPI    #$0000, R0                      ; 5B65   0378 0000
        BEQ     L_5B6D                          ; 5B67   0204 0004

        ADDI    #$0009, R2                      ; 5B69   02FA 0009
        ADDI    #$0020, R3                      ; 5B6B   02FB 0020
L_5B6D:
        ADD@    R5,     R2                      ; 5B6D   02EA
        ADD@    R5,     R3                      ; 5B6E   02EB
        PULR    R0                              ; 5B6F   02B0
        MOVR    R5,     R7                      ; 5B70   00AF

        COMR    R6                              ; 5B71   001E
        SAR     R0,     2                       ; 5B72   006C
        GSWD    R0                              ; 5B73   0030
        SARC    R2,     2                       ; 5B74   007E
L_5B75:
        PSHR    R5                              ; 5B75   0275

        JSR     R5,     L_5B5E                  ; 5B76   0004 0158 035E
        DECLE   $0005,  $0004                   ; 5B79   0005 0004

        CLRR    R0                              ; 5B7B   01C0
        MVO@    R0,     R3                      ; 5B7C   0258

        JSR     R5,     L_5BA2                  ; 5B7D   0004 0158 03A2
        JSR     R5,     L_5B5E                  ; 5B80   0004 0158 035E

        INCR    R0                              ; 5B83   0008
        INCR    R4                              ; 5B84   000C
        MVI@    R2,     R0                      ; 5B85   0290
        SUBI    #$0002, R2                      ; 5B86   033A 0002
        CMPI    #$0001, R0                      ; 5B88   0378 0001
        BNEQ    L_5B9D                          ; 5B8A   020C 0011

        MVI     G_0188, R1                      ; 5B8C   0281 0188
        SLL     R1,     1                       ; 5B8E   0049
        ADD@    R2,     R1                      ; 5B8F   02D1
        ADDR    R7,     R1                      ; 5B90   00F9
        SUBI    #$0021, R1                      ; 5B91   0339 0021
        MVI@    R1,     R0                      ; 5B93   0288
        MVI@    R3,     R1                      ; 5B94   0299
        SWAP    R1,     1                       ; 5B95   0041
        ANDI    #$00FF, R1                      ; 5B96   03B9 00FF
        SUBR    R1,     R0                      ; 5B98   0108
        SWAP    R0,     1                       ; 5B99   0040
        SUBI    #$000A, R3                      ; 5B9A   033B 000A
        MVO@    R0,     R3                      ; 5B9C   0258
L_5B9D:
        DECR    R2                              ; 5B9D   0012
        MVII    #$0001, R0                      ; 5B9E   02B8 0001
        MVO@    R0,     R2                      ; 5BA0   0250
        PULR    R7                              ; 5BA1   02B7

L_5BA2:
        PSHR    R5                              ; 5BA2   0275

        JSR     R5,     L_5B5E                  ; 5BA3   0004 0158 035E
        DECLE   $0000                           ; 5BA6   0000

        DIS                                     ; 5BA7   0003
        MVI@    R3,     R0                      ; 5BA8   0298
        SDBD                                    ; 5BA9   0001
        ADDI    #$0500, R0                      ; 5BAA   02F8 0000 0005
        MVO@    R0,     R3                      ; 5BAD   0258
        MVII    #$0006, R0                      ; 5BAE   02B8 0006

        JSR     R5,     L_5B3F                  ; 5BB0   0004 0158 033F

        MVII    #$0002, R0                      ; 5BB3   02B8 0002

        JSR     R5,     L_5BD7                  ; 5BB5   0004 0158 03D7

        MVI     G_0183, R0                      ; 5BB8   0280 0183

        JSR     R5,     L_5B3F                  ; 5BBA   0004 0158 033F

        MVI     G_0184, R0                      ; 5BBD   0280 0184
        CMPI    #$0003, R0                      ; 5BBF   0378 0003
        BNEQ    L_5BD6                          ; 5BC1   020C 0013

        JSR     R5,     X_PLAY_SFX2             ; 5BC3   0004 0118 03BE
        DECLE   $0078                           ; 5BC6  SFX prio
        DECLE   $03C9,  $000C,  $0100,  $020B   ; 5BC7   03C9 000C 0100 020B
        DECLE   $0040,  $0180,  $0048,  $0080   ; 5BCB   0040 0180 0048 0080
        DECLE   $0001,  $00C0,  $01EB,  $0001   ; 5BCF   0001 00C0 01EB 0001

        INCR    R7                              ; 5BD3   000F

        XOR@    R5,     R3                      ; 5BD4   03EB
L_5BD5:
        ADDR    R1,     R7                      ; 5BD5   00CF
L_5BD6:
        PULR    R7                              ; 5BD6   02B7

L_5BD7:
        TSTR    R0                              ; 5BD7   0080
        BNEQ    L_5BDB                          ; 5BD8   020C 0001
        MOVR    R5,     R7                      ; 5BDA   00AF

L_5BDB:
        MVII    #$018B, R4                      ; 5BDB   02BC 018B
L_5BDD:
        MVI@    R4,     R2                      ; 5BDD   02A2
        TSTR    R2                              ; 5BDE   0092
        BEQ     L_5BE5                          ; 5BDF   0204 0004

        ADDI    #$0003, R4                      ; 5BE1   02FC 0003
        B       L_5BDD                          ; 5BE3   0220 0007

L_5BE5:
        MVI     G_0188, R3                      ; 5BE5   0283 0188
        MVO@    R3,     R4                      ; 5BE7   0263
        MVO@    R5,     R4                      ; 5BE8   0265
        MOVR    R5,     R3                      ; 5BE9   00AB
        SWAP    R3,     1                       ; 5BEA   0043
        MVO@    R3,     R4                      ; 5BEB   0263
        SUBI    #$0004, R4                      ; 5BEC   033C 0004
        MVO@    R0,     R4                      ; 5BEE   0260
        PULR    R7                              ; 5BEF   02B7

L_5BF0:
        PSHR    R5                              ; 5BF0   0275
        CLRR    R4                              ; 5BF1   01E4
L_5BF2:
        MVO     R4,     G_018A                  ; 5BF2   0244 018A
        ADDI    #$018B, R4                      ; 5BF4   02FC 018B
        MVI@    R4,     R0                      ; 5BF6   02A0
        TSTR    R0                              ; 5BF7   0080
        BEQ     L_5C08                          ; 5BF8   0204 000E

        DECR    R4                              ; 5BFA   0014
        DECR    R0                              ; 5BFB   0010
        MVO@    R0,     R4                      ; 5BFC   0260
        BNEQ    L_5C08                          ; 5BFD   020C 0009

        MVI@    R4,     R3                      ; 5BFF   02A3
        MVO     R3,     G_0188                  ; 5C00   0243 0188
        MOVR    R7,     R5                      ; 5C02   00BD
        ADDI    #$0005, R5                      ; 5C03   02FD 0005
        PSHR    R5                              ; 5C05   0275
        SDBD                                    ; 5C06   0001
        MVI@    R4,     R7                      ; 5C07   02A7

L_5C08:
        MVI     G_018A, R4                      ; 5C08   0284 018A
        ADDI    #$0004, R4                      ; 5C0A   02FC 0004
        CMPI    #$002C, R4                      ; 5C0C   037C 002C
        BNC     L_5BF2                          ; 5C0E   0229 001D
        PULR    R7                              ; 5C10   02B7

L_5C11:
        PSHR    R5                              ; 5C11   0275

        JSR     R5,     L_5B5E                  ; 5C12   0004 0158 035E
        DECLE   $0000                           ; 5C15   0000

        INCR    R4                              ; 5C16   000C
        MVII    #$00FC, R0                      ; 5C17   02B8 00FC
        MVO@    R0,     R3                      ; 5C19   0258
        MVII    #$0007, R0                      ; 5C1A   02B8 0007

        JSR     R5,     L_5D7B                  ; 5C1C   0004 015C 017B

        MVII    #$0001, R0                      ; 5C1F   02B8 0001

        JSR     R5,     L_5BD7                  ; 5C21   0004 0158 03D7
        JSR     R5,     L_52C8                  ; 5C24   0004 0150 02C8
        JSR     R5,     L_5B5E                  ; 5C27   0004 0158 035E
        DECLE   $0000,  $0000                   ; 5C2A   0000 0000

        MVI@    R3,     R0                      ; 5C2C   0298
        ANDI    #$0200, R0                      ; 5C2D   03B8 0200
        SDBD                                    ; 5C2F   0001
        XORI    #$1007, R0                      ; 5C30   03F8 0007 0010
        MVO@    R0,     R3                      ; 5C33   0258
        MVII    #$0002, R0                      ; 5C34   02B8 0002

        JSR     R5,     L_5BD7                  ; 5C36   0004 0158 03D7

        MVII    #$0008, R0                      ; 5C39   02B8 0008

        JSR     R5,     L_5D7B                  ; 5C3B   0004 015C 017B

        MVII    #$0001, R0                      ; 5C3E   02B8 0001

        JSR     R5,     L_5BD7                  ; 5C40   0004 0158 03D7
        JSR     R5,     L_5B5E                  ; 5C43   0004 0158 035E

        DIS                                     ; 5C46   0003
        INCR    R0                              ; 5C47   0008
        MVI@    R3,     R0                      ; 5C48   0298
        MVO@    R0,     R2                      ; 5C49   0250
        ANDI    #$0240, R0                      ; 5C4A   03B8 0240
        SDBD                                    ; 5C4C   0001
        XORI    #$1007, R0                      ; 5C4D   03F8 0007 0010
        MVO@    R0,     R3                      ; 5C50   0258
        ADDI    #$0008, R3                      ; 5C51   02FB 0008
        MVI@    R3,     R0                      ; 5C53   0298
        ANDI    #$0240, R0                      ; 5C54   03B8 0240
        SDBD                                    ; 5C56   0001
        XORI    #$1007, R0                      ; 5C57   03F8 0007 0010
        MVO@    R0,     R3                      ; 5C5A   0258
        SUBI    #$0010, R3                      ; 5C5B   033B 0010
        MVI@    R3,     R0                      ; 5C5D   0298
        MVI@    R2,     R1                      ; 5C5E   0291
        ANDI    #$0017, R1                      ; 5C5F   03B9 0017
        SDBD                                    ; 5C61   0001
        ANDI    #$FFE8, R0                      ; 5C62   03B8 00E8 00FF
        XORR    R1,     R0                      ; 5C65   01C8
        MVO@    R0,     R3                      ; 5C66   0258
        MVII    #$0002, R0                      ; 5C67   02B8 0002

        JSR     R5,     L_5BD7                  ; 5C69   0004 0158 03D7

        MVII    #$0009, R0                      ; 5C6C   02B8 0009

        JSR     R5,     L_5D7B                  ; 5C6E   0004 015C 017B

        SUBI    #$0015, R3                      ; 5C71   033B 0015
        MVI@    R3,     R0                      ; 5C73   0298
        SDBD                                    ; 5C74   0001
        ANDI    #$EFFF, R0                      ; 5C75   03B8 00FF 00EF
        MVO@    R0,     R3                      ; 5C78   0258
        MVII    #$0002, R0                      ; 5C79   02B8 0002

        JSR     R5,     L_5BD7                  ; 5C7B   0004 0158 03D7

        MVII    #$000A, R0                      ; 5C7E   02B8 000A

        JSR     R5,     L_5D7B                  ; 5C80   0004 015C 017B

        MVII    #$0002, R0                      ; 5C83   02B8 0002

        JSR     R5,     L_5BD7                  ; 5C85   0004 0158 03D7

        MVII    #$000B, R0                      ; 5C88   02B8 000B

        JSR     R5,     L_5D7B                  ; 5C8A   0004 015C 017B

        MVII    #$0002, R0                      ; 5C8D   02B8 0002

        JSR     R5,     L_5BD7                  ; 5C8F   0004 0158 03D7
        JSR     R5,     L_5B5E                  ; 5C92   0004 0158 035E
        DECLE   $0000                           ; 5C95   0000

        INCR    R0                              ; 5C96   0008
        SDBD                                    ; 5C97   0001
        MVII    #$EFFF, R1                      ; 5C98   02B9 00FF 00EF
        MVI@    R3,     R0                      ; 5C9B   0298
        ANDR    R1,     R0                      ; 5C9C   0188
        MVO@    R0,     R3                      ; 5C9D   0258
        ADDI    #$0008, R3                      ; 5C9E   02FB 0008
        MVI@    R3,     R0                      ; 5CA0   0298
        ANDR    R1,     R0                      ; 5CA1   0188
        MVO@    R0,     R3                      ; 5CA2   0258
        MVII    #$0004, R0                      ; 5CA3   02B8 0004

        JSR     R5,     L_5BD7                  ; 5CA5   0004 0158 03D7

        MVII    #$000C, R0                      ; 5CA8   02B8 000C

        JSR     R5,     L_5D7B                  ; 5CAA   0004 015C 017B

        MVII    #$0001, R0                      ; 5CAD   02B8 0001

        JSR     R5,     L_5BD7                  ; 5CAF   0004 0158 03D7
        JSR     R5,     L_5B5E                  ; 5CB2   0004 0158 035E

        DIS                                     ; 5CB5   0003
        INCR    R0                              ; 5CB6   0008
        MVI@    R3,     R0                      ; 5CB7   0298
        ANDI    #$0200, R0                      ; 5CB8   03B8 0200
        SDBD                                    ; 5CBA   0001
        XORI    #$1000, R0                      ; 5CBB   03F8 0000 0010
        XOR@    R2,     R0                      ; 5CBE   03D0
        MVO@    R0,     R3                      ; 5CBF   0258
        ADDI    #$0008, R3                      ; 5CC0   02FB 0008
        MVI@    R3,     R0                      ; 5CC2   0298
        ANDI    #$0200, R0                      ; 5CC3   03B8 0200
        SDBD                                    ; 5CC5   0001
        XORI    #$1000, R0                      ; 5CC6   03F8 0000 0010
        XOR@    R2,     R0                      ; 5CC9   03D0
        MVO@    R0,     R3                      ; 5CCA   0258
        MVII    #$0004, R0                      ; 5CCB   02B8 0004

        JSR     R5,     L_5BD7                  ; 5CCD   0004 0158 03D7
        JSR     R5,     L_5B5E                  ; 5CD0   0004 0158 035E
        DECLE   $0000                           ; 5CD3   0000

        INCR    R2                              ; 5CD4   000A
        MOVR    R3,     R4                      ; 5CD5   009C
        MOVR    R3,     R5                      ; 5CD6   009D
        SUBI    #$0008, R5                      ; 5CD7   033D 0008
        MVI@    R4,     R0                      ; 5CD9   02A0
        MVO@    R0,     R5                      ; 5CDA   0268
        MVI@    R4,     R0                      ; 5CDB   02A0
        MVO@    R0,     R5                      ; 5CDC   0268
        SUBI    #$0002, R5                      ; 5CDD   033D 0002
        SUBI    #$000A, R3                      ; 5CDF   033B 000A
        MVI@    R3,     R0                      ; 5CE1   0298
        ADDI    #$000C, R3                      ; 5CE2   02FB 000C
        SWAP    R0,     1                       ; 5CE4   0040
        ANDI    #$0002, R0                      ; 5CE5   03B8 0002
        BNEQ    L_5CF7                          ; 5CE7   020C 000E

        MVII    #$0008, R0                      ; 5CE9   02B8 0008
        SWAP    R0,     1                       ; 5CEB   0040
        NEGR    R0                              ; 5CEC   0020
        MVO@    R0,     R3                      ; 5CED   0258
        ADDI    #$0008, R3                      ; 5CEE   02FB 0008
        MVO@    R0,     R3                      ; 5CF0   0258
        NEGR    R0                              ; 5CF1   0020
        ADD@    R5,     R0                      ; 5CF2   02E8
        DECR    R5                              ; 5CF3   0015
        MVO@    R0,     R5                      ; 5CF4   0268
        B       L_5D04                          ; 5CF5   0200 000D

L_5CF7:
        MVII    #$0010, R0                      ; 5CF7   02B8 0010
        SWAP    R0,     1                       ; 5CF9   0040
        MVO@    R0,     R3                      ; 5CFA   0258
        NEGR    R0                              ; 5CFB   0020
        ADD@    R5,     R0                      ; 5CFC   02E8
        DECR    R5                              ; 5CFD   0015
        MVO@    R0,     R5                      ; 5CFE   0268
        MVII    #$0008, R0                      ; 5CFF   02B8 0008
        ADDR    R0,     R3                      ; 5D01   00C3
        SWAP    R0,     1                       ; 5D02   0040
        MVO@    R0,     R3                      ; 5D03   0258

L_5D04:
        JSR     R5,     L_5B5E                  ; 5D04   0004 0158 035E

        SETC                                    ; 5D07   0007
        INCR    R0                              ; 5D08   0008
        MVII    #$000E, R1                      ; 5D09   02B9 000E
        SWAP    R1,     1                       ; 5D0B   0041
        MVII    #$0015, R0                      ; 5D0C   02B8 0015
        MVI@    R2,     R2                      ; 5D0E   0292
        CMPI    #$0002, R2                      ; 5D0F   037A 0002
        BLT     L_5D1E                          ; 5D11   0205 000B
        BGT     L_5D1B                          ; 5D13   020E 0006

        MVI@    R3,     R2                      ; 5D15   029A
        SWAP    R2,     1                       ; 5D16   0042
        ANDI    #$0002, R2                      ; 5D17   03BA 0002
        BEQ     L_5D1E                          ; 5D19   0204 0003

L_5D1B:
        MVII    #$00EB, R0                      ; 5D1B   02B8 00EB
        NEGR    R1                              ; 5D1D   0021

L_5D1E:
        JSR     R5,     L_5AF2                  ; 5D1E   0004 0158 02F2

        MVI@    R3,     R0                      ; 5D21   0298
        ANDI    #$0257, R0                      ; 5D22   03B8 0257
        SDBD                                    ; 5D24   0001
        XORI    #$1800, R0                      ; 5D25   03F8 0000 0018
        MVO@    R0,     R3                      ; 5D28   0258
        SUBI    #$0004, R3                      ; 5D29   033B 0004
        MVO@    R1,     R3                      ; 5D2B   0259
        PULR    R7                              ; 5D2C   02B7

        PSHR    R5                              ; 5D2D   0275
        SLR     R0,     2                       ; 5D2E   0064
        MVO     R0,     G_0188                  ; 5D2F   0240 0188
        ADDI    #$0005, R1                      ; 5D31   02F9 0005
        MVI@    R1,     R0                      ; 5D33   0288
        CMPI    #$000C, R0                      ; 5D34   0378 000C
        BNEQ    L_5D7A                          ; 5D36   020C 0042

        INCR    R0                              ; 5D38   0008
        MVO@    R0,     R1                      ; 5D39   0248
        MVII    #$0005, R0                      ; 5D3A   02B8 0005

        JSR     R5,     L_5BD7                  ; 5D3C   0004 0158 03D7
        JSR     R5,     L_5B5E                  ; 5D3F   0004 0158 035E

        SETC                                    ; 5D42   0007
        EIS                                     ; 5D43   0002
        MVII    #$0074, R0                      ; 5D44   02B8 0074
        MVII    #$0002, R1                      ; 5D46   02B9 0002
        MVI@    R2,     R5                      ; 5D48   0295
        CMPI    #$0002, R5                      ; 5D49   037D 0002
        BLT     L_5D60                          ; 5D4B   0205 0013
        BGT     L_5D64                          ; 5D4D   020E 0015

        MVII    #$0069, R0                      ; 5D4F   02B8 0069
        SUBI    #$0002, R3                      ; 5D51   033B 0002
        MVI@    R3,     R5                      ; 5D53   029D
        ADDI    #$0002, R3                      ; 5D54   02FB 0002
        ANDI    #$0200, R5                      ; 5D56   03BD 0200
        BEQ     L_5D64                          ; 5D58   0204 000A

        MVII    #$003A, R0                      ; 5D5A   02B8 003A
        MVII    #$0001, R1                      ; 5D5C   02B9 0001
        B       L_5D64                          ; 5D5E   0200 0004

L_5D60:
        MVII    #$0022, R0                      ; 5D60   02B8 0022
        MVII    #$0001, R1                      ; 5D62   02B9 0001
L_5D64:
        SWAP    R0,     1                       ; 5D64   0040
        MVO@    R0,     R3                      ; 5D65   0258
        SUBI    #$0002, R3                      ; 5D66   033B 0002
        MVI@    R3,     R0                      ; 5D68   0298
        ANDI    #$0200, R0                      ; 5D69   03B8 0200
        SDBD                                    ; 5D6B   0001
        XORI    #$2806, R0                      ; 5D6C   03F8 0006 0028
        MVO@    R0,     R3                      ; 5D6F   0258
        CLRR    R0                              ; 5D70   01C0
        ADDI    #$0005, R3                      ; 5D71   02FB 0005
        MVO@    R0,     R3                      ; 5D73   0258
        MVO@    R0,     R2                      ; 5D74   0250
        DECR    R2                              ; 5D75   0012
        MVO@    R1,     R2                      ; 5D76   0251

        JSR     R5,     L_5B75                  ; 5D77   0004 0158 0375

L_5D7A:
        PULR    R7                              ; 5D7A   02B7

L_5D7B:
        PSHR    R5                              ; 5D7B   0275

        JSR     R5,     L_5B5E                  ; 5D7C   0004 0158 035E
        DECLE   $0000,  $0005                   ; 5D7F   0000 0005

        MVO@    R0,     R3                      ; 5D81   0258
        ADDI    #$0008, R3                      ; 5D82   02FB 0008
        MVO@    R0,     R3                      ; 5D84   0258
        ADDI    #$0008, R3                      ; 5D85   02FB 0008
        MVO@    R0,     R3                      ; 5D87   0258
        PULR    R7                              ; 5D88   02B7

L_5D89:
        PSHR    R5                              ; 5D89   0275

        JSR     R5,     L_5BF0                  ; 5D8A   0004 0158 03F0

        CLRR    R0                              ; 5D8D   01C0
        MVO     R0,     G_0188                  ; 5D8E   0240 0188

        JSR     R5,     L_52FC                  ; 5D90   0004 0150 02FC

        MVII    #$0001, R0                      ; 5D93   02B8 0001
        MVO     R0,     G_0188                  ; 5D95   0240 0188

        JSR     R5,     L_52FC                  ; 5D97   0004 0150 02FC
        JSR     R5,     L_5531                  ; 5D9A   0004 0154 0131

        PULR    R7                              ; 5D9D   02B7

        DECLE   $001A,  $0007,  $001A,  $0007   ; 5D9E   001A 0007 001A 0007
        DECLE   $001A,  $0007,  $001C,  $0006   ; 5DA2   001A 0007 001C 0006
        DECLE   $001E,  $0003,  $0008,  $0000   ; 5DA6   001E 0003 0008 0000
L_5DAA:
        PSHR    R5                              ; 5DAA   0275
        MVI     G_0187, R0                      ; 5DAB   0280 0187
        MOVR    R0,     R4                      ; 5DAD   0084
        ADDR    R4,     R4                      ; 5DAE   00E4
        ADDR    R7,     R4                      ; 5DAF   00FC
        SUBI    #$0012, R4                      ; 5DB0   033C 0012
        MVI@    R4,     R1                      ; 5DB2   02A1
        MVI@    R4,     R2                      ; 5DB3   02A2
        MVII    #$0160, R4                      ; 5DB4   02BC 0160
        MVO@    R1,     R4                      ; 5DB6   0261
        MVO@    R2,     R4                      ; 5DB7   0262
        MVO@    R1,     R4                      ; 5DB8   0261
        INCR    R4                              ; 5DB9   000C
        MVO@    R1,     R4                      ; 5DBA   0261
        PSHR    R2                              ; 5DBB   0272
        INCR    R0                              ; 5DBC   0008
        MVO     R0,     G_0187                  ; 5DBD   0240 0187
        MVII    #$015F, R2                      ; 5DBF   02BA 015F

        JSR     R5,     L_5171                  ; 5DC1   0004 0150 0171

        PULR    R2                              ; 5DC4   02B2
        TSTR    R2                              ; 5DC5   0092
        BNEQ    L_5DCB                          ; 5DC6   020C 0003

        JSR     R5,     L_5E1F                  ; 5DC8   0004 015C 021F

L_5DCB:
        J       L_5EAB                          ; 5DCB   0004 035C 02AB

        SDBD                                    ; 5DCE   0001
        MVII    #$398F, R4                      ; 5DCF   02BC 008F 0039
        MVI@    R4,     R1                      ; 5DD2   02A1
        MVII    #$000F, R2                      ; 5DD3   02BA 000F
        SUBI    #$0002, R4                      ; 5DD5   033C 0002
L_5DD7:
        MVI@    R4,     R0                      ; 5DD7   02A0
        MVO@    R0,     R4                      ; 5DD8   0260
        SUBI    #$0003, R4                      ; 5DD9   033C 0003
        DECR    R2                              ; 5DDB   0012
        BNEQ    L_5DD7                          ; 5DDC   022C 0006

        INCR    R4                              ; 5DDE   000C
        MVO@    R1,     R4                      ; 5DDF   0261
        J       L_5E49                          ; 5DE0   0004 035C 0249

L_5DE3:
        PSHR    R5                              ; 5DE3   0275
        MOVR    R7,     R0                      ; 5DE4   00B8
        SUBI    #$0017, R0                      ; 5DE5   0338 0017

        JSR     R5,     L_5E3A                  ; 5DE7   0004 015C 023A

        MVI     G_0187, R0                      ; 5DEA   0280 0187
        INCR    R0                              ; 5DEC   0008
        MVO     R0,     G_0187                  ; 5DED   0240 0187
        ANDI    #$0007, R0                      ; 5DEF   03B8 0007
        BNEQ    L_5E1E                          ; 5DF1   020C 002B

L_5DF3:
        MVI     .ISRVEC.0,R0                    ; 5DF3   0280 0100
        CMP     G_0186, R0                      ; 5DF5   0340 0186
        BNEQ    L_5DF3                          ; 5DF7   022C 0005

        MVI     G_015E, R3                      ; 5DF9   0283 015E
        ADDI    #$0200, R3                      ; 5DFB   02FB 0200
        CMPI    #$0281, R3                      ; 5DFD   037B 0281
        BLT     L_5E12                          ; 5DFF   0205 0011
        BNEQ    L_5E0D                          ; 5E01   020C 000A

        MVII    #$0000, R2                      ; 5E03   02BA 0000
        SWAP    R2,     1                       ; 5E05   0042
        MVO@    R2,     R3                      ; 5E06   025A
        SUBI    #$01EC, R3                      ; 5E07   033B 01EC
        MVO     R3,     G_015E                  ; 5E09   0243 015E
        B       L_5E1E                          ; 5E0B   0200 0011

L_5E0D:
        JSR     R5,     L_5E1F                  ; 5E0D   0004 015C 021F

        B       L_5E1E                          ; 5E10   0200 000C

L_5E12:
        MVI@    R3,     R1                      ; 5E12   0299
        MVII    #$0000, R2                      ; 5E13   02BA 0000
        SWAP    R2,     1                       ; 5E15   0042
        MVO@    R2,     R3                      ; 5E16   025A
        SUBI    #$01EC, R3                      ; 5E17   033B 01EC
        MVO     R3,     G_015E                  ; 5E19   0243 015E
        ADDI    #$0214, R3                      ; 5E1B   02FB 0214
        MVO@    R1,     R3                      ; 5E1D   0259
L_5E1E:
        PULR    R7                              ; 5E1E   02B7

L_5E1F:
        PSHR    R5                              ; 5E1F   0275
        MVII    #$0001, R0                      ; 5E20   02B8 0001
        MVO     R0,     G_0184                  ; 5E22   0240 0184
        SDBD                                    ; 5E24   0001
        MVII    #$5024, R1                      ; 5E25   02B9 0024 0050

        JSR     R5,     X_TIMER_STOP            ; 5E28   0004 0118 0038

        SDBD                                    ; 5E2B   0001
        MVII    #$5020, R1                      ; 5E2C   02B9 0020 0050

        JSR     R5,     X_TIMER_STOP            ; 5E2F   0004 0118 0038

        SDBD                                    ; 5E32   0001
        MVII    #$5028, R1                      ; 5E33   02B9 0028 0050

        JSR     R5,     X_TIMER_START           ; 5E36   0004 0118 0044

        PULR    R7                              ; 5E39   02B7

L_5E3A:
        PSHR    R5                              ; 5E3A   0275
        MVI     .ISRVEC.0,R5                    ; 5E3B   0285 0100
        MVO     R5,     G_0186                  ; 5E3D   0245 0186
        MVI     .ISRVEC.1,R5                    ; 5E3F   0285 0101
        MVO     R5,     G_0185                  ; 5E41   0245 0185
        MVO     R0,     .ISRVEC.0               ; 5E43   0240 0100
        SWAP    R0,     1                       ; 5E45   0040
        MVO     R0,     .ISRVEC.1               ; 5E46   0240 0101
        PULR    R7                              ; 5E48   02B7

L_5E49:
        MVII    #$0185, R4                      ; 5E49   02BC 0185
        SDBD                                    ; 5E4B   0001
        MVI@    R4,     R0                      ; 5E4C   02A0
        MVO     R0,     .ISRVEC.1               ; 5E4D   0240 0101
        SWAP    R0,     1                       ; 5E4F   0040
        MVO     R0,     .ISRVEC.0               ; 5E50   0240 0100
        MOVR    R0,     R7                      ; 5E52   0087

L_5E53:
        PSHR    R5                              ; 5E53   0275

        JSR     R5,     X_PLAY_SFX2             ; 5E54   0004 0118 03BE
        DECLE   $0046                           ; 5E57  SFX prio
        DECLE   $0239                           ; 5E58   0239

        XOR@    R5,     R5                      ; 5E59   03ED
        INCR    R7                              ; 5E5A   000F

        DECLE   $03EF                           ; 5E5B   03EF
L_5E5C:
        CMPR    R6,     R5                      ; 5E5C   0175
        MOVR    R0,     R4                      ; 5E5D   0084
        ADDR    R6,     R0                      ; 5E5E   00F0
        SDBD                                    ; 5E5F   0001
        XOR@    R4,     R1                      ; 5E60   03E1
        RSWD    R6                              ; 5E61   003E
        CMP@    R5,     R3                      ; 5E62   036B
        INCR    R7                              ; 5E63   000F

        CLRC                                    ; 5E64   0006
L_5E65:
        XOR@    R1,     R6                      ; 5E65   03CE
        ANDR    R5,     R3                      ; 5E66   01AB
        SUB@    R1,     R5                      ; 5E67   030D
        PSHR    R5                              ; 5E68   0275
        DECR    R5                              ; 5E69   0015
        ADCR    R3                              ; 5E6A   002B
        ADD@    R1,     R7                      ; 5E6B   02CF

        PSHR    R5                              ; 5E6C   0275
        SLR     R0,     2                       ; 5E6D   0064
        MVO     R0,     G_0188                  ; 5E6E   0240 0188
        MVII    #$0010, R2                      ; 5E70   02BA 0010
        SWAP    R2,     1                       ; 5E72   0042
        AND@    R1,     R2                      ; 5E73   038A
        BNEQ    L_5E83                          ; 5E74   020C 000D

        PSHR    R3                              ; 5E76   0273

        JSR     R5,     L_5B5E                  ; 5E77   0004 0158 035E
        DECLE   $0008,  $0000                   ; 5E7A   0008 0000

        PULR    R3                              ; 5E7C   02B3
        MVI@    R2,     R2                      ; 5E7D   0292
        CMPI    #$0002, R2                      ; 5E7E   037A 0002
        BNEQ    L_5EFC                          ; 5E80   020C 007A
        PULR    R7                              ; 5E82   02B7

L_5E83:
        MOVR    R1,     R2                      ; 5E83   008A
        MOVR    R3,     R0                      ; 5E84   0098

        JSR     R5,     .EXEC.76C               ; 5E85   0004 0114 036C
        JSR     R5,     .EXEC.7AE               ; 5E88   0004 0114 03AE

        MVII    #$0007, R0                      ; 5E8B   02B8 0007
        ADDR    R0,     R1                      ; 5E8D   00C1
        MVI@    R1,     R3                      ; 5E8E   028B
        SDBD                                    ; 5E8F   0001
        ADDI    #$5454, R3                      ; 5E90   02FB 0054 0054
        MVI@    R3,     R3                      ; 5E93   029B
        ADDR    R0,     R2                      ; 5E94   00C2
        ADD@    R2,     R3                      ; 5E95   02D3
        MVO@    R3,     R2                      ; 5E96   0253

        JSR     R5,     L_52B2                  ; 5E97   0004 0150 02B2

        MVII    #$0002, R0                      ; 5E9A   02B8 0002

        JSR     R5,     L_5BD7                  ; 5E9C   0004 0158 03D7

        MVII    #$031D, R1                      ; 5E9F   02B9 031D

        JSR     R5,     .EXEC.760               ; 5EA1   0004 0114 0360

        BEQ     L_5EA8                          ; 5EA4   0204 0002

        MVII    #$033D, R1                      ; 5EA6   02B9 033D

L_5EA8:
        JSR     R5,     L_546D                  ; 5EA8   0004 0154 006D

L_5EAB:
        MVI     .BTAB.00,R3                     ; 5EAB   0283 0200
        SDBD                                    ; 5EAD   0001
        ANDI    #$3600, R3                      ; 5EAE   03BB 0000 0036
        MVI     G_032C, R0                      ; 5EB1   0280 032C
        XORI    #$0002, R3                      ; 5EB3   03FB 0002
        TSTR    R0                              ; 5EB5   0080
        BEQ     L_5EC0                          ; 5EB6   0204 0008

        JSR     R5,     L_5ED0                  ; 5EB8   0004 015C 02D0

        MVII    #$0201, R4                      ; 5EBB   02BC 0201

        JSR     R5,     X_PRNUM_RGT             ; 5EBD   0004 0118 00C5

L_5EC0:
        MVI     G_034C, R0                      ; 5EC0   0280 034C
        TSTR    R0                              ; 5EC2   0080
        BEQ     L_5ECF                          ; 5EC3   0204 000A

        MVII    #$0210, R4                      ; 5EC5   02BC 0210

        JSR     R5,     L_5ED0                  ; 5EC7   0004 015C 02D0

        XORI    #$0005, R3                      ; 5ECA   03FB 0005

        JSR     R5,     X_PRNUM_RGT             ; 5ECC   0004 0118 00C5

L_5ECF:
        PULR    R7                              ; 5ECF   02B7

L_5ED0:
        MVII    #$0003, R1                      ; 5ED0   02B9 0003
        CMPI    #$0064, R0                      ; 5ED2   0378 0064
        BGE     L_5EDE                          ; 5ED4   020D 0008

        DECR    R1                              ; 5ED6   0011
        INCR    R4                              ; 5ED7   000C
        CMPI    #$000A, R0                      ; 5ED8   0378 000A
        BGE     L_5EDE                          ; 5EDA   020D 0002

        DECR    R1                              ; 5EDC   0011
        INCR    R4                              ; 5EDD   000C
L_5EDE:
        MOVR    R5,     R7                      ; 5EDE   00AF

        PSHR    R5                              ; 5EDF   0275
        DECR    R0                              ; 5EE0   0010
        BMI     L_5F33                          ; 5EE1   020B 0050

        MVO     R1,     G_0188                  ; 5EE3   0241 0188

        JSR     R5,     L_5B5E                  ; 5EE5   0004 0158 035E
        DECLE   $0008,  $0000                   ; 5EE8   0008 0000

        MVI@    R2,     R0                      ; 5EEA   0290
        CMPI    #$0002, R0                      ; 5EEB   0378 0002
        BNEQ    L_5F33                          ; 5EED   020C 0044

        DECR    R2                              ; 5EEF   0012
        MVI@    R2,     R0                      ; 5EF0   0290
        TSTR    R0                              ; 5EF1   0080
        BNEQ    L_5F33                          ; 5EF2   020C 003F

        MOVR    R1,     R0                      ; 5EF4   0088
        MOVR    R3,     R1                      ; 5EF5   0099
        ADDI    #$0006, R3                      ; 5EF6   02FB 0006
        MVI@    R3,     R2                      ; 5EF8   029A
        TSTR    R2                              ; 5EF9   0092
        BNEQ    L_5F33                          ; 5EFA   020C 0037

L_5EFC:
        SLL     R0,     2                       ; 5EFC   004C
        ADDI    #$0005, R1                      ; 5EFD   02F9 0005
        MVII    #$03F1, R2                      ; 5EFF   02BA 03F1
        MVO@    R2,     R1                      ; 5F01   024A
        MVI     G_0111, R2                      ; 5F02   0282 0111
        SLR     R2,     2                       ; 5F04   0066
        CMPR    R2,     R0                      ; 5F05   0150
        BNEQ    L_5F0E                          ; 5F06   020C 0006

        MVII    #$0042, R2                      ; 5F08   02BA 0042
        MVO     R2,     G_0113                  ; 5F0A   0242 0113
        B       L_5F24                          ; 5F0C   0200 0016

L_5F0E:
        MVI     .ISRVEC.1,R2                    ; 5F0E   0282 0101
        CMPI    #$0050, R2                      ; 5F10   037A 0050
        BMI     L_5F18                          ; 5F12   020B 0004

        CMPI    #$0060, R2                      ; 5F14   037A 0060
        BMI     L_5F0E                          ; 5F16   022B 0009

L_5F18:
        SLL     R0,     1                       ; 5F18   0048
        DIS                                     ; 5F19   0003
        MVO     R0,     G_0189                  ; 5F1A   0240 0189
        SDBD                                    ; 5F1C   0001
        MVII    #$5F3F, R0                      ; 5F1D   02B8 003F 005F

        JSR     R5,     L_5E3A                  ; 5F20   0004 015C 023A

        EIS                                     ; 5F23   0002
L_5F24:
        INCR    R1                              ; 5F24   0009
        MVII    #$0007, R2                      ; 5F25   02BA 0007
        MVO@    R2,     R1                      ; 5F27   024A
        SUBI    #$0006, R1                      ; 5F28   0339 0006
        MVI@    R1,     R0                      ; 5F2A   0288
        SDBD                                    ; 5F2B   0001
        XORI    #$1000, R0                      ; 5F2C   03F8 0000 0010
        MVO@    R0,     R1                      ; 5F2F   0248

        JSR     R5,     L_5E53                  ; 5F30   0004 015C 0253

L_5F33:
        PULR    R7                              ; 5F33   02B7

        PSHR    R5                              ; 5F34   0275
        MVII    #$0010, R2                      ; 5F35   02BA 0010
        SWAP    R2,     1                       ; 5F37   0042
        XOR@    R1,     R2                      ; 5F38   03CA
        MVO@    R2,     R1                      ; 5F39   024A
        ADDI    #$0005, R1                      ; 5F3A   02F9 0005
        CLRR    R0                              ; 5F3C   01C0
        MVO@    R0,     R1                      ; 5F3D   0248
        PULR    R7                              ; 5F3E   02B7

        PSHR    R5                              ; 5F3F   0275
        SDBD                                    ; 5F40   0001
        MVII    #$3990, R1                      ; 5F41   02B9 0090 0039
        ADD     G_0189, R1                      ; 5F44   02C1 0189
        MVII    #$0008, R0                      ; 5F46   02B8 0008
        SDBD                                    ; 5F48   0001
        MVII    #$586E, R4                      ; 5F49   02BC 006E 0058

        JSR     R5,     .EXEC.730               ; 5F4C   0004 0114 0330

        PULR    R5                              ; 5F4F   02B5
        J       L_5E49                          ; 5F50   0004 035C 0249

L_5F53:
        MVII    #$0200, R4                      ; 5F53   02BC 0200
L_5F55:
        MVI@    R5,     R0                      ; 5F55   02A8
        SARC    R0,     1                       ; 5F56   0078
        GSWD    R1                              ; 5F57   0031
        PSHR    R4                              ; 5F58   0274
        MOVR    R0,     R4                      ; 5F59   0084
        ANDI    #$0007, R4                      ; 5F5A   03BC 0007
        XORR    R4,     R0                      ; 5F5C   01E0
        ADDR    R4,     R4                      ; 5F5D   00E4
        ADDR    R2,     R4                      ; 5F5E   00D4
        SDBD                                    ; 5F5F   0001
        XOR@    R4,     R0                      ; 5F60   03E0
        PULR    R4                              ; 5F61   02B4
        RSWD    R1                              ; 5F62   0039
        BC      L_5F6B                          ; 5F63   0201 0006

        MVO@    R0,     R4                      ; 5F65   0260
L_5F66:
        CMPI    #$02F0, R4                      ; 5F66   037C 02F0
        BNEQ    L_5F55                          ; 5F68   022C 0014
        MOVR    R5,     R7                      ; 5F6A   00AF

L_5F6B:
        MOVR    R0,     R1                      ; 5F6B   0081
        ANDI    #$00F8, R1                      ; 5F6C   03B9 00F8
        XORR    R1,     R0                      ; 5F6E   01C8
        SLR     R1,     2                       ; 5F6F   0065
        SLR     R1,     1                       ; 5F70   0061
        SDBD                                    ; 5F71   0001
        XORI    #$0800, R0                      ; 5F72   03F8 0000 0008
L_5F75:
        MVO@    R0,     R4                      ; 5F75   0260
        DECR    R1                              ; 5F76   0011
        BNEQ    L_5F75                          ; 5F77   022C 0003
        B       L_5F66                          ; 5F79   0220 0014

        JSRD    R4,     .EXEC.807               ; 5F7B   0004 001A 0007
        DECLE   $001A,  $0003,  $001A,  $0004   ; 5F7E   001A 0003 001A 0004
        DECLE   $000A,  $0005,  $000A,  $0004   ; 5F82   000A 0005 000A 0004
        DECLE   $002A,  $0004,  $0028,  $0005   ; 5F86   002A 0004 0028 0005
        DECLE   $0008,  $0000,  $0008,  $0003   ; 5F8A   0008 0000 0008 0003
        DECLE   $0008,  $0005,  $000A,  $0004   ; 5F8E   0008 0005 000A 0004
        DECLE   $000A,  $0005,  $0028,  $0005   ; 5F92   000A 0005 0028 0005

        ADCR    R2                              ; 5F96   002A
        PSHR    R5                              ; 5F97   0275
        MVO     R1,     G_0188                  ; 5F98   0241 0188
        SLL     R1,     2                       ; 5F9A   004D
        ADDI    #$0002, R1                      ; 5F9B   02F9 0002
        PSHR    R0                              ; 5F9D   0270
        MOVR    R1,     R0                      ; 5F9E   0088

        JSR     R5,     .EXEC.76C               ; 5F9F   0004 0114 036C

        PULR    R0                              ; 5FA2   02B0
        ADDI    #$0006, R1                      ; 5FA3   02F9 0006
        MVII    #$0190, R5                      ; 5FA5   02BD 0190
        MVO@    R5,     R1                      ; 5FA7   024D

        JSR     R5,     L_5B5E                  ; 5FA8   0004 0158 035E
        DECLE   $0008,  $0000                   ; 5FAB   0008 0000

        MVI@    R2,     R5                      ; 5FAD   0295
        CMPI    #$0001, R5                      ; 5FAE   037D 0001
        BNEQ    L_5FC1                          ; 5FB0   020C 000F

        TSTR    R0                              ; 5FB2   0080
        BMI     L_5FBF                          ; 5FB3   020B 000A

        SUBI    #$0003, R2                      ; 5FB5   033A 0003
        MVI@    R2,     R5                      ; 5FB7   0295
        CMPI    #$0001, R5                      ; 5FB8   037D 0001
        BNEQ    L_5FBF                          ; 5FBA   020C 0003

        JSR     R5,     L_55B0                  ; 5FBC   0004 0154 01B0

L_5FBF:
        B       L_5FFF                          ; 5FBF   0200 003E

L_5FC1:
        JSR     R5,     L_5B5E                  ; 5FC1   0004 0158 035E
        DECLE   $0005,  $0000                   ; 5FC4   0005 0000

        TSTR    R0                              ; 5FC6   0080
        BMI     L_5FE5                          ; 5FC7   020B 001C

        MVI@    R2,     R1                      ; 5FC9   0291
        CMPI    #$0001, R1                      ; 5FCA   0379 0001
        BNEQ    L_5FE3                          ; 5FCC   020C 0015

        MVII    #$0002, R1                      ; 5FCE   02B9 0002
        MVO@    R1,     R2                      ; 5FD0   0251
        SUBI    #$0004, R2                      ; 5FD1   033A 0004
        CMPI    #$0008, R0                      ; 5FD3   0378 0008
        BLT     L_5FDA                          ; 5FD5   0205 0003

        NEGR    R0                              ; 5FD7   0020
        ADDI    #$000F, R0                      ; 5FD8   02F8 000F
L_5FDA:
        MVO@    R0,     R2                      ; 5FDA   0250
        INCR    R2                              ; 5FDB   000A
        MVII    #$0008, R1                      ; 5FDC   02B9 0008
        MVO@    R1,     R2                      ; 5FDE   0251
        ADDI    #$0004, R2                      ; 5FDF   02FA 0004
        CLRR    R1                              ; 5FE1   01C9
        MVO@    R1,     R2                      ; 5FE2   0251
L_5FE3:
        B       L_5FFF                          ; 5FE3   0200 001A

L_5FE5:
        MVII    #$0002, R0                      ; 5FE5   02B8 0002

        JSR     R5,     L_5BD7                  ; 5FE7   0004 0158 03D7

        MVII    #$011F, R1                      ; 5FEA   02B9 011F
        ADD     G_0188, R1                      ; 5FEC   02C1 0188
        MVI@    R1,     R1                      ; 5FEE   0289
        ANDI    #$0040, R1                      ; 5FEF   03B9 0040
        BEQ     L_5FFF                          ; 5FF1   0204 000C

        JSR     R5,     L_5B5E                  ; 5FF3   0004 0158 035E
        DECLE   $0006,  $0000                   ; 5FF6   0006 0000

        MVI@    R2,     R0                      ; 5FF8   0290
        TSTR    R0                              ; 5FF9   0080
        BNEQ    L_5FFF                          ; 5FFA   020C 0003

        DECR    R2                              ; 5FFC   0012
        CLRR    R1                              ; 5FFD   01C9
        MVO@    R1,     R2                      ; 5FFE   0251
L_5FFF:
        PULR    R7                              ; 5FFF   02B7

;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5171       $59AE   $59CF   $5DC1  
;;  $5207       $5207  
;;  $5214       $5214  
;;  $5221       $5221  
;;  $522E       $522E  
;;  $5245       $517D  
;;  $5246       $52AE  
;;  $5285       <entry>
;;  $5294       <entry>
;;  $5296       $5294  
;;  $529A       <entry>
;;  $52AE       $52A0  
;;  $52B2       $5E97  
;;  $52C8       $5C24  
;;  $52D8       $52D6  
;;  $52DC       $52AA  
;;  $52EA       $5412  
;;  $52FC       $5D90   $5D97  
;;  $5319       $5313  
;;  $531C       $5317  
;;  $5339       $5328  
;;  $5358       $5346   $5350  
;;  $535E       $534C  
;;  $5362       $5356  
;;  $5364       $5360  
;;  $5366       $535C  
;;  $536F       $5368  
;;  $53B9       $539D   $53A1   $53A5   $53A9   $53B5  
;;  $53C0       $5337  
;;  $53C2       $5323  
;;  $53D3       $53D1  
;;  $53D6       $53CC  
;;  $53F1       $53DF  
;;  $53F5       $53EF  
;;  $53F7       $53C0   $53CA  
;;  $5400       $5568  
;;  $5412       $5400  
;;  $5428       $5422  
;;  $542A       $5426  
;;  $5433       $5304   $536D   $5376   $53BE   $53FE  
;;  $544D       $544B  
;;  $5457       $5455  
;;  $546D       $5A09   $5A0E   $5EA8  
;;  $5492       $5495  
;;  $54A2       $549C  
;;  $54A3       $54A1  
;;  $54B3       $54AE  
;;  $54B4       $5472  
;;  $54BD       $54C0  
;;  $54E0       $54DB  
;;  $54ED       $547B  
;;  $5524       $5519  
;;  $5528       $5516   $5522  
;;  $5531       $5D9A  
;;  $5540       $553A  
;;  $5549       $5544  
;;  $5553       $554B  
;;  $5555       $554E  
;;  $5572       <entry>
;;  $557D       $5574   $5579  
;;  $5588       $5584  
;;  $55A0       $5590  
;;  $55B0       $5040   $5FBC  
;;  $55C4       $55BE  
;;  $55C6       $55C2  
;;  $55FC       $55EB  
;;  $5604       $55FD   $5602  
;;  $560B       $55F5   $55FA   $5606  
;;  $56BE       $56BC  
;;  $574D       $574B  
;;  $5751       $574F  
;;  $5769       $5769  
;;  $583D       $583B  
;;  $5991       <entry>
;;  $59C7       $5999  
;;  $59F1       $59C5  
;;  $5A38       $5992  
;;  $5A51       $52F1   $53EB  
;;  $5A6B       $5296  
;;  $5AD8       $5A85  
;;  $5AF2       $542A   $5D1E  
;;  $5B06       $5AFF  
;;  $5B09       $5B04  
;;  $5B34       $5B02   $5B07  
;;  $5B3F       $5430   $5BB0   $5BBA  
;;  $5B55       $5B4E  
;;  $5B5E       $52EB   $52FD   $5306   $532A   $5339   $536F   $5378   $53C2  
;;  $5B5E       $53D8   $53F7   $5415   $54A5   $55B1   $55E4   $5AF7   $5B42  
;;  $5B5E       $5B76   $5B80   $5BA3   $5C12   $5C27   $5C43   $5C92   $5CB2  
;;  $5B5E       $5CD0   $5D04   $5D3F   $5D7C   $5E77   $5EE5   $5FA8   $5FC1  
;;  $5B5E       $5FF3  
;;  $5B6D       $5B67  
;;  $5B75       $536A   $54B0   $55F7   $5D77  
;;  $5B9D       $5B8A  
;;  $5BA2       $5B7D  
;;  $5BD5       $5BD3  
;;  $5BD6       $5BC1  
;;  $5BD7       $52A7   $5BB5   $5C21   $5C36   $5C40   $5C69   $5C7B   $5C85  
;;  $5BD7       $5C8F   $5CA5   $5CAF   $5CCD   $5D3C   $5E9C   $5FE7  
;;  $5BDB       $5BD8  
;;  $5BDD       $5BE3  
;;  $5BE5       $5BDF  
;;  $5BF0       $5D8A  
;;  $5BF2       $5C0E  
;;  $5C08       $5BF8   $5BFD  
;;  $5C11       $53BB  
;;  $5CF7       $5CE7  
;;  $5D04       $5CF5  
;;  $5D1B       $5D13  
;;  $5D1E       $5D11   $5D19  
;;  $5D60       $5D4B  
;;  $5D64       $5D4D   $5D58   $5D5E  
;;  $5D7A       $5D36  
;;  $5D7B       $5C1C   $5C3B   $5C6E   $5C80   $5C8A   $5CAA  
;;  $5D89       <entry>
;;  $5DAA       <entry>
;;  $5DCB       $5DC6  
;;  $5DD7       $5DDC  
;;  $5DE3       <entry>
;;  $5DF3       $5DF7  
;;  $5E0D       $5E01  
;;  $5E12       $5DFF  
;;  $5E1E       $5DF1   $5E0B   $5E10  
;;  $5E1F       $5DC8   $5E0D  
;;  $5E3A       $5486   $599E   $5AD1   $5DE7   $5F20  
;;  $5E49       $5462   $598E   $5AEF   $5DE0   $5F50  
;;  $5E53       $5F30  
;;  $5E5C       $5E5A  
;;  $5E65       $5E63  
;;  $5E83       $5E74  
;;  $5EA8       $5EA4  
;;  $5EAB       $5DCB  
;;  $5EC0       $5EB6  
;;  $5ECF       $5EC3  
;;  $5ED0       $5EB8   $5EC7  
;;  $5EDE       $5ED4   $5EDA  
;;  $5EFC       $5E80  
;;  $5F0E       $5F06   $5F16  
;;  $5F18       $5F12  
;;  $5F24       $5F0C  
;;  $5F33       $5EE1   $5EED   $5EF2   $5EFA  
;;  $5F53       $517F  
;;  $5F55       $5F68  
;;  $5F66       $5F79  
;;  $5F6B       $5F63  
;;  $5F75       $5F77  
;;  $5FBF       $5FB3   $5FBA  
;;  $5FC1       $5FB0  
;;  $5FDA       $5FD5  
;;  $5FE3       $5FCC  
;;  $5FE5       $5FC7  
;;  $5FFF       $5FBF   $5FE3   $5FF1   $5FFA  
;; ======================================================================== ;;
