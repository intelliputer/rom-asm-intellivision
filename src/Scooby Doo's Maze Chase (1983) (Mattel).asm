
        ORG     $5000
.HEADER:
        BIDECLE $683D           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $50A4           ; 5004  Ptr: Start of game
        BIDECLE $61AB           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $511A           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5034           ; 500A  Ptr: Date/Title
        DECLE   $0380           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0100,  $000B   ; 500F  Color Stack init (0, 1)
        DECLE   $0040,  $000B   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $00FB,  $0054,  $0001,  $0000; 5020  Timer dispatch/interval
        DECLE   $0066,  $005A,  $0007,  $0000; 5024  Timer dispatch/interval
        DECLE   $00DA,  $0059,  $000A,  $0000; 5028  Timer dispatch/interval
        DECLE   $0079,  $006D,  $00C8,  $0000; 502C  Timer dispatch/interval
        BIDECLE $0000           ; 5030  End of timer table

        DECLE   $0000,  $0000                   ; 5032   0000 0000
.TITLE:
        DECLE   $0052                           ; 5034  Cartridge year
        DECLE   $0000                           ; 5035  

.TITLECODE:
        MVI     .BTAB.25,R0                     ; 5036   0280 0225
        XORI    #$0007, R0                      ; 5038   03F8 0007
        MVO     R0,     .BTAB.25                ; 503A   0240 0225
        MVII    #$02C8, R4                      ; 503C   02BC 02C8
        MVII    #$0007, R3                      ; 503E   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 5040   0004 0118 007B
        STRING  "     1983 Mattel    "          ; 5043  
        STRING  "  1983 Hanna-Barbera"          ; 5057  
        DECLE   $0000                           ; 506B   0000

        SDBD                                    ; 506C   0001
        MVII    #$090F, R0                      ; 506D   02B8 000F 0009
        MVO     R0,     .BTAB.CC                ; 5070   0240 02CC
        MVO     R0,     .BTAB.DD                ; 5072   0240 02DD
        MVII    #$023D, R1                      ; 5074   02B9 023D
L_5076:
        MVI@    R1,     R3                      ; 5076   028B
        XORI    #$0006, R3                      ; 5077   03FB 0006
        MVO@    R3,     R1                      ; 5079   024B
        INCR    R1                              ; 507A   0009
        CMPI    #$02F0, R1                      ; 507B   0379 02F0
        BNEQ    L_5076                          ; 507D   022C 0008

        MVII    #$027C, R4                      ; 507F   02BC 027C
        MVII    #$0006, R3                      ; 5081   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 5083   0004 0118 007B
        STRING  "Scooby Doo's"                  ; 5086  
        DECLE   $0000                           ; 5092   0000

        MVII    #$0291, R4                      ; 5093   02BC 0291

        JSR     R5,     X_PRINT_R5              ; 5095   0004 0118 007B
        STRING  "Maze Chase"                    ; 5098  
        DECLE   $0000                           ; 50A2   0000

        PULR    R7                              ; 50A3   02B7

.START:
        PSHR    R5                              ; 50A4   0275
        CLRR    R3                              ; 50A5   01DB
        MVII    #$02B6, R4                      ; 50A6   02BC 02B6

        JSR     R5,     X_PRINT_R5              ; 50A8   0004 0118 007B
        STRING  "by Mark Kennedy"               ; 50AB  
        DECLE   $0000                           ; 50BA   0000

        MVII    #$0040, R0                      ; 50BB   02B8 0040
        SDBD                                    ; 50BD   0001
        MVII    #$4100, R4                      ; 50BE   02BC 0000 0041

        JSR     R5,     X_FILL_ZERO             ; 50C1   0004 0114 0338

        MVII    #$0003, R0                      ; 50C4   02B8 0003
        MVO     R0,     G_0103                  ; 50C6   0240 0103
        SDBD                                    ; 50C8   0001
        MVII    #$6DDB, R0                      ; 50C9   02B8 00DB 006D
        MOVR    R0,     R1                      ; 50CC   0081
        SWAP    R1,     1                       ; 50CD   0041
        MVO     R0,     .ISRVEC.0               ; 50CE   0240 0100
        MVO     R1,     .ISRVEC.1               ; 50D0   0241 0101

        JSRE    R5,     L_6F97                  ; 50D2   0004 016D 0397
        DECLE   $02B8,  $0020,  $0240,  $015D   ; 50D5   02B8 0020 0240 015D
        DECLE   $0004                           ; 50D9   0004

        CMP@    R6,     R0                      ; 50DA   0370
        ADDR    R2,     R1                      ; 50DB   00D1
L_50DC:
        PSHR    R5                              ; 50DC   0275
        MVII    #$00F0, R0                      ; 50DD   02B8 00F0
        MVII    #$0200, R4                      ; 50DF   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 50E1   0004 0114 0338
        JSR     R5,     L_51B8                  ; 50E4   0004 0150 01B8
        JSR     R5,     L_62FB                  ; 50E7   0004 0160 02FB
        JSR     R5,     L_5FF1                  ; 50EA   0004 015C 03F1

        MVII    #$0001, R3                      ; 50ED   02BB 0001
        MVII    #$0208, R4                      ; 50EF   02BC 0208
        MVII    #$0005, R0                      ; 50F1   02B8 0005
        MVO     R0,     G_0171                  ; 50F3   0240 0171
        SDBD                                    ; 50F5   0001
        MVII    #$0881, R1                      ; 50F6   02B9 0081 0008

        JSR     R5,     X_FILL_MEM              ; 50F9   0004 0114 0341

        MVII    #$0040, R0                      ; 50FC   02B8 0040
        SDBD                                    ; 50FE   0001
        MVII    #$4100, R4                      ; 50FF   02BC 0000 0041

        JSR     R5,     X_FILL_ZERO             ; 5102   0004 0114 0338

        CLRR    R0                              ; 5105   01C0
        MVO     R0,     G_01CD                  ; 5106   0240 01CD

        JSR     R5,     X_STOP_SFX              ; 5108   0004 011C 02B4

        PULR    R7                              ; 510B   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 510C   0000 0000 0000 0000
        DECLE   $00EB,  $0057,  $00EB,  $0057   ; 5110   00EB 0057 00EB 0057
        DECLE   $00EB,  $0057,  $0010,  $0001   ; 5114   00EB 0057 0010 0001
        DECLE   $00F0,  $00FF                   ; 5118   00F0 00FF
.GRAM_INIT_511A:
        DECLE   $0040           ; 511A  # of GRAM cards to init
        DECLE   $0036           ; 511B  #00   :  CART #1B    ----
        DECLE   $0014           ; 511C  #01   :  CART #0A    ----
        DECLE   $0303,  $0048   ; 511D  #02-02:  GRAM #01-01 XY-R
        DECLE   $0016           ; 511F  #03   :  CART #0B    ----
        DECLE   $0103,  $0040   ; 5120  #04-04:  GRAM #01-01 -Y--
        DECLE   $00A5,  $0070   ; 5122  #05-05:  GROM #12-12 --I-
        DECLE   $0107,  $0040   ; 5124  #06-06:  GRAM #03-03 -Y--
        DECLE   $0001,  $0070   ; 5126  #07-07:  GROM #00-00 ----
        DECLE   $0003,  $0048   ; 5128  #08-08:  GRAM #01-01 ---R
        DECLE   $0207,  $0040   ; 512A  #09-09:  GRAM #03-03 X---
        DECLE   $00A9,  $0070   ; 512C  #0A-0A:  GROM #14-14 --I-
        DECLE   $0019,  $0070   ; 512E  #0B-0B:  GROM #0C-0C ----
        DECLE   $0207,  $0048   ; 5130  #0C-0C:  GRAM #03-03 X--R
        DECLE   $0003,  $0070   ; 5132  #0D-0D:  GROM #01-01 ----
        DECLE   $001F,  $0070   ; 5134  #0E-0E:  GROM #0F-0F ----
        DECLE   $0001,  $0010   ; 5136  #0F-0F:  GROM #00-00 ----
        DECLE   $0001,  $0380   ; 5138  #10-17:  CART #00-07 ----
        DECLE   $0011,  $0080   ; 513A  #18-19:  CART #08-09 ----
        DECLE   $0032           ; 513C  #1A   :  CART #19    ----
        DECLE   $0034           ; 513D  #1B   :  CART #1A    ----
        DECLE   $0038           ; 513E  #1C   :  CART #1C    ----
        DECLE   $003A           ; 513F  #1D   :  CART #1D    ----
        DECLE   $003C           ; 5140  #1E   :  CART #1E    ----
        DECLE   $003E           ; 5141  #1F   :  CART #1F    ----
        DECLE   $0040           ; 5142  #20   :  CART #20    ----
        DECLE   $0042           ; 5143  #21   :  CART #21    ----
        DECLE   $0050           ; 5144  #22   :  CART #28    ----
        DECLE   $0018           ; 5145  #23   :  CART #0C    ----
        DECLE   $001A           ; 5146  #24   :  CART #0D    ----
        DECLE   $001C           ; 5147  #25   :  CART #0E    ----
        DECLE   $001E           ; 5148  #26   :  CART #0F    ----
        DECLE   $0020           ; 5149  #27   :  CART #10    ----
        DECLE   $0022           ; 514A  #28   :  CART #11    ----
        DECLE   $0024           ; 514B  #29   :  CART #12    ----
        DECLE   $0026           ; 514C  #2A   :  CART #13    ----
        DECLE   $0028           ; 514D  #2B   :  CART #14    ----
        DECLE   $002A           ; 514E  #2C   :  CART #15    ----
        DECLE   $002C           ; 514F  #2D   :  CART #16    ----
        DECLE   $002E           ; 5150  #2E   :  CART #17    ----
        DECLE   $0030           ; 5151  #2F   :  CART #18    ----
        DECLE   $0001,  $0380   ; 5152  #30-37:  CART #00-07 ----
        DECLE   $0011,  $0300   ; 5154  #38-3E:  CART #08-0E ----
        DECLE   $0052           ; 5156  #3F   :  CART #29    ----

L_5157:
        PSHR    R5                              ; 5157   0275
        MVO     R1,     G_0175                  ; 5158   0241 0175
        MVO     R2,     G_0176                  ; 515A   0242 0176
        SDBD                                    ; 515C   0001
        MVII    #$5183, R4                      ; 515D   02BC 0083 0051
        CLRR    R3                              ; 5160   01DB
L_5161:
        MVI@    R4,     R0                      ; 5161   02A0
        ADDR    R0,     R1                      ; 5162   00C1
        MVI@    R4,     R0                      ; 5163   02A0
        ADDR    R0,     R2                      ; 5164   00C2
        ANDI    #$001F, R1                      ; 5165   03B9 001F
        ANDI    #$000F, R2                      ; 5167   03BA 000F
        PSHR    R3                              ; 5169   0273
        CLRR    R0                              ; 516A   01C0

        JSR     R5,     L_518B                  ; 516B   0004 0150 018B

        PULR    R3                              ; 516E   02B3
        XORR    R0,     R3                      ; 516F   01C3
        SDBD                                    ; 5170   0001
        CMPI    #$518B, R4                      ; 5171   037C 008B 0051
        BEQ     L_517D                          ; 5174   0204 0007

        MVI     G_0175, R1                      ; 5176   0281 0175
        MVI     G_0176, R2                      ; 5178   0282 0176
        SLL     R3,     1                       ; 517A   004B
        B       L_5161                          ; 517B   0220 001B

L_517D:
        MOVR    R3,     R0                      ; 517D   0098
        MVI     G_0175, R1                      ; 517E   0281 0175
        MVI     G_0176, R2                      ; 5180   0282 0176
        PULR    R7                              ; 5182   02B7

        DECLE   $00FF,  $0000,  $0000,  $00FF   ; 5183   00FF 0000 0000 00FF
        DECLE   $0001,  $0000,  $0000,  $0001   ; 5187   0001 0000 0000 0001
L_518B:
        PSHR    R5                              ; 518B   0275
        PSHR    R1                              ; 518C   0271
        PSHR    R2                              ; 518D   0272
        PSHR    R0                              ; 518E   0270
        MOVR    R1,     R3                      ; 518F   008B
        SLR     R1,     2                       ; 5190   0065
        SLR     R1,     1                       ; 5191   0061
        SLL     R2,     2                       ; 5192   004E
        ADDR    R1,     R2                      ; 5193   00CA
        SDBD                                    ; 5194   0001
        ADDI    #$42A4, R2                      ; 5195   02FA 00A4 0042
        MVI@    R2,     R0                      ; 5198   0290
        ANDI    #$0007, R3                      ; 5199   03BB 0007
        SDBD                                    ; 519B   0001
        ADDI    #$51B0, R3                      ; 519C   02FB 00B0 0051
        MVI@    R3,     R3                      ; 519F   029B
        PULR    R1                              ; 51A0   02B1
        TSTR    R1                              ; 51A1   0089
        BNEQ    L_51AC                          ; 51A2   020C 0008

        ANDR    R3,     R0                      ; 51A4   0198
        BEQ     L_51A9                          ; 51A5   0204 0002

        MVII    #$0001, R0                      ; 51A7   02B8 0001
L_51A9:
        PULR    R2                              ; 51A9   02B2
        PULR    R1                              ; 51AA   02B1
        PULR    R7                              ; 51AB   02B7

L_51AC:
        XORR    R3,     R0                      ; 51AC   01D8
        MVO@    R0,     R2                      ; 51AD   0250
        B       L_51A9                          ; 51AE   0220 0006

        DECLE   $0080,  $0040,  $0020,  $0010   ; 51B0   0080 0040 0020 0010
        DECLE   $0008,  $0004,  $0002,  $0001   ; 51B4   0008 0004 0002 0001
L_51B8:
        PSHR    R5                              ; 51B8   0275
        MVII    #$0001, R3                      ; 51B9   02BB 0001
        MVII    #$0216, R4                      ; 51BB   02BC 0216

        JSR     R5,     X_PRINT_R5              ; 51BD   0004 0118 007B
        STRING  "Select Maze"                   ; 51C0  
        DECLE   $0000                           ; 51CB   0000
L_51CC:
        MVII    #$00FF, R0                      ; 51CC   02B8 00FF
        MVO     R0,     G_0177                  ; 51CE   0240 0177
L_51D0:
        MVII    #$00FF, R0                      ; 51D0   02B8 00FF
        MVO     R0,     G_0175                  ; 51D2   0240 0175

        JSR     R5,     L_5B69                  ; 51D4   0004 0158 0369

        CMPI    #$000C, R0                      ; 51D7   0378 000C
        BGE     L_51D0                          ; 51D9   022D 000A

        CMPI    #$000A, R0                      ; 51DB   0378 000A
        BGE     L_51F7                          ; 51DD   020D 0018

        MVO     R0,     G_0175                  ; 51DF   0240 0175
        ADDI    #$0010, R0                      ; 51E1   02F8 0010
        SLL     R0,     1                       ; 51E3   0048
        SLL     R0,     2                       ; 51E4   004C
        SDBD                                    ; 51E5   0001
        XORI    #$0802, R0                      ; 51E6   03F8 0002 0008
        MVO     R0,     .BTAB.22                ; 51E9   0240 0222
        MVI     G_0175, R2                      ; 51EB   0282 0175
        MVO     R2,     G_0177                  ; 51ED   0242 0177

        JSR     R5,     L_5264                  ; 51EF   0004 0150 0264
        JSR     R5,     L_520E                  ; 51F2   0004 0150 020E

        B       L_51D0                          ; 51F5   0220 0026

L_51F7:
        MVI     G_0177, R1                      ; 51F7   0281 0177
        CMPI    #$00FF, R1                      ; 51F9   0379 00FF
        BEQ     L_51CC                          ; 51FB   0224 0030

        PSHR    R0                              ; 51FD   0270
        MVII    #$0012, R0                      ; 51FE   02B8 0012
        MVII    #$0216, R4                      ; 5200   02BC 0216

        JSR     R5,     X_FILL_ZERO             ; 5202   0004 0114 0338

        PULR    R0                              ; 5205   02B0
        CMPI    #$000B, R0                      ; 5206   0378 000B
        BEQ     L_520D                          ; 5208   0204 0003

        JSR     R5,     L_6C85                  ; 520A   0004 016C 0085

L_520D:
        PULR    R7                              ; 520D   02B7

L_520E:
        PSHR    R5                              ; 520E   0275
        MVII    #$0001, R1                      ; 520F   02B9 0001
        MOVR    R1,     R2                      ; 5211   008A
        MVII    #$022A, R4                      ; 5212   02BC 022A
L_5214:
        PSHR    R4                              ; 5214   0274
        MVO     R4,     G_0173                  ; 5215   0244 0173

        JSR     R5,     L_5157                  ; 5217   0004 0150 0157

        PULR    R4                              ; 521A   02B4
        MVO     R0,     G_0172                  ; 521B   0240 0172
        TSTR    R0                              ; 521D   0080
        BEQ     L_5262                          ; 521E   0204 0042

        SDBD                                    ; 5220   0001
        MVII    #$1805, R3                      ; 5221   02BB 0005 0018
        SLL     R0,     2                       ; 5224   004C
        SLL     R0,     1                       ; 5225   0048
        XORR    R0,     R3                      ; 5226   01C3
        MVO@    R3,     R4                      ; 5227   0263
        PSHR    R1                              ; 5228   0271
        PSHR    R2                              ; 5229   0272
        PSHR    R4                              ; 522A   0274
        MVI     G_0172, R0                      ; 522B   0280 0172
        SLR     R1,     1                       ; 522D   0061
        SLR     R2,     1                       ; 522E   0062
        SLL     R2,     2                       ; 522F   004E
        SLL     R2,     2                       ; 5230   004E
        XORR    R1,     R2                      ; 5231   01CA
        SDBD                                    ; 5232   0001
        MVII    #$5116, R4                      ; 5233   02BC 0016 0051
        SDBD                                    ; 5236   0001
        MVII    #$44E4, R5                      ; 5237   02BD 00E4 0044
        MOVR    R2,     R1                      ; 523A   0091
        SLL     R1,     2                       ; 523B   004D
        ADDR    R1,     R5                      ; 523C   00CD
L_523D:
        MVI@    R4,     R1                      ; 523D   02A1
        ADDR    R2,     R1                      ; 523E   00D1
        ANDI    #$00FF, R1                      ; 523F   03B9 00FF
        RRC     R0,     1                       ; 5241   0070
        BC      L_5246                          ; 5242   0201 0002

        MVII    #$00FF, R1                      ; 5244   02B9 00FF
L_5246:
        MVO@    R1,     R5                      ; 5246   0269
        SDBD                                    ; 5247   0001
        CMPI    #$511A, R4                      ; 5248   037C 001A 0051
        BNEQ    L_523D                          ; 524B   022C 000F

        PULR    R4                              ; 524D   02B4
        PULR    R2                              ; 524E   02B2
        PULR    R1                              ; 524F   02B1
        ADDI    #$0002, R1                      ; 5250   02F9 0002
        CMPI    #$0021, R1                      ; 5252   0379 0021
        BNEQ    L_5214                          ; 5254   022C 0041

        ADDI    #$0004, R4                      ; 5256   02FC 0004
        MVII    #$0001, R1                      ; 5258   02B9 0001
        ADDI    #$0002, R2                      ; 525A   02FA 0002
        CMPI    #$0011, R2                      ; 525C   037A 0011
        BNEQ    L_5214                          ; 525E   022C 004B

        CLRR    R0                              ; 5260   01C0
        PULR    R7                              ; 5261   02B7

L_5262:
        DECR    R0                              ; 5262   0010
        PULR    R7                              ; 5263   02B7

L_5264:
        PSHR    R5                              ; 5264   0275
        SLL     R2,     2                       ; 5265   004E
        SLL     R2,     2                       ; 5266   004E
        SLL     R2,     1                       ; 5267   004A
        SDBD                                    ; 5268   0001
        MVII    #$6498, R4                      ; 5269   02BC 0098 0064
        ADDR    R2,     R4                      ; 526C   00D4
        SDBD                                    ; 526D   0001
        MVII    #$42A4, R1                      ; 526E   02B9 00A4 0042
L_5271:
        MVI@    R4,     R0                      ; 5271   02A0
        MVII    #$0001, R2                      ; 5272   02BA 0001

        JSR     R5,     L_52A0                  ; 5274   0004 0150 02A0

        MVO@    R3,     R1                      ; 5277   024B
        INCR    R1                              ; 5278   0009
        SWAP    R3,     1                       ; 5279   0043
        MVO@    R3,     R1                      ; 527A   024B
        INCR    R1                              ; 527B   0009
        MVI@    R4,     R0                      ; 527C   02A0

        JSR     R5,     L_52A0                  ; 527D   0004 0150 02A0

        MVO@    R3,     R1                      ; 5280   024B
        INCR    R1                              ; 5281   0009
        SWAP    R3,     1                       ; 5282   0043
        MVO@    R3,     R1                      ; 5283   024B
        INCR    R1                              ; 5284   0009
        MVII    #$0002, R2                      ; 5285   02BA 0002
        MVI@    R4,     R0                      ; 5287   02A0

        JSR     R5,     L_52A0                  ; 5288   0004 0150 02A0

        MVO@    R3,     R1                      ; 528B   024B
        INCR    R1                              ; 528C   0009
        SWAP    R3,     1                       ; 528D   0043
        MVO@    R3,     R1                      ; 528E   024B
        INCR    R1                              ; 528F   0009
        MVI@    R4,     R0                      ; 5290   02A0

        JSR     R5,     L_52A0                  ; 5291   0004 0150 02A0

        MVO@    R3,     R1                      ; 5294   024B
        INCR    R1                              ; 5295   0009
        SWAP    R3,     1                       ; 5296   0043
        MVO@    R3,     R1                      ; 5297   024B
        INCR    R1                              ; 5298   0009
        SDBD                                    ; 5299   0001
        CMPI    #$42E4, R1                      ; 529A   0379 00E4 0042
        BNEQ    L_5271                          ; 529D   022C 002D
        PULR    R7                              ; 529F   02B7

L_52A0:
        PSHR    R5                              ; 52A0   0275
        PSHR    R2                              ; 52A1   0272
        CLRR    R3                              ; 52A2   01DB
L_52A3:
        SARC    R0,     1                       ; 52A3   0078
        BNC     L_52A7                          ; 52A4   0209 0001

        XORR    R2,     R3                      ; 52A6   01D3
L_52A7:
        SLL     R2,     2                       ; 52A7   004E
        TSTR    R0                              ; 52A8   0080
        BNEQ    L_52A3                          ; 52A9   022C 0007

        PULR    R2                              ; 52AB   02B2
        SWAP    R3,     1                       ; 52AC   0043
        PULR    R7                              ; 52AD   02B7

        PSHR    R5                              ; 52AE   0275
        MVII    #$0001, R0                      ; 52AF   02B8 0001
        MVO     R0,     G_035B                  ; 52B1   0240 035B
        MVI     G_0179, R0                      ; 52B3   0280 0179
        CMPI    #$00FF, R0                      ; 52B5   0378 00FF
        BEQ     L_53A4                          ; 52B7   0204 00EB

        MVI     G_0357, R1                      ; 52B9   0281 0357
        MVI     G_0358, R2                      ; 52BB   0282 0358
L_52BD:
        SWAP    R1,     1                       ; 52BD   0041
        ANDI    #$0007, R1                      ; 52BE   03B9 0007
        BNEQ    L_5301                          ; 52C0   020C 003F

        SWAP    R2,     1                       ; 52C2   0042
        ANDI    #$0007, R2                      ; 52C3   03BA 0007
        BNEQ    L_5301                          ; 52C5   020C 003A

        MVI     G_017D, R1                      ; 52C7   0281 017D
        MVI     G_017E, R2                      ; 52C9   0282 017E
        SDBD                                    ; 52CB   0001
        MVII    #$FFF0, R0                      ; 52CC   02B8 00F0 00FF
        ADDR    R0,     R1                      ; 52CF   00C1
        ADDR    R0,     R2                      ; 52D0   00C2
        SLR     R1,     2                       ; 52D1   0065
        DECR    R1                              ; 52D2   0011
        SLR     R2,     2                       ; 52D3   0066
        DECR    R2                              ; 52D4   0012

        JSR     R5,     L_5157                  ; 52D5   0004 0150 0157

        MVI     G_0178, R1                      ; 52D8   0281 0178
        ANDR    R0,     R1                      ; 52DA   0181
        BEQ     L_5399                          ; 52DB   0204 00BC

        MVO     R1,     G_0179                  ; 52DD   0241 0179
L_52DF:
        MVO     R1,     G_017A                  ; 52DF   0241 017A
        CLRR    R2                              ; 52E1   01D2
        CLRR    R3                              ; 52E2   01DB
        CMPI    #$0001, R1                      ; 52E3   0379 0001
        BNEQ    L_52EA                          ; 52E5   020C 0003

        INCR    R3                              ; 52E7   000B
        B       L_52F9                          ; 52E8   0200 000F

L_52EA:
        CMPI    #$0002, R1                      ; 52EA   0379 0002
        BNEQ    L_52F1                          ; 52EC   020C 0003

        INCR    R2                              ; 52EE   000A
        B       L_52F9                          ; 52EF   0200 0008

L_52F1:
        CMPI    #$0004, R1                      ; 52F1   0379 0004
        BNEQ    L_52F8                          ; 52F3   020C 0003

        DECR    R3                              ; 52F5   0013
        B       L_52F9                          ; 52F6   0200 0001

L_52F8:
        DECR    R2                              ; 52F8   0012
L_52F9:
        MVO     R2,     G_017B                  ; 52F9   0242 017B
        MVO     R3,     G_017C                  ; 52FB   0243 017C
        MOVR    R2,     R4                      ; 52FD   0094
        MOVR    R3,     R5                      ; 52FE   009D
        B       L_5305                          ; 52FF   0200 0004

L_5301:
        MVI     G_017B, R4                      ; 5301   0284 017B
        MVI     G_017C, R5                      ; 5303   0285 017C
L_5305:
        MVI     G_0357, R1                      ; 5305   0281 0357
        SWAP    R1,     1                       ; 5307   0041
        ANDI    #$00FF, R1                      ; 5308   03B9 00FF
        ADDR    R4,     R1                      ; 530A   00E1
        ANDI    #$00FF, R1                      ; 530B   03B9 00FF
        MVO     R1,     G_017D                  ; 530D   0241 017D
        MVI     G_0183, R3                      ; 530F   0283 0183
        ADDR    R1,     R3                      ; 5311   00CB
        SWAP    R1,     1                       ; 5312   0041
        MVO     R1,     G_0357                  ; 5313   0241 0357
        MVO     R1,     G_034F                  ; 5315   0241 034F
        MVI     G_0358, R2                      ; 5317   0282 0358
        SWAP    R2,     1                       ; 5319   0042
        ANDI    #$00FF, R2                      ; 531A   03BA 00FF
        ADDR    R5,     R2                      ; 531C   00EA
        ANDI    #$00FF, R2                      ; 531D   03BA 00FF
        MVO     R2,     G_017E                  ; 531F   0242 017E
        ADDR    R2,     R3                      ; 5321   00D3
        MVO     R2,     G_0183                  ; 5322   0242 0183
        SWAP    R2,     1                       ; 5324   0042
        MVO     R2,     G_0358                  ; 5325   0242 0358
        MVO     R2,     G_0350                  ; 5327   0242 0350
L_5329:
        CLRR    R0                              ; 5329   01C0
        MVI     G_0179, R1                      ; 532A   0281 0179
        CMPI    #$00FF, R1                      ; 532C   0379 00FF
        BEQ     L_5358                          ; 532E   0204 0028

        CMPI    #$0001, R1                      ; 5330   0379 0001
        BEQ     L_5366                          ; 5332   0204 0032

        CMPI    #$0004, R1                      ; 5334   0379 0004
        BEQ     L_5370                          ; 5336   0204 0038

        SDBD                                    ; 5338   0001
        MVII    #$6748, R2                      ; 5339   02BA 0048 0067
        SDBD                                    ; 533C   0001
        MVII    #$6751, R4                      ; 533D   02BC 0051 0067
        MVI     G_034F, R5                      ; 5340   0285 034F
        CMPI    #$0002, R1                      ; 5342   0379 0002
        BEQ     L_5350                          ; 5344   0204 000A

        MVII    #$0200, R0                      ; 5346   02B8 0200
        SDBD                                    ; 5348   0001
        ADDI    #$0800, R5                      ; 5349   02FD 0000 0008
        MVO     R5,     G_034F                  ; 534C   0245 034F
        B       L_5378                          ; 534E   0200 0028

L_5350:
        SDBD                                    ; 5350   0001
        SUBI    #$0800, R5                      ; 5351   033D 0000 0008
        MVO     R5,     G_034F                  ; 5354   0245 034F
        B       L_5378                          ; 5356   0200 0020

L_5358:
        SDBD                                    ; 5358   0001
        MVII    #$6728, R2                      ; 5359   02BA 0028 0067
        SDBD                                    ; 535C   0001
        MVII    #$6731, R4                      ; 535D   02BC 0031 0067
        MVI     G_0357, R5                      ; 5360   0285 0357
        MVO     R5,     G_034F                  ; 5362   0245 034F
        B       L_5378                          ; 5364   0200 0012

L_5366:
        SDBD                                    ; 5366   0001
        MVII    #$6738, R2                      ; 5367   02BA 0038 0067
        SDBD                                    ; 536A   0001
        MVII    #$6741, R4                      ; 536B   02BC 0041 0067
        B       L_5378                          ; 536E   0200 0008

L_5370:
        SDBD                                    ; 5370   0001
        MVII    #$6758, R2                      ; 5371   02BA 0058 0067
        SDBD                                    ; 5374   0001
        MVII    #$6761, R4                      ; 5375   02BC 0061 0067
L_5378:
        MVI     G_0355, R3                      ; 5378   0283 0355
        SDBD                                    ; 537A   0001
        ANDI    #$FDFF, R3                      ; 537B   03BB 00FF 00FD
        XORR    R0,     R3                      ; 537E   01C3
        MVO     R3,     G_0355                  ; 537F   0243 0355
        MVI     G_034D, R3                      ; 5381   0283 034D
        SDBD                                    ; 5383   0001
        ANDI    #$FDFF, R3                      ; 5384   03BB 00FF 00FD
        XORR    R0,     R3                      ; 5387   01C3
        MVO     R3,     G_034D                  ; 5388   0243 034D
        CMP     G_0356, R2                      ; 538A   0342 0356
        BEQ     L_5398                          ; 538C   0204 000A

        MVO     R2,     G_0356                  ; 538E   0242 0356
        MVO     R4,     G_034E                  ; 5390   0244 034E
        MVII    #$03F0, R2                      ; 5392   02BA 03F0
        MVO     R2,     G_035A                  ; 5394   0242 035A
        MVO     R2,     G_0352                  ; 5396   0242 0352
L_5398:
        PULR    R7                              ; 5398   02B7

L_5399:
        MVI     G_0179, R1                      ; 5399   0281 0179
        ANDR    R0,     R1                      ; 539B   0181
        BNEQ    L_52DF                          ; 539C   022C 00BE

        MVII    #$00FF, R1                      ; 539E   02B9 00FF
        MVO     R1,     G_0179                  ; 53A0   0241 0179
        B       L_5329                          ; 53A2   0220 007A

L_53A4:
        MVI     G_0178, R1                      ; 53A4   0281 0178
        TSTR    R1                              ; 53A6   0089
        BEQ     L_5329                          ; 53A7   0224 007F

        MVO     R1,     G_0179                  ; 53A9   0241 0179
        MVI     G_0357, R1                      ; 53AB   0281 0357
        MVI     G_0358, R2                      ; 53AD   0282 0358
        B       L_52BD                          ; 53AF   0220 00F3

L_53B1:
        PSHR    R5                              ; 53B1   0275
        TSTR    R0                              ; 53B2   0080
        BMI     L_53D5                          ; 53B3   020B 0020

        MVI     G_0179, R1                      ; 53B5   0281 0179
        MOVR    R1,     R2                      ; 53B7   008A
        XORR    R0,     R2                      ; 53B8   01C2
        CMPI    #$000A, R2                      ; 53B9   037A 000A
        BEQ     L_53C5                          ; 53BB   0204 0008

        CMPI    #$0005, R2                      ; 53BD   037A 0005
        BEQ     L_53C5                          ; 53BF   0204 0004

        MVO     R0,     G_0178                  ; 53C1   0240 0178
        B       L_53D4                          ; 53C3   0200 000F

L_53C5:
        MVO     R0,     G_0179                  ; 53C5   0240 0179
        MVI     G_017B, R0                      ; 53C7   0280 017B
        NEGR    R0                              ; 53C9   0020
        MVO     R0,     G_017B                  ; 53CA   0240 017B
        MVI     G_017C, R0                      ; 53CC   0280 017C
        NEGR    R0                              ; 53CE   0020
        MVO     R0,     G_017C                  ; 53CF   0240 017C
        CLRR    R0                              ; 53D1   01C0
        MVO     R0,     G_0178                  ; 53D2   0240 0178
L_53D4:
        PULR    R7                              ; 53D4   02B7

L_53D5:
        CLRR    R0                              ; 53D5   01C0
        MVO     R0,     G_0178                  ; 53D6   0240 0178
        B       L_53D4                          ; 53D8   0220 0005

        PSHR    R5                              ; 53DA   0275
        PSHR    R1                              ; 53DB   0271
        ADDI    #$0005, R1                      ; 53DC   02F9 0005
        MVI@    R1,     R2                      ; 53DE   028A
        TSTR    R2                              ; 53DF   0092
        BNEQ    L_53E5                          ; 53E0   020C 0003

        MVII    #$0370, R2                      ; 53E2   02BA 0370
        MVO@    R2,     R1                      ; 53E4   024A
L_53E5:
        PULR    R1                              ; 53E5   02B1
        DECR    R0                              ; 53E6   0010
        DECR    R0                              ; 53E7   0010
        MVII    #$0184, R3                      ; 53E8   02BB 0184
        ADDR    R0,     R3                      ; 53EA   00C3
        MVI@    R3,     R0                      ; 53EB   0298
        ADD     G_0187, R0                      ; 53EC   02C0 0187
        MVO     R0,     G_0187                  ; 53EE   0240 0187
        MVO@    R0,     R3                      ; 53F0   0258
        MOVR    R1,     R3                      ; 53F1   008B
        PSHR    R3                              ; 53F2   0273
        ADDI    #$0006, R1                      ; 53F3   02F9 0006
        MVII    #$0002, R0                      ; 53F5   02B8 0002
        MVO@    R0,     R1                      ; 53F7   0248
        ADDI    #$0001, R1                      ; 53F8   02F9 0001
        MVI@    R1,     R4                      ; 53FA   028C
        MOVR    R4,     R2                      ; 53FB   00A2
        ANDI    #$000F, R2                      ; 53FC   03BA 000F
        CLRR    R0                              ; 53FE   01C0
        CLRR    R1                              ; 53FF   01C9
        TSTR    R2                              ; 5400   0092
        BEQ     L_5422                          ; 5401   0204 001F

        CMPI    #$0001, R2                      ; 5403   037A 0001
        BNEQ    L_540A                          ; 5405   020C 0003

        INCR    R1                              ; 5407   0009
        B       L_5419                          ; 5408   0200 000F

L_540A:
        CMPI    #$0002, R2                      ; 540A   037A 0002
        BNEQ    L_5411                          ; 540C   020C 0003

        INCR    R0                              ; 540E   0008
        B       L_5419                          ; 540F   0200 0008

L_5411:
        CMPI    #$0004, R2                      ; 5411   037A 0004
        BNEQ    L_5418                          ; 5413   020C 0003

        DECR    R1                              ; 5415   0011
        B       L_5419                          ; 5416   0200 0001

L_5418:
        DECR    R0                              ; 5418   0010
L_5419:
        TSTR    R4                              ; 5419   00A4
        BMI     L_541E                          ; 541A   020B 0002

        SLL     R0,     1                       ; 541C   0048
        SLL     R1,     1                       ; 541D   0049
L_541E:
        SDBD                                    ; 541E   0001
        XORI    #$8000, R4                      ; 541F   03FC 0000 0080
L_5422:
        MOVR    R3,     R5                      ; 5422   009D
        ADDI    #$0002, R5                      ; 5423   02FD 0002
        MVI@    R5,     R2                      ; 5425   02AA
        SWAP    R2,     1                       ; 5426   0042
        ADDR    R0,     R2                      ; 5427   00C2
        ANDI    #$00FF, R2                      ; 5428   03BA 00FF
        MVO     R2,     G_0180                  ; 542A   0242 0180
        SWAP    R2,     1                       ; 542C   0042
        DECR    R5                              ; 542D   0015
        MVO@    R2,     R5                      ; 542E   026A
        MVI@    R5,     R2                      ; 542F   02AA
        SWAP    R2,     1                       ; 5430   0042
        ADDR    R1,     R2                      ; 5431   00CA
        ANDI    #$00FF, R2                      ; 5432   03BA 00FF
        MVO     R2,     G_0181                  ; 5434   0242 0181
        SWAP    R2,     1                       ; 5436   0042
        DECR    R5                              ; 5437   0015
        MVO@    R2,     R5                      ; 5438   026A
        MVI     G_0180, R0                      ; 5439   0280 0180
        MVI     G_0181, R1                      ; 543B   0281 0181
        ANDI    #$0007, R0                      ; 543D   03B8 0007
        BNEQ    L_5485                          ; 543F   020C 0044

        ANDI    #$0007, R1                      ; 5441   03B9 0007
        BNEQ    L_5485                          ; 5443   020C 0040

        MVI     G_0180, R1                      ; 5445   0281 0180
        MVI     G_0181, R2                      ; 5447   0282 0181
        PSHR    R4                              ; 5449   0274
        SDBD                                    ; 544A   0001
        MVII    #$FFF0, R0                      ; 544B   02B8 00F0 00FF
        ADDR    R0,     R1                      ; 544E   00C1
        ADDR    R0,     R2                      ; 544F   00C2
        SLR     R1,     2                       ; 5450   0065
        DECR    R1                              ; 5451   0011
        SLR     R2,     2                       ; 5452   0066
        DECR    R2                              ; 5453   0012

        JSR     R5,     L_54AB                  ; 5454   0004 0154 00AB

        PULR    R4                              ; 5457   02B4
L_5458:
        MVI     G_0183, R2                      ; 5458   0282 0183
        ADD     G_0187, R2                      ; 545A   02C2 0187
        PSHR    R4                              ; 545C   0274
        ANDI    #$0003, R2                      ; 545D   03BA 0003
        SLL     R2,     2                       ; 545F   004E
        SDBD                                    ; 5460   0001
        MVII    #$549B, R4                      ; 5461   02BC 009B 0054
        ADDR    R2,     R4                      ; 5464   00D4
        MVII    #$0004, R1                      ; 5465   02B9 0004
L_5467:
        MVI@    R4,     R2                      ; 5467   02A2
        CMP     G_017F, R2                      ; 5468   0342 017F
        BEQ     L_546F                          ; 546A   0204 0003

        ANDR    R0,     R2                      ; 546C   0182
        BNEQ    L_5474                          ; 546D   020C 0005

L_546F:
        DECR    R1                              ; 546F   0011
        BNEQ    L_5467                          ; 5470   022C 000A

        MVI     G_017F, R2                      ; 5472   0282 017F
L_5474:
        PULR    R4                              ; 5474   02B4
        MVO     R2,     G_017F                  ; 5475   0242 017F
        MOVR    R4,     R3                      ; 5477   00A3
        ANDI    #$000F, R3                      ; 5478   03BB 000F
        XORR    R2,     R3                      ; 547A   01D3
        CMPI    #$0005, R3                      ; 547B   037B 0005
        BEQ     L_5493                          ; 547D   0204 0014

        CMPI    #$000A, R3                      ; 547F   037B 000A
        BEQ     L_5493                          ; 5481   0204 0010

L_5483:
        CLRR    R4                              ; 5483   01E4
        XORR    R2,     R4                      ; 5484   01D4
L_5485:
        PULR    R3                              ; 5485   02B3
        ADDI    #$0007, R3                      ; 5486   02FB 0007
        MVO@    R4,     R3                      ; 5488   025C
        PULR    R7                              ; 5489   02B7

        MOVR    R4,     R2                      ; 548A   00A2
        ANDI    #$000F, R4                      ; 548B   03BC 000F
        ANDR    R0,     R2                      ; 548D   0182
        BNEQ    L_5485                          ; 548E   022C 000A

        MOVR    R0,     R2                      ; 5490   0082
        B       L_5467                          ; 5491   0220 002B

L_5493:
        MOVR    R2,     R3                      ; 5493   0093
        COMR    R3                              ; 5494   001B
        ANDR    R0,     R3                      ; 5495   0183
        BEQ     L_5483                          ; 5496   0224 0014

        MOVR    R3,     R0                      ; 5498   0098
        B       L_5458                          ; 5499   0220 0042

        DECLE   $0001,  $0008,  $0002,  $0004   ; 549B   0001 0008 0002 0004
        DECLE   $0008,  $0002,  $0001,  $0004   ; 549F   0008 0002 0001 0004
        DECLE   $0004,  $0008,  $0002,  $0001   ; 54A3   0004 0008 0002 0001
        DECLE   $0002,  $0004,  $0008,  $0001   ; 54A7   0002 0004 0008 0001
L_54AB:
        PSHR    R5                              ; 54AB   0275
        SLR     R1,     1                       ; 54AC   0061
        SLR     R2,     1                       ; 54AD   0062
        SLL     R2,     2                       ; 54AE   004E
        SLL     R2,     2                       ; 54AF   004E
        XORR    R1,     R2                      ; 54B0   01CA
        MOVR    R2,     R1                      ; 54B1   0091
        SLL     R1,     2                       ; 54B2   004D
        SDBD                                    ; 54B3   0001
        ADDI    #$44E4, R1                      ; 54B4   02F9 00E4 0044
        MOVR    R1,     R4                      ; 54B7   008C
        MVII    #$0004, R5                      ; 54B8   02BD 0004
        CLRR    R0                              ; 54BA   01C0
        MVO     R0,     G_0188                  ; 54BB   0240 0188
        MVO     R0,     G_0189                  ; 54BD   0240 0189
L_54BF:
        MVI     G_0189, R3                      ; 54BF   0283 0189
        SLR     R3,     1                       ; 54C1   0063
        MVO     R3,     G_0189                  ; 54C2   0243 0189
        SLR     R0,     1                       ; 54C4   0060
        MVI@    R4,     R3                      ; 54C5   02A3
        CMPI    #$00FF, R3                      ; 54C6   037B 00FF
        BEQ     L_54D4                          ; 54C8   0204 000A

        SDBD                                    ; 54CA   0001
        ADDI    #$41A4, R3                      ; 54CB   02FB 00A4 0041
        MVI@    R3,     R3                      ; 54CE   029B
        TSTR    R3                              ; 54CF   009B
        BNEQ    L_54DB                          ; 54D0   020C 0009

        XORI    #$0008, R0                      ; 54D2   03F8 0008
L_54D4:
        DECR    R5                              ; 54D4   0015
        BNEQ    L_54BF                          ; 54D5   022C 0017

        TSTR    R0                              ; 54D7   0080
        BEQ     L_54F8                          ; 54D8   0204 001E
        PULR    R7                              ; 54DA   02B7

L_54DB:
        ANDI    #$00FF, R3                      ; 54DB   03BB 00FF
        CMPI    #$00FF, R3                      ; 54DD   037B 00FF
        BNEQ    L_54E2                          ; 54DF   020C 0001

        CLRR    R3                              ; 54E1   01DB
L_54E2:
        CMP     G_0188, R3                      ; 54E2   0343 0188
        BMI     L_54D4                          ; 54E4   022B 0011
        BEQ     L_54F0                          ; 54E6   0204 0008

        MVO     R3,     G_0188                  ; 54E8   0243 0188
        MVII    #$0008, R3                      ; 54EA   02BB 0008
        MVO     R3,     G_0189                  ; 54EC   0243 0189
        B       L_54D4                          ; 54EE   0220 001B

L_54F0:
        MVI     G_0189, R3                      ; 54F0   0283 0189
        XORI    #$0008, R3                      ; 54F2   03FB 0008
        MVO     R3,     G_0189                  ; 54F4   0243 0189
        B       L_54D4                          ; 54F6   0220 0023

L_54F8:
        MVI     G_0189, R0                      ; 54F8   0280 0189
        PULR    R7                              ; 54FA   02B7

L_54FB:
        PSHR    R5                              ; 54FB   0275
        MVI     G_0171, R0                      ; 54FC   0280 0171
        CMPI    #$0005, R0                      ; 54FE   0378 0005
        BNEQ    L_55A0                          ; 5500   020C 009E

        MVI     G_0357, R0                      ; 5502   0280 0357
        SDBD                                    ; 5504   0001
        MVII    #$0700, R1                      ; 5505   02B9 0000 0007
        ANDR    R1,     R0                      ; 5508   0188
        BNEQ    L_559C                          ; 5509   020C 0091

        MVI     G_0358, R0                      ; 550B   0280 0358
        ANDR    R1,     R0                      ; 550D   0188
        BNEQ    L_559C                          ; 550E   020C 008C

        MVII    #$0080, R0                      ; 5510   02B8 0080
        SDBD                                    ; 5512   0001
        MVII    #$41A4, R4                      ; 5513   02BC 00A4 0041

        JSR     R5,     X_FILL_ZERO             ; 5516   0004 0114 0338

        MVII    #$0032, R1                      ; 5519   02B9 0032
        MVO     R1,     G_018E                  ; 551B   0241 018E
        CLRR    R1                              ; 551D   01C9
        MVO     R1,     G_018D                  ; 551E   0241 018D
        INCR    R1                              ; 5520   0009
        MVO     R1,     G_018C                  ; 5521   0241 018C
        MVO     R1,     G_018B                  ; 5523   0241 018B
        MVII    #$0010, R0                      ; 5525   02B8 0010
        MVI     G_0357, R1                      ; 5527   0281 0357
        SWAP    R1,     1                       ; 5529   0041
        SUBR    R0,     R1                      ; 552A   0101
        SLR     R1,     2                       ; 552B   0065
        SLR     R1,     1                       ; 552C   0061
        MVI     G_0358, R2                      ; 552D   0282 0358
        SWAP    R2,     1                       ; 552F   0042
        SUBR    R0,     R2                      ; 5530   0102
        SLR     R2,     2                       ; 5531   0066
        DECR    R1                              ; 5532   0011
        SLR     R2,     1                       ; 5533   0062
        DECR    R2                              ; 5534   0012
        SLL     R2,     2                       ; 5535   004E
        SLL     R2,     2                       ; 5536   004E
        XORR    R1,     R2                      ; 5537   01CA
        SDBD                                    ; 5538   0001
        MVII    #$4140, R1                      ; 5539   02B9 0040 0041
        MVO@    R2,     R1                      ; 553C   024A
        MOVR    R2,     R1                      ; 553D   0091
        SDBD                                    ; 553E   0001
        ADDI    #$41A4, R1                      ; 553F   02F9 00A4 0041
        MVII    #$00FF, R0                      ; 5542   02B8 00FF
        MVO@    R0,     R1                      ; 5544   0248
        SDBD                                    ; 5545   0001
        MVII    #$4140, R5                      ; 5546   02BD 0040 0041
        SDBD                                    ; 5549   0001
        MVII    #$4140, R1                      ; 554A   02B9 0040 0041
        ADD     G_018E, R1                      ; 554D   02C1 018E
L_554F:
        MVI@    R5,     R2                      ; 554F   02AA
        SLL     R2,     2                       ; 5550   004E
        SDBD                                    ; 5551   0001
        ADDI    #$44E4, R2                      ; 5552   02FA 00E4 0044
        MOVR    R2,     R4                      ; 5555   0094
        MVII    #$0004, R0                      ; 5556   02B8 0004
L_5558:
        MVI@    R4,     R2                      ; 5558   02A2
        CMPI    #$00FF, R2                      ; 5559   037A 00FF
        BEQ     L_556E                          ; 555B   0204 0011

        SDBD                                    ; 555D   0001
        ADDI    #$41A4, R2                      ; 555E   02FA 00A4 0041
        MVI@    R2,     R3                      ; 5561   0293
        TSTR    R3                              ; 5562   009B
        BNEQ    L_556E                          ; 5563   020C 0009

        MVI     G_018B, R3                      ; 5565   0283 018B
        MVO@    R3,     R2                      ; 5567   0253
        SDBD                                    ; 5568   0001
        SUBI    #$41A4, R2                      ; 5569   033A 00A4 0041
        INCR    R1                              ; 556C   0009
        MVO@    R2,     R1                      ; 556D   024A
L_556E:
        DECR    R0                              ; 556E   0010
        BNEQ    L_5558                          ; 556F   022C 0018

        MVI     G_018C, R0                      ; 5571   0280 018C
        DECR    R0                              ; 5573   0010
        BEQ     L_557A                          ; 5574   0204 0004

        MVO     R0,     G_018C                  ; 5576   0240 018C
        B       L_554F                          ; 5578   0220 002A

L_557A:
        MVI     G_018B, R0                      ; 557A   0280 018B
        INCR    R0                              ; 557C   0008
        CMP     G_018A, R0                      ; 557D   0340 018A
        BEQ     L_559C                          ; 557F   0204 001B

        MVO     R0,     G_018B                  ; 5581   0240 018B
        SDBD                                    ; 5583   0001
        MVII    #$4140, R5                      ; 5584   02BD 0040 0041
        SUBR    R5,     R1                      ; 5587   0129
        MVI     G_018E, R0                      ; 5588   0280 018E
        SUBR    R0,     R1                      ; 558A   0101
        MVI     G_018D, R2                      ; 558B   0282 018D
        ADDR    R0,     R5                      ; 558D   00C5
        INCR    R5                              ; 558E   000D
        MVO     R0,     G_018D                  ; 558F   0240 018D
        MVO     R2,     G_018E                  ; 5591   0242 018E
        MVO     R1,     G_018C                  ; 5593   0241 018C
        SDBD                                    ; 5595   0001
        MVII    #$4140, R1                      ; 5596   02B9 0040 0041
        ADDR    R2,     R1                      ; 5599   00D1
        B       L_554F                          ; 559A   0220 004C

L_559C:
        JSR     R5,     L_5E69                  ; 559C   0004 015C 0269

        PULR    R7                              ; 559F   02B7

L_55A0:
        MVII    #$0010, R0                      ; 55A0   02B8 0010
        DECLE   $0240,  $015E,  $0004,  $0174   ; 55A2   0240 015E 0004 0174
        DECLE   $005B,  $0004                   ; 55A6   005B 0004

        CMPR    R7,     R0                      ; 55A8   0178
        XOR@    R4,     R0                      ; 55A9   03E0
        MVI     G_015E, R0                      ; 55AA   0280 015E
        ANDI    #$0010, R0                      ; 55AC   03B8 0010
        BNEQ    L_559C                          ; 55AE   022C 0013

        ADD     G_0171, R0                      ; 55B0   02C0 0171
        BEQ     L_55B8                          ; 55B2   0204 0004

        JSR     R5,     L_5CDA                  ; 55B4   0004 015C 00DA

        PULR    R7                              ; 55B7   02B7

L_55B8:
        JSR     R5,     L_50DC                  ; 55B8   0004 0150 00DC

        PULR    R7                              ; 55BB   02B7

        PSHR    R5                              ; 55BC   0275
L_55BD:
        PSHR    R1                              ; 55BD   0271
        MVI     G_034A, R2                      ; 55BE   0282 034A
        TSTR    R2                              ; 55C0   0092
        BNEQ    L_55D1                          ; 55C1   020C 000E

        MVII    #$0350, R2                      ; 55C3   02BA 0350
        MVO     R2,     G_034A                  ; 55C5   0242 034A
        MVO     R2,     G_032A                  ; 55C7   0242 032A
        MVI     G_0345, R2                      ; 55C9   0282 0345
        SDBD                                    ; 55CB   0001
        XORI    #$0800, R2                      ; 55CC   03FA 0000 0008
        MVO     R2,     G_0345                  ; 55CF   0242 0345
L_55D1:
        PULR    R1                              ; 55D1   02B1
        MVII    #$0184, R4                      ; 55D2   02BC 0184
        MVI@    R4,     R0                      ; 55D4   02A0
        ADD@    R4,     R0                      ; 55D5   02E0
        ADD@    R4,     R0                      ; 55D6   02E0
        ADD     G_0192, R0                      ; 55D7   02C0 0192
        MVO     R0,     G_0192                  ; 55D9   0240 0192
        MVII    #$0001, R0                      ; 55DB   02B8 0001
        MVO     R0,     G_034B                  ; 55DD   0240 034B
        MVI     G_034C, R4                      ; 55DF   0284 034C
        MOVR    R4,     R2                      ; 55E1   00A2
        ANDI    #$000F, R2                      ; 55E2   03BA 000F
        CLRR    R0                              ; 55E4   01C0
        CLRR    R1                              ; 55E5   01C9
        TSTR    R2                              ; 55E6   0092
        BEQ     L_5602                          ; 55E7   0204 0019

        CMPI    #$0001, R2                      ; 55E9   037A 0001
        BNEQ    L_55F0                          ; 55EB   020C 0003

        INCR    R1                              ; 55ED   0009
        B       L_55FF                          ; 55EE   0200 000F

L_55F0:
        CMPI    #$0002, R2                      ; 55F0   037A 0002
        BNEQ    L_55F7                          ; 55F2   020C 0003

        INCR    R0                              ; 55F4   0008
        B       L_55FF                          ; 55F5   0200 0008

L_55F7:
        CMPI    #$0004, R2                      ; 55F7   037A 0004
        BNEQ    L_55FE                          ; 55F9   020C 0003

        DECR    R1                              ; 55FB   0011
        B       L_55FF                          ; 55FC   0200 0001

L_55FE:
        DECR    R0                              ; 55FE   0010

L_55FF:
        JSR     R5,     L_5765                  ; 55FF   0004 0154 0365

L_5602:
        MVI     G_0347, R2                      ; 5602   0282 0347
        SWAP    R2,     1                       ; 5604   0042
        ADDR    R0,     R2                      ; 5605   00C2
        ANDI    #$00FF, R2                      ; 5606   03BA 00FF
        MVO     R2,     G_0190                  ; 5608   0242 0190
        SWAP    R2,     1                       ; 560A   0042
        MVO     R2,     G_0347                  ; 560B   0242 0347
        MVO     R2,     G_0327                  ; 560D   0242 0327
        MVI     G_0348, R2                      ; 560F   0282 0348
        SWAP    R2,     1                       ; 5611   0042
        ADDR    R1,     R2                      ; 5612   00CA
        ANDI    #$00FF, R2                      ; 5613   03BA 00FF
        MVO     R2,     G_0191                  ; 5615   0242 0191
        SWAP    R2,     1                       ; 5617   0042
        MVO     R2,     G_0348                  ; 5618   0242 0348
        MVO     R2,     G_0328                  ; 561A   0242 0328
        MVI     G_0190, R0                      ; 561C   0280 0190
        MVI     G_0191, R1                      ; 561E   0281 0191
        ANDI    #$0007, R0                      ; 5620   03B8 0007
        BNEQ    L_565F                          ; 5622   020C 003B

        ANDI    #$0007, R1                      ; 5624   03B9 0007
        BNEQ    L_565F                          ; 5626   020C 0037

        MVI     G_0190, R1                      ; 5628   0281 0190
        MVI     G_0191, R2                      ; 562A   0282 0191
        PSHR    R4                              ; 562C   0274
        SDBD                                    ; 562D   0001
        MVII    #$FFF0, R0                      ; 562E   02B8 00F0 00FF
        ADDR    R0,     R1                      ; 5631   00C1
        ADDR    R0,     R2                      ; 5632   00C2
        SLR     R1,     2                       ; 5633   0065
        DECR    R1                              ; 5634   0011
        SLR     R2,     2                       ; 5635   0066
        DECR    R2                              ; 5636   0012

        JSR     R5,     L_56CB                  ; 5637   0004 0154 02CB

        PULR    R4                              ; 563A   02B4
L_563B:
        MVI     G_0183, R2                      ; 563B   0282 0183
        ADD     G_0192, R2                      ; 563D   02C2 0192
        PSHR    R4                              ; 563F   0274
        ANDI    #$0003, R2                      ; 5640   03BA 0003
        SLL     R2,     2                       ; 5642   004E
        SDBD                                    ; 5643   0001
        MVII    #$549B, R4                      ; 5644   02BC 009B 0054
        ADDR    R2,     R4                      ; 5647   00D4
        MVII    #$0004, R1                      ; 5648   02B9 0004
L_564A:
        MVI@    R4,     R2                      ; 564A   02A2
        ANDR    R0,     R2                      ; 564B   0182
        BNEQ    L_5651                          ; 564C   020C 0003

        DECR    R1                              ; 564E   0011
        BNEQ    L_564A                          ; 564F   022C 0006

L_5651:
        PULR    R4                              ; 5651   02B4
        MOVR    R4,     R3                      ; 5652   00A3
        ANDI    #$000F, R3                      ; 5653   03BB 000F
        XORR    R2,     R3                      ; 5655   01D3
        CMPI    #$0005, R3                      ; 5656   037B 0005
        BEQ     L_56B7                          ; 5658   0204 005D

        CMPI    #$000A, R3                      ; 565A   037B 000A
        BEQ     L_56B7                          ; 565C   0204 0059

L_565E:
        MOVR    R2,     R4                      ; 565E   0094
L_565F:
        MVO     R4,     G_034C                  ; 565F   0244 034C
        CLRR    R5                              ; 5661   01ED
        CMPI    #$0001, R4                      ; 5662   037C 0001
        BEQ     L_567A                          ; 5664   0204 0014

        CMPI    #$0004, R4                      ; 5666   037C 0004
        BEQ     L_5684                          ; 5668   0204 001A

        SDBD                                    ; 566A   0001
        MVII    #$6783, R0                      ; 566B   02B8 0083 0067
        SDBD                                    ; 566E   0001
        MVII    #$678A, R1                      ; 566F   02B9 008A 0067
        CMPI    #$0002, R4                      ; 5672   037C 0002
        BEQ     L_568C                          ; 5674   0204 0016

        MVII    #$0200, R5                      ; 5676   02BD 0200
        B       L_568C                          ; 5678   0200 0012

L_567A:
        SDBD                                    ; 567A   0001
        MVII    #$6791, R0                      ; 567B   02B8 0091 0067
        SDBD                                    ; 567E   0001
        MVII    #$6798, R1                      ; 567F   02B9 0098 0067
        B       L_568C                          ; 5682   0200 0008

L_5684:
        SDBD                                    ; 5684   0001
        MVII    #$679F, R0                      ; 5685   02B8 009F 0067
        SDBD                                    ; 5688   0001
        MVII    #$67A6, R1                      ; 5689   02B9 00A6 0067
L_568C:
        MVII    #$0200, R4                      ; 568C   02BC 0200
        COMR    R4                              ; 568E   001C
        MVI     G_0345, R3                      ; 568F   0283 0345
        ANDR    R4,     R3                      ; 5691   01A3
        XORR    R5,     R3                      ; 5692   01EB
        MVO     R3,     G_0345                  ; 5693   0243 0345
        MVI     G_0325, R3                      ; 5695   0283 0325
        ANDR    R4,     R3                      ; 5697   01A3
        XORR    R5,     R3                      ; 5698   01EB
        MVO     R3,     G_0325                  ; 5699   0243 0325
        CMP     G_0346, R1                      ; 569B   0341 0346
        BEQ     L_56AD                          ; 569D   0204 000E

        MVO     R1,     G_0346                  ; 569F   0241 0346
        MVO     R0,     G_0326                  ; 56A1   0240 0326
        MVI     G_034A, R0                      ; 56A3   0280 034A
        SDBD                                    ; 56A5   0001
        ANDI    #$FFF0, R0                      ; 56A6   03B8 00F0 00FF
        MVO     R0,     G_034A                  ; 56A9   0240 034A
        MVO     R0,     G_032A                  ; 56AB   0240 032A
L_56AD:
        PULR    R7                              ; 56AD   02B7

        MOVR    R4,     R2                      ; 56AE   00A2
        ANDI    #$000F, R4                      ; 56AF   03BC 000F
        ANDR    R0,     R2                      ; 56B1   0182
        BNEQ    L_565F                          ; 56B2   022C 0054

        MOVR    R0,     R2                      ; 56B4   0082
        B       L_564A                          ; 56B5   0220 006C

L_56B7:
        MOVR    R2,     R3                      ; 56B7   0093
        COMR    R3                              ; 56B8   001B
        ANDR    R0,     R3                      ; 56B9   0183
        BEQ     L_565E                          ; 56BA   0224 005D

        MOVR    R3,     R0                      ; 56BC   0098
        B       L_563B                          ; 56BD   0220 0083

        PSHR    R5                              ; 56BF   0275
        MVII    #$0001, R4                      ; 56C0   02BC 0001
        MVO     R4,     G_034B                  ; 56C2   0244 034B
        MVI     G_034C, R4                      ; 56C4   0284 034C
        TSTR    R4                              ; 56C6   00A4
        BEQ     L_55BD                          ; 56C7   0224 010B
        B       L_565F                          ; 56C9   0220 006B

L_56CB:
        PSHR    R5                              ; 56CB   0275
        SLR     R1,     1                       ; 56CC   0061
        SLR     R2,     1                       ; 56CD   0062
        SLL     R2,     2                       ; 56CE   004E
        SLL     R2,     2                       ; 56CF   004E
        XORR    R1,     R2                      ; 56D0   01CA
        MOVR    R2,     R1                      ; 56D1   0091
        MVO     R2,     G_0196                  ; 56D2   0242 0196
        SDBD                                    ; 56D4   0001
        ADDI    #$4224, R2                      ; 56D5   02FA 0024 0042
        MVI@    R2,     R0                      ; 56D8   0290
        INCR    R0                              ; 56D9   0008
        CMPI    #$0100, R0                      ; 56DA   0378 0100
        BNEQ    L_56DF                          ; 56DC   020C 0001

        DECR    R0                              ; 56DE   0010
L_56DF:
        MVO@    R0,     R2                      ; 56DF   0250
        SDBD                                    ; 56E0   0001
        ADDI    #$FF80, R2                      ; 56E1   02FA 0080 00FF
        MVI@    R2,     R0                      ; 56E4   0290
        ANDI    #$00FF, R0                      ; 56E5   03B8 00FF
        CMPI    #$00FF, R0                      ; 56E7   0378 00FF
        BNEQ    L_56EE                          ; 56E9   020C 0003

        MVI     G_017A, R0                      ; 56EB   0280 017A
        PULR    R7                              ; 56ED   02B7

L_56EE:
        SLL     R1,     2                       ; 56EE   004D
        SDBD                                    ; 56EF   0001
        ADDI    #$44E4, R1                      ; 56F0   02F9 00E4 0044
        MOVR    R1,     R4                      ; 56F3   008C
        MVII    #$0004, R5                      ; 56F4   02BD 0004
        CLRR    R0                              ; 56F6   01C0
        MVO     R0,     G_0194                  ; 56F7   0240 0194
        COMR    R0                              ; 56F9   0018
        MVO     R0,     G_0193                  ; 56FA   0240 0193
        MVO     R0,     G_0195                  ; 56FC   0240 0195
        CLRR    R0                              ; 56FE   01C0
L_56FF:
        MVI     G_0194, R3                      ; 56FF   0283 0194
        SLR     R3,     1                       ; 5701   0063
        MVO     R3,     G_0194                  ; 5702   0243 0194
        SLR     R0,     1                       ; 5704   0060
        MVI@    R4,     R3                      ; 5705   02A3
        CMPI    #$00FF, R3                      ; 5706   037B 00FF
        BEQ     L_5725                          ; 5708   0204 001B

        SDBD                                    ; 570A   0001
        ADDI    #$41A4, R3                      ; 570B   02FB 00A4 0041
        MVI@    R3,     R2                      ; 570E   029A
        TSTR    R2                              ; 570F   0092
        BNEQ    L_572E                          ; 5710   020C 001C

        SDBD                                    ; 5712   0001
        ADDI    #$0080, R3                      ; 5713   02FB 0080 0000
        MVI@    R3,     R2                      ; 5716   029A
        CMP     G_0195, R2                      ; 5717   0342 0195
        BGT     L_5725                          ; 5719   020E 000A
        BEQ     L_5723                          ; 571B   0204 0006

        MVO     R2,     G_0195                  ; 571D   0242 0195
        MVII    #$0008, R0                      ; 571F   02B8 0008
        B       L_5725                          ; 5721   0200 0002

L_5723:
        XORI    #$0008, R0                      ; 5723   03F8 0008
L_5725:
        DECR    R5                              ; 5725   0015
        BNEQ    L_56FF                          ; 5726   022C 0028

        MVI     G_0194, R1                      ; 5728   0281 0194
        TSTR    R1                              ; 572A   0089
        BNEQ    L_5751                          ; 572B   020C 0024
L_572D:
        PULR    R7                              ; 572D   02B7

L_572E:
        ANDI    #$00FF, R2                      ; 572E   03BA 00FF
        CMPI    #$00FF, R2                      ; 5730   037A 00FF
        BNEQ    L_573B                          ; 5732   020C 0007

        MVII    #$0008, R2                      ; 5734   02BA 0008
        MVO     R2,     G_0194                  ; 5736   0242 0194
        CLRR    R2                              ; 5738   01D2
        MVO     R2,     G_0193                  ; 5739   0242 0193
L_573B:
        CMP     G_0193, R2                      ; 573B   0342 0193
        BPL     L_5725                          ; 573D   0223 0019
        BEQ     L_5749                          ; 573F   0204 0008

        MVO     R2,     G_0193                  ; 5741   0242 0193
        MVII    #$0008, R2                      ; 5743   02BA 0008
        MVO     R2,     G_0194                  ; 5745   0242 0194
        B       L_5725                          ; 5747   0220 0023

L_5749:
        MVI     G_0194, R2                      ; 5749   0282 0194
        XORI    #$0008, R2                      ; 574B   03FA 0008
        MVO     R2,     G_0194                  ; 574D   0242 0194
        B       L_5725                          ; 574F   0220 002B

L_5751:
        JSR     R5,     L_5F0A                  ; 5751   0004 015C 030A

        MVI     G_0194, R0                      ; 5754   0280 0194
        MVI     G_0196, R2                      ; 5756   0282 0196
        SDBD                                    ; 5758   0001
        ADDI    #$4224, R2                      ; 5759   02FA 0024 0042
        MVI@    R2,     R3                      ; 575C   0293
        CMPI    #$00FF, R3                      ; 575D   037B 00FF
        BEQ     L_572D                          ; 575F   0224 0033

        DECR    R3                              ; 5761   0013
        MVO@    R3,     R2                      ; 5762   0253
        B       L_572D                          ; 5763   0220 0037

L_5765:
        PSHR    R5                              ; 5765   0275
        PSHR    R4                              ; 5766   0274
        PSHR    R3                              ; 5767   0273
        MVI     G_018F, R3                      ; 5768   0283 018F
        SLL     R3,     2                       ; 576A   004F
        SLL     R3,     1                       ; 576B   004B
        MOVR    R2,     R4                      ; 576C   0094
        ANDI    #$000C, R4                      ; 576D   03BC 000C
        BEQ     L_5777                          ; 576F   0204 0006

        SDBD                                    ; 5771   0001
        ADDI    #$5793, R3                      ; 5772   02FB 0093 0057
        B       L_577B                          ; 5775   0200 0004

L_5777:
        SDBD                                    ; 5777   0001
        ADDI    #$57BB, R3                      ; 5778   02FB 00BB 0057
L_577B:
        PSHR    R3                              ; 577B   0273
        MVI     G_0347, R3                      ; 577C   0283 0347
        SWAP    R3,     1                       ; 577E   0043
        ANDI    #$0007, R3                      ; 577F   03BB 0007
        BNEQ    L_5788                          ; 5781   020C 0005

        MVI     G_0348, R3                      ; 5783   0283 0348
        SWAP    R3,     1                       ; 5785   0043
        ANDI    #$0007, R3                      ; 5786   03BB 0007
L_5788:
        PULR    R4                              ; 5788   02B4
        ADDR    R4,     R3                      ; 5789   00E3
        MVI@    R3,     R3                      ; 578A   029B
        TSTR    R3                              ; 578B   009B
        BEQ     L_5790                          ; 578C   0204 0002

        SLL     R0,     1                       ; 578E   0048
        SLL     R1,     1                       ; 578F   0049
L_5790:
        PULR    R3                              ; 5790   02B3
        PULR    R4                              ; 5791   02B4
        PULR    R7                              ; 5792   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5793   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5797   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 579B   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 579F   0001 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 57A3   0001 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 57A7   0001 0000 0000 0000
        DECLE   $0001,  $0000,  $0001,  $0000   ; 57AB   0001 0000 0001 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; 57AF   0000 0001 0000 0000
        DECLE   $0001,  $0000,  $0001,  $0000   ; 57B3   0001 0000 0001 0000
        DECLE   $0001,  $0000,  $0001,  $0000   ; 57B7   0001 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57BB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57BF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; 57C3   0000 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57C7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; 57CB   0000 0000 0001 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; 57CF   0000 0000 0001 0000
        DECLE   $0001,  $0000,  $0000,  $0001   ; 57D3   0001 0000 0000 0001
        DECLE   $0000,  $0000,  $0001,  $0000   ; 57D7   0000 0000 0001 0000
        DECLE   $0001,  $0000,  $0001,  $0000   ; 57DB   0001 0000 0001 0000
        DECLE   $0001,  $0000,  $0001,  $0000   ; 57DF   0001 0000 0001 0000
L_57E3:
        PSHR    R5                              ; 57E3   0275
        CLRR    R1                              ; 57E4   01C9
L_57E5:
        SARC    R0,     1                       ; 57E5   0078
        ADCR    R1                              ; 57E6   0029
        TSTR    R0                              ; 57E7   0080
        BNEQ    L_57E5                          ; 57E8   022C 0004
        PULR    R7                              ; 57EA   02B7

        PSHR    R5                              ; 57EB   0275
        DECR    R0                              ; 57EC   0010
        BNEQ    L_581B                          ; 57ED   020C 002C

        MVI     G_01B1, R1                      ; 57EF   0281 01B1
        CMPI    #$0001, R1                      ; 57F1   0379 0001
        BEQ     L_57FD                          ; 57F3   0204 0008

        MVII    #$0121, R1                      ; 57F5   02B9 0121
        ADD     G_0170, R1                      ; 57F7   02C1 0170
        MVI@    R1,     R1                      ; 57F9   0289
        TSTR    R1                              ; 57FA   0089
        BEQ     L_581B                          ; 57FB   0204 001E

L_57FD:
        MVI     G_031E, R0                      ; 57FD   0280 031E
        TSTR    R0                              ; 57FF   0080
        BNEQ    L_581B                          ; 5800   020C 0019

        MVI     G_0199, R0                      ; 5802   0280 0199
        TSTR    R0                              ; 5804   0080
        BEQ     L_581F                          ; 5805   0204 0018

        DECR    R0                              ; 5807   0010
        MVO     R0,     G_0199                  ; 5808   0240 0199
        SDBD                                    ; 580A   0001
        MVII    #$65D8, R1                      ; 580B   02B9 00D8 0065
        MVII    #$031D, R2                      ; 580E   02BA 031D

        JSR     R5,     X_INIT_MOB              ; 5810   0004 0114 02B2

        MVI     G_0357, R1                      ; 5813   0281 0357
        MVI     G_0358, R2                      ; 5815   0282 0358
        MVO     R1,     G_031F                  ; 5817   0241 031F
        MVO     R2,     G_0320                  ; 5819   0242 0320

L_581B:
        JSR     R5,     L_5AAD                  ; 581B   0004 0158 02AD

        PULR    R7                              ; 581E   02B7

L_581F:
        JSR     R5,     X_PLAY_RAZZ1            ; 581F   0004 011C 02BA

        MVII    #$00FF, R0                      ; 5822   02B8 00FF
        MVO     R0,     G_019D                  ; 5824   0240 019D
        B       L_581B                          ; 5826   0220 000C

        PSHR    R5                              ; 5828   0275

        JSR     R5,     L_5E62                  ; 5829   0004 015C 0262

        MVI     G_019A, R1                      ; 582C   0281 019A
        ADD     G_034B, R1                      ; 582E   02C1 034B
        CMP     G_019A, R1                      ; 5830   0341 019A
        BEQ     L_5851                          ; 5832   0204 001D

        MVO     R1,     G_034B                  ; 5834   0241 034B
        SDBD                                    ; 5836   0001
        MVII    #$67AD, R1                      ; 5837   02B9 00AD 0067
        MVO     R1,     G_0326                  ; 583A   0241 0326
        SDBD                                    ; 583C   0001
        MVII    #$67B4, R1                      ; 583D   02B9 00B4 0067
        MVO     R1,     G_0346                  ; 5840   0241 0346
        MVI     G_034A, R1                      ; 5842   0281 034A
        ANDI    #$000F, R1                      ; 5844   03B9 000F
        XOR     G_034A, R1                      ; 5846   03C1 034A
        MVO     R1,     G_034A                  ; 5848   0241 034A
        MVO     R1,     G_032A                  ; 584A   0241 032A
        CLRR    R1                              ; 584C   01C9
        MVO     R1,     G_031E                  ; 584D   0241 031E
        MVO     R1,     G_01B8                  ; 584F   0241 01B8
L_5851:
        PULR    R7                              ; 5851   02B7

        PSHR    R5                              ; 5852   0275
        PSHR    R1                              ; 5853   0271
        ADDI    #$0002, R1                      ; 5854   02F9 0002
        MVI@    R1,     R2                      ; 5856   028A
        INCR    R1                              ; 5857   0009
        MVI@    R1,     R3                      ; 5858   028B
        SWAP    R2,     1                       ; 5859   0042
        SWAP    R3,     1                       ; 585A   0043
        ANDI    #$00FF, R2                      ; 585B   03BA 00FF
        ANDI    #$00FF, R3                      ; 585D   03BB 00FF
        NEGR    R2                              ; 585F   0022
        NEGR    R3                              ; 5860   0023
        ADD     G_017D, R2                      ; 5861   02C2 017D
        BPL     L_5866                          ; 5863   0203 0001

        NEGR    R2                              ; 5865   0022
L_5866:
        ADD     G_017E, R3                      ; 5866   02C3 017E
        BPL     L_586B                          ; 5868   0203 0001

        NEGR    R3                              ; 586A   0023
L_586B:
        PULR    R1                              ; 586B   02B1
        CMPI    #$0004, R2                      ; 586C   037A 0004
        BGT     L_58F2                          ; 586E   020E 0082

        CMPI    #$0004, R3                      ; 5870   037B 0004
        BGT     L_58F2                          ; 5872   020E 007E

        MVI@    R1,     R3                      ; 5874   028B
        SDBD                                    ; 5875   0001
        ANDI    #$FDFF, R3                      ; 5876   03BB 00FF 00FD
        SDBD                                    ; 5879   0001
        XORI    #$1005, R3                      ; 587A   03FB 0005 0010
        MVO@    R3,     R1                      ; 587D   024B
        MVI     G_019B, R3                      ; 587E   0283 019B
        INCR    R3                              ; 5880   000B
        MVO     R3,     G_019B                  ; 5881   0243 019B
        DECR    R3                              ; 5883   0013
        INCR    R3                              ; 5884   000B
        ADDR    R7,     R3                      ; 5885   00FB
        ADD@    R3,     R7                      ; 5886   02DF

        DIS                                     ; 5887   0003
        DECR    R0                              ; 5888   0010
        COMR    R5                              ; 5889   001D

        JSR     R5,     L_5955                  ; 588A   0004 0158 0155
        DECLE   $0005                           ; 588D   0005

        JSR     R5,     L_5E56                  ; 588E   0004 015C 0256

        SDBD                                    ; 5891   0001
        MVII    #$67C4, R3                      ; 5892   02BB 00C4 0067
        B       L_58E0                          ; 5895   0200 0049

        JSR     R5,     L_5955                  ; 5897   0004 0158 0155
        DECLE   $0014                           ; 589A   0014

        JSR     R5,     L_5E5A                  ; 589B   0004 015C 025A

        SDBD                                    ; 589E   0001
        MVII    #$67CB, R3                      ; 589F   02BB 00CB 0067
        B       L_58E0                          ; 58A2   0200 003C

        MVO     R0,     G_019C                  ; 58A4   0240 019C
        MVII    #$032D, R3                      ; 58A6   02BB 032D
        MVII    #$0003, R0                      ; 58A8   02B8 0003
        MVII    #$0258, R2                      ; 58AA   02BA 0258
        CLRR    R5                              ; 58AC   01ED
L_58AD:
        CMPR    R3,     R1                      ; 58AD   0159
        BEQ     L_58C3                          ; 58AE   0204 0013

        INCR    R3                              ; 58B0   000B
        MVI@    R3,     R4                      ; 58B1   029C
        DECR    R3                              ; 58B2   0013
        SDBD                                    ; 58B3   0001
        CMPI    #$67D9, R4                      ; 58B4   037C 00D9 0067
        BNEQ    L_58C3                          ; 58B7   020C 000A

        ADDI    #$0006, R3                      ; 58B9   02FB 0006
        MVI@    R3,     R4                      ; 58BB   029C
        MVO@    R5,     R3                      ; 58BC   025D
        SUBI    #$0006, R3                      ; 58BD   033B 0006
        CMPR    R4,     R2                      ; 58BF   0162
        BLE     L_58C3                          ; 58C0   0206 0001

        MOVR    R4,     R2                      ; 58C2   00A2
L_58C3:
        ADDI    #$0008, R3                      ; 58C3   02FB 0008
        DECR    R0                              ; 58C5   0010
        BNEQ    L_58AD                          ; 58C6   022C 001A

        ADDI    #$0064, R2                      ; 58C8   02FA 0064
        MVO     R2,     G_0317                  ; 58CA   0242 0317

        JSR     R5,     L_5955                  ; 58CC   0004 0158 0155
        DECLE   $004B                           ; 58CF   004B

        JSR     R5,     L_5E5E                  ; 58D0   0004 015C 025E

        CLRR    R3                              ; 58D3   01DB
        MVO     R3,     G_034B                  ; 58D4   0243 034B
        MVO     R3,     G_032B                  ; 58D6   0243 032B
        MVO     R3,     G_034A                  ; 58D8   0243 034A
        MVO     R3,     G_032A                  ; 58DA   0243 032A
        SDBD                                    ; 58DC   0001
        MVII    #$67D2, R3                      ; 58DD   02BB 00D2 0067
L_58E0:
        INCR    R1                              ; 58E0   0009
        PSHR    R1                              ; 58E1   0271
        ADDI    #$0004, R1                      ; 58E2   02F9 0004
        CLRR    R2                              ; 58E4   01D2
        MVO@    R2,     R1                      ; 58E5   024A
        PULR    R1                              ; 58E6   02B1
        MVO@    R3,     R1                      ; 58E7   024B
        ADDI    #$0005, R1                      ; 58E8   02F9 0005
        MVII    #$0014, R3                      ; 58EA   02BB 0014
        MVO@    R3,     R1                      ; 58EC   024B
        MVII    #$0013, R0                      ; 58ED   02B8 0013
        SUBI    #$0002, R1                      ; 58EF   0339 0002
        MVO@    R0,     R1                      ; 58F1   0248
L_58F2:
        PULR    R7                              ; 58F2   02B7

        PSHR    R5                              ; 58F3   0275
        PSHR    R0                              ; 58F4   0270
        PSHR    R1                              ; 58F5   0271
        ADDI    #$0004, R1                      ; 58F6   02F9 0004
        MVI@    R1,     R0                      ; 58F8   0288
        DECR    R0                              ; 58F9   0010
        BLE     L_590B                          ; 58FA   0206 000F

        MVO@    R0,     R1                      ; 58FC   0248
        PULR    R1                              ; 58FD   02B1
        MVI@    R1,     R0                      ; 58FE   0288
        SDBD                                    ; 58FF   0001
        XORI    #$1000, R0                      ; 5900   03F8 0000 0010
        MVO@    R0,     R1                      ; 5903   0248
        MVII    #$0005, R0                      ; 5904   02B8 0005
        ADDI    #$0006, R1                      ; 5906   02F9 0006
        MVO@    R0,     R1                      ; 5908   0248
        PULR    R0                              ; 5909   02B0
        PULR    R7                              ; 590A   02B7

L_590B:
        PULR    R1                              ; 590B   02B1
        PULR    R0                              ; 590C   02B0
        MOVR    R1,     R5                      ; 590D   008D
        SDBD                                    ; 590E   0001
        MVII    #$67D9, R3                      ; 590F   02BB 00D9 0067
        INCR    R1                              ; 5912   0009
        MVO@    R3,     R1                      ; 5913   024B
        ADDI    #$0005, R1                      ; 5914   02F9 0005
        MVII    #$01F4, R3                      ; 5916   02BB 01F4
        MVO@    R3,     R1                      ; 5918   024B
        MVI     G_019B, R1                      ; 5919   0281 019B
        CMPI    #$0003, R1                      ; 591B   0379 0003
        BNEQ    L_592A                          ; 591D   020C 000B

        MVI     G_019C, R1                      ; 591F   0281 019C
        CMPR    R0,     R1                      ; 5921   0141
        BNEQ    L_592B                          ; 5922   020C 0007

        JSR     R5,     L_5DF9                  ; 5924   0004 015C 01F9

        CLRR    R1                              ; 5927   01C9
        MVO     R1,     G_019C                  ; 5928   0241 019C
L_592A:
        PULR    R7                              ; 592A   02B7

L_592B:
        CLRR    R1                              ; 592B   01C9
        ADDI    #$0006, R5                      ; 592C   02FD 0006
        MVO@    R1,     R5                      ; 592E   0269
        B       L_592A                          ; 592F   0220 0006

        PSHR    R5                              ; 5931   0275
        MVI     G_019B, R3                      ; 5932   0283 019B
        CMPI    #$0003, R3                      ; 5934   037B 0003
        BEQ     L_594F                          ; 5936   0204 0017

        MVI@    R1,     R3                      ; 5938   028B
        SDBD                                    ; 5939   0001
        XORI    #$1005, R3                      ; 593A   03FB 0005 0010
        MVO@    R3,     R1                      ; 593D   024B
        SDBD                                    ; 593E   0001
        MVII    #$6768, R3                      ; 593F   02BB 0068 0067
        INCR    R1                              ; 5942   0009
        MVO@    R3,     R1                      ; 5943   024B
        ADDI    #$0005, R1                      ; 5944   02F9 0005
        MVII    #$0002, R3                      ; 5946   02BB 0002
        MVO@    R3,     R1                      ; 5948   024B
        MVI     G_019B, R3                      ; 5949   0283 019B
        DECR    R3                              ; 594B   0013
        MVO     R3,     G_019B                  ; 594C   0243 019B
L_594E:
        PULR    R7                              ; 594E   02B7

L_594F:
        ADDI    #$0006, R1                      ; 594F   02F9 0006
        CLRR    R3                              ; 5951   01DB
        MVO@    R3,     R1                      ; 5952   024B
        B       L_594E                          ; 5953   0220 0006

L_5955:
        MVI@    R5,     R0                      ; 5955   02A8
        PSHR    R5                              ; 5956   0275
        PSHR    R1                              ; 5957   0271
        MVI     G_035C, R1                      ; 5958   0281 035C
        MOVR    R1,     R5                      ; 595A   008D
        ADDR    R0,     R1                      ; 595B   00C1
        SDBD                                    ; 595C   0001
        CMPI    #$09C4, R1                      ; 595D   0379 00C4 0009
        BLT     L_5972                          ; 5960   0205 0010

        SDBD                                    ; 5962   0001
        CMPI    #$09C4, R5                      ; 5963   037D 00C4 0009
        BGE     L_5972                          ; 5966   020D 000A

        MVI     G_01B2, R5                      ; 5968   0285 01B2
        INCR    R5                              ; 596A   000D
        MVO     R5,     G_01B2                  ; 596B   0245 01B2
        PSHR    R0                              ; 596D   0270

        JSR     R5,     L_5FDC                  ; 596E   0004 015C 03DC

        PULR    R0                              ; 5971   02B0
L_5972:
        SDBD                                    ; 5972   0001
        CMPI    #$2710, R1                      ; 5973   0379 0010 0027
        BLT     L_5980                          ; 5976   0205 0008

        SDBD                                    ; 5978   0001
        SUBI    #$2710, R1                      ; 5979   0339 0010 0027
        MVII    #$000D, R0                      ; 597C   02B8 000D
        MVO     R0,     G_01A0                  ; 597E   0240 01A0
L_5980:
        MVO     R1,     G_035C                  ; 5980   0241 035C
        MVI     G_0170, R0                      ; 5982   0280 0170

        JSR     R5,     L_59BB                  ; 5984   0004 0158 01BB

        MVI     G_01A5, R0                      ; 5987   0280 01A5
        SWAP    R0,     1                       ; 5989   0040
        ADD     G_01A6, R0                      ; 598A   02C0 01A6
        CMPR    R0,     R1                      ; 598C   0141
        BLT     L_599B                          ; 598D   0205 000C

        PSHR    R1                              ; 598F   0271
        MVO     R1,     G_01A6                  ; 5990   0241 01A6
        SWAP    R1,     1                       ; 5992   0041
        MVO     R1,     G_01A5                  ; 5993   0241 01A5
        PULR    R1                              ; 5995   02B1
        MVII    #$0002, R0                      ; 5996   02B8 0002

        JSR     R5,     L_59BB                  ; 5998   0004 0158 01BB

L_599B:
        MVI     G_035C, R1                      ; 599B   0281 035C
        PSHR    R1                              ; 599D   0271
        MVII    #$01F4, R2                      ; 599E   02BA 01F4

        JSR     R5,     X_DIV                   ; 59A0   0004 011C 01FB

        CMP     G_01A1, R0                      ; 59A3   0340 01A1
        BLT     L_59A9                          ; 59A5   0205 0002

        MVO     R0,     G_01A1                  ; 59A7   0240 01A1
L_59A9:
        PULR    R1                              ; 59A9   02B1
        SUB     G_0354, R1                      ; 59AA   0301 0354
        BLE     L_59B9                          ; 59AC   0206 000B

        MVII    #$00C8, R2                      ; 59AE   02BA 00C8

        JSR     R5,     X_DIV                   ; 59B0   0004 011C 01FB

        MOVR    R0,     R1                      ; 59B3   0081
        ADD     G_01A0, R1                      ; 59B4   02C1 01A0

        JSR     R5,     L_5A04                  ; 59B6   0004 0158 0204

L_59B9:
        PULR    R1                              ; 59B9   02B1
        PULR    R7                              ; 59BA   02B7

L_59BB:
        PSHR    R5                              ; 59BB   0275
        PSHR    R1                              ; 59BC   0271
        MOVR    R0,     R2                      ; 59BD   0082
        SDBD                                    ; 59BE   0001
        ADDI    #$59D4, R2                      ; 59BF   02FA 00D4 0059
        MVII    #$0200, R4                      ; 59C2   02BC 0200
        ADD@    R2,     R4                      ; 59C4   02D4
        ADDI    #$0003, R2                      ; 59C5   02FA 0003
        MOVR    R1,     R0                      ; 59C7   0088
        MVII    #$0004, R1                      ; 59C8   02B9 0004
        MVI@    R2,     R3                      ; 59CA   0293
        SDBD                                    ; 59CB   0001
        XORI    #$0800, R3                      ; 59CC   03FB 0000 0008

        JSR     R5,     X_PRNUM_ZRO             ; 59CF   0004 0118 00AD

        PULR    R1                              ; 59D2   02B1
        PULR    R7                              ; 59D3   02B7

        DECLE   $0002,  $000E,  $0008,  $0006   ; 59D4   0002 000E 0008 0006
        DECLE   $0006,  $0001                   ; 59D8   0006 0001
L_59DA:
        PSHR    R5                              ; 59DA   0275
        MVI     G_01B1, R0                      ; 59DB   0280 01B1
        TSTR    R0                              ; 59DD   0080
        BEQ     L_5A03                          ; 59DE   0204 0023

        MVI     G_0170, R0                      ; 59E0   0280 0170
        TSTR    R0                              ; 59E2   0080
        BNEQ    L_59ED                          ; 59E3   020C 0008

        SDBD                                    ; 59E5   0001
        MVII    #$1004, R3                      ; 59E6   02BB 0004 0010
        MVII    #$0217, R4                      ; 59E9   02BC 0217
        B       L_59F3                          ; 59EB   0200 0006

L_59ED:
        SDBD                                    ; 59ED   0001
        MVII    #$1001, R3                      ; 59EE   02BB 0001 0010
        MVII    #$0223, R4                      ; 59F1   02BC 0223
L_59F3:
        MVII    #$0003, R0                      ; 59F3   02B8 0003
L_59F5:
        MVI@    R4,     R2                      ; 59F5   02A2
        DECR    R4                              ; 59F6   0014
        XORR    R3,     R2                      ; 59F7   01DA
        MVO@    R2,     R4                      ; 59F8   0262
        DECR    R0                              ; 59F9   0010
        BNEQ    L_59F5                          ; 59FA   022C 0006

        MVI     G_019F, R1                      ; 59FC   0281 019F
        INCR    R1                              ; 59FE   0009
        ANDI    #$0001, R1                      ; 59FF   03B9 0001
        MVO     R1,     G_019F                  ; 5A01   0241 019F
L_5A03:
        PULR    R7                              ; 5A03   02B7

L_5A04:
        PSHR    R5                              ; 5A04   0275
        MOVR    R1,     R0                      ; 5A05   0088

        JSR     R5,     X_CLAMP                 ; 5A06   0004 0114 0270
        DECLE   $0000                           ; 5A09   0000

        INCR    R4                              ; 5A0A   000C
        MOVR    R0,     R1                      ; 5A0B   0081
        MVO     R1,     G_019E                  ; 5A0C   0241 019E
        MOVR    R1,     R2                      ; 5A0E   008A
        SLL     R2,     2                       ; 5A0F   004E
        SDBD                                    ; 5A10   0001
        MVII    #$5A32, R4                      ; 5A11   02BC 0032 005A
        ADDR    R2,     R4                      ; 5A14   00D4
        SDBD                                    ; 5A15   0001
        MVII    #$5A2F, R5                      ; 5A16   02BD 002F 005A
        MVII    #$0003, R0                      ; 5A19   02B8 0003
L_5A1B:
        MVI@    R4,     R1                      ; 5A1B   02A1
        MVI@    R5,     R2                      ; 5A1C   02AA
        MVO@    R1,     R2                      ; 5A1D   0251
        DECR    R0                              ; 5A1E   0010
        BNEQ    L_5A1B                          ; 5A1F   022C 0005

        MVI@    R4,     R0                      ; 5A21   02A0
        MOVR    R0,     R1                      ; 5A22   0081
        ANDI    #$0200, R1                      ; 5A23   03B9 0200
        BEQ     L_5A2B                          ; 5A25   0204 0004

        SDBD                                    ; 5A27   0001
        XORI    #$1200, R0                      ; 5A28   03F8 0000 0012

L_5A2B:
        JSR     R5,     L_5AE2                  ; 5A2B   0004 0158 02E2

        PULR    R7                              ; 5A2E   02B7

        DECLE   $018A,  $018F,  $019A,  $0003   ; 5A2F   018A 018F 019A 0003
        DECLE   $0000,  $00C8,  $0205,  $0004   ; 5A33   0000 00C8 0205 0004
        DECLE   $0000,  $00C8,  $0202,  $0005   ; 5A37   0000 00C8 0202 0005
        DECLE   $0000,  $00C8,  $0207,  $0006   ; 5A3B   0000 00C8 0207 0006
        DECLE   $0000,  $00C8,  $0201,  $0007   ; 5A3F   0000 00C8 0201 0007
        DECLE   $0000,  $00C8,  $0006,  $0008   ; 5A43   0000 00C8 0006 0008
        DECLE   $0000,  $00C8,  $0004,  $0008   ; 5A47   0000 00C8 0004 0008
        DECLE   $0001,  $00C8,  $0002,  $0008   ; 5A4B   0001 00C8 0002 0008
        DECLE   $0002,  $00C8,  $0204,  $0008   ; 5A4F   0002 00C8 0204 0008
        DECLE   $0003,  $00C8,  $0005,  $0008   ; 5A53   0003 00C8 0005 0008
        DECLE   $0003,  $008C,  $0001           ; 5A57   0003 008C 0001

        INCR    R0                              ; 5A5A   0008
        DIS                                     ; 5A5B   0003
        SLR     R0,     2                       ; 5A5C   0064
        B       L_5A67                          ; 5A5D   0200 0008

        DECLE   $0004,  $0028,  $0007,  $0008   ; 5A5F   0004 0028 0007 0008
        DECLE   $0004,  $0028,  $0000           ; 5A63   0004 0028 0000
L_5A66:
        PSHR    R5                              ; 5A66   0275
L_5A67:
        MVI     G_01B2, R0                      ; 5A67   0280 01B2
        DECR    R0                              ; 5A69   0010

        JSR     R5,     X_CLAMP                 ; 5A6A   0004 0114 0270
        DECLE   $0000                           ; 5A6D   0000

        DIS                                     ; 5A6E   0003
        CLRR    R1                              ; 5A6F   01C9
        MVO     R1,     .BTAB.1E                ; 5A70   0241 021E
        SDBD                                    ; 5A72   0001
        MVII    #$1803, R1                      ; 5A73   02B9 0003 0018
        MVII    #$021D, R4                      ; 5A76   02BC 021D
        MVI     G_01A2, R3                      ; 5A78   0283 01A2
        CMPI    #$0003, R0                      ; 5A7A   0378 0003
        BNEQ    L_5A89                          ; 5A7C   020C 000B

        SDBD                                    ; 5A7E   0001
        ADDI    #$5AA9, R3                      ; 5A7F   02FB 00A9 005A
        MVI@    R3,     R3                      ; 5A82   029B
        ADDR    R1,     R3                      ; 5A83   00CB
        MVO     R3,     .BTAB.1E                ; 5A84   0243 021E
        MVI     G_01A2, R3                      ; 5A86   0283 01A2
        DECR    R0                              ; 5A88   0010
L_5A89:
        INCR    R3                              ; 5A89   000B
        ANDI    #$0003, R3                      ; 5A8A   03BB 0003
        MVO     R3,     G_01A2                  ; 5A8C   0243 01A2
        MVO     R3,     G_01A3                  ; 5A8E   0243 01A3
        TSTR    R0                              ; 5A90   0080
        BEQ     L_5AA6                          ; 5A91   0204 0013

L_5A93:
        MVI     G_01A3, R3                      ; 5A93   0283 01A3
        INCR    R3                              ; 5A95   000B
        ANDI    #$0003, R3                      ; 5A96   03BB 0003
        MVO     R3,     G_01A3                  ; 5A98   0243 01A3
        SDBD                                    ; 5A9A   0001
        MVII    #$5AA9, R5                      ; 5A9B   02BD 00A9 005A
        ADDR    R3,     R5                      ; 5A9E   00DD
        MVI@    R5,     R3                      ; 5A9F   02AB
        XORR    R1,     R3                      ; 5AA0   01CB
        MVO@    R3,     R4                      ; 5AA1   0263
        INCR    R4                              ; 5AA2   000C
        DECR    R0                              ; 5AA3   0010
        BNEQ    L_5A93                          ; 5AA4   022C 0012

L_5AA6:
        CLRR    R1                              ; 5AA6   01C9
        MVO@    R1,     R4                      ; 5AA7   0261
        PULR    R7                              ; 5AA8   02B7

        ADDR    R4,     R0                      ; 5AA9   00E0
        SUBR    R2,     R0                      ; 5AAA   0110
        XORR    R7,     R0                      ; 5AAB   01F8
        SUBR    R2,     R0                      ; 5AAC   0110
L_5AAD:
        PSHR    R5                              ; 5AAD   0275
        MVII    #$0007, R0                      ; 5AAE   02B8 0007
        MVII    #$02DE, R4                      ; 5AB0   02BC 02DE

        JSR     R5,     X_FILL_ZERO             ; 5AB2   0004 0114 0338

        MVII    #$0007, R0                      ; 5AB5   02B8 0007
        MVII    #$02E7, R4                      ; 5AB7   02BC 02E7

        JSR     R5,     X_FILL_ZERO             ; 5AB9   0004 0114 0338

        SDBD                                    ; 5ABC   0001
        MVII    #$0807, R1                      ; 5ABD   02B9 0007 0008
        MVI     G_0199, R0                      ; 5AC0   0280 0199
        TSTR    R0                              ; 5AC2   0080
        BEQ     L_5AE1                          ; 5AC3   0204 001C

        PSHR    R0                              ; 5AC5   0270
        CMPI    #$0007, R0                      ; 5AC6   0378 0007
        BLT     L_5ACC                          ; 5AC8   0205 0002

        MVII    #$0007, R0                      ; 5ACA   02B8 0007
L_5ACC:
        MVII    #$02DE, R4                      ; 5ACC   02BC 02DE

        JSR     R5,     X_FILL_MEM              ; 5ACE   0004 0114 0341

        PULR    R0                              ; 5AD1   02B0
        SUBI    #$0007, R0                      ; 5AD2   0338 0007
        BLE     L_5AE1                          ; 5AD4   0206 000B

        MVII    #$02E7, R4                      ; 5AD6   02BC 02E7
        CMPI    #$0007, R0                      ; 5AD8   0378 0007
        BLT     L_5ADE                          ; 5ADA   0205 0002

        MVII    #$0007, R0                      ; 5ADC   02B8 0007

L_5ADE:
        JSR     R5,     X_FILL_MEM              ; 5ADE   0004 0114 0341

L_5AE1:
        PULR    R7                              ; 5AE1   02B7

L_5AE2:
        PSHR    R5                              ; 5AE2   0275
        MVII    #$0010, R5                      ; 5AE3   02BD 0010
        MVII    #$022A, R1                      ; 5AE5   02B9 022A
        MVII    #$0008, R4                      ; 5AE7   02BC 0008
L_5AE9:
        MVI@    R1,     R2                      ; 5AE9   028A
        SDBD                                    ; 5AEA   0001
        ANDI    #$EFF8, R2                      ; 5AEB   03BA 00F8 00EF
        XORR    R0,     R2                      ; 5AEE   01C2
        MVO@    R2,     R1                      ; 5AEF   024A
        INCR    R1                              ; 5AF0   0009
        DECR    R5                              ; 5AF1   0015
        BNEQ    L_5AE9                          ; 5AF2   022C 000A

        ADDI    #$0004, R1                      ; 5AF4   02F9 0004
        MVII    #$0010, R5                      ; 5AF6   02BD 0010
        DECR    R4                              ; 5AF8   0014
        BNEQ    L_5AE9                          ; 5AF9   022C 0011
        PULR    R7                              ; 5AFB   02B7

L_5AFC:
        PSHR    R5                              ; 5AFC   0275
        MVII    #$0216, R4                      ; 5AFD   02BC 0216
        MVII    #$0001, R3                      ; 5AFF   02BB 0001

        JSR     R5,     X_PRINT_R5              ; 5B01   0004 0118 007B
        STRING  "1 or 2 Players  "              ; 5B04  
        DECLE   $0000                           ; 5B14   0000
L_5B15:
        MVII    #$00FF, R0                      ; 5B15   02B8 00FF
        MVO     R0,     G_01B3                  ; 5B17   0240 01B3

L_5B19:
        JSR     R5,     L_5B69                  ; 5B19   0004 0158 0369

        CMPI    #$000B, R0                      ; 5B1C   0378 000B
        BEQ     L_5B3C                          ; 5B1E   0204 001C

        CMPI    #$000A, R0                      ; 5B20   0378 000A
        BEQ     L_5B19                          ; 5B22   0224 000A
        BLT     L_5B2D                          ; 5B24   0205 0007

        CLRR    R0                              ; 5B26   01C0
        MVO     R0,     G_01B3                  ; 5B27   0240 01B3
        MVO     R0,     .BTAB.26                ; 5B29   0240 0226
        B       L_5B19                          ; 5B2B   0220 0013

L_5B2D:
        MVO     R0,     G_01B3                  ; 5B2D   0240 01B3
        ADDI    #$0010, R0                      ; 5B2F   02F8 0010
        SLL     R0,     2                       ; 5B31   004C
        SLL     R0,     1                       ; 5B32   0048
        MVII    #$0226, R1                      ; 5B33   02B9 0226
        SDBD                                    ; 5B35   0001
        XORI    #$0802, R0                      ; 5B36   03F8 0002 0008
        MVO@    R0,     R1                      ; 5B39   0248
        B       L_5B19                          ; 5B3A   0220 0022

L_5B3C:
        MVI     G_01B3, R0                      ; 5B3C   0280 01B3
        CMPI    #$0001, R0                      ; 5B3E   0378 0001
        BEQ     L_5B4B                          ; 5B40   0204 0009

        CMPI    #$0002, R0                      ; 5B42   0378 0002
        BEQ     L_5B4B                          ; 5B44   0204 0005

        CLRR    R0                              ; 5B46   01C0
        MVO     R0,     .BTAB.26                ; 5B47   0240 0226
        B       L_5B15                          ; 5B49   0220 0035

L_5B4B:
        MVO     R0,     G_01B1                  ; 5B4B   0240 01B1
        MVII    #$0216, R4                      ; 5B4D   02BC 0216
        MVII    #$0011, R0                      ; 5B4F   02B8 0011

        JSR     R5,     X_FILL_ZERO             ; 5B51   0004 0114 0338

        PULR    R7                              ; 5B54   02B7

        DECLE   $0030,  $0031,  $0032,  $0033   ; 5B55   0030 0031 0032 0033
        DECLE   $0034,  $0035,  $0036,  $0037   ; 5B59   0034 0035 0036 0037

        RSWD    R0                              ; 5B5D   0038
        RSWD    R1                              ; 5B5E   0039
        SWAP    R1,     2                       ; 5B5F   0045
        INCR    R5                              ; 5B60   000D
        INCR    R3                              ; 5B61   000B
        INCR    R2                              ; 5B62   000A
        INCR    R0                              ; 5B63   0008
        INCR    R4                              ; 5B64   000C
        RLC     R1,     2                       ; 5B65   0055
        SWAP    R0,     2                       ; 5B66   0044
        SLL     R0,     2                       ; 5B67   004C
        RLC     R2,     1                       ; 5B68   0052
L_5B69:
        PSHR    R5                              ; 5B69   0275

L_5B6A:
        JSR     R5,     .EXEC.7C1               ; 5B6A   0004 0114 03C1

        MVI     G_015E, R0                      ; 5B6D   0280 015E
        ANDI    #$00EF, R0                      ; 5B6F   03B8 00EF
        XORI    #$0010, R0                      ; 5B71   03F8 0010
        MVO     R0,     G_015E                  ; 5B73   0240 015E
        SDBD                                    ; 5B75   0001
        MVII    #$1FFF, R0                      ; 5B76   02B8 00FF 001F
L_5B79:
        DECR    R0                              ; 5B79   0010
        BNEQ    L_5B79                          ; 5B7A   022C 0002

        JSR     R5,     L_5CF8                  ; 5B7C   0004 015C 00F8

        SDBD                                    ; 5B7F   0001
        MVII    #$5B55, R5                      ; 5B80   02BD 0055 005B
        MVI     G_0161, R0                      ; 5B83   0280 0161
        CMPI    #$0060, R0                      ; 5B85   0378 0060
        BLE     L_5B8B                          ; 5B87   0206 0002

        SUBI    #$0020, R0                      ; 5B89   0338 0020
L_5B8B:
        MVI@    R5,     R1                      ; 5B8B   02A9
        CMPR    R0,     R1                      ; 5B8C   0141
        BEQ     L_5B97                          ; 5B8D   0204 0008

        SDBD                                    ; 5B8F   0001
        CMPI    #$5B69, R5                      ; 5B90   037D 0069 005B
        BNEQ    L_5B8B                          ; 5B93   022C 0009
        B       L_5B6A                          ; 5B95   0220 002C

L_5B97:
        DECR    R5                              ; 5B97   0015
        SDBD                                    ; 5B98   0001
        SUBI    #$5B55, R5                      ; 5B99   033D 0055 005B
        MOVR    R5,     R0                      ; 5B9C   00A8
        PULR    R7                              ; 5B9D   02B7

        PSHR    R5                              ; 5B9E   0275
        MVI     G_019F, R1                      ; 5B9F   0281 019F
        TSTR    R1                              ; 5BA1   0089
        BEQ     L_5BA7                          ; 5BA2   0204 0003

        JSR     R5,     L_59DA                  ; 5BA4   0004 0158 01DA

L_5BA7:
        MVI     G_0357, R1                      ; 5BA7   0281 0357
        MVI     G_0347, R2                      ; 5BA9   0282 0347
        SWAP    R1,     1                       ; 5BAB   0041
        SWAP    R2,     1                       ; 5BAC   0042
        NEGR    R1                              ; 5BAD   0021
        ADDR    R1,     R2                      ; 5BAE   00CA
        BPL     L_5BB2                          ; 5BAF   0203 0001

        NEGR    R2                              ; 5BB1   0022
L_5BB2:
        CMPI    #$0004, R2                      ; 5BB2   037A 0004
        BGT     L_5CB6                          ; 5BB4   020E 0100

        MVI     G_0358, R1                      ; 5BB6   0281 0358
        MVI     G_0348, R2                      ; 5BB8   0282 0348
        SWAP    R1,     1                       ; 5BBA   0041
        SWAP    R2,     1                       ; 5BBB   0042
        NEGR    R1                              ; 5BBC   0021
        ADDR    R1,     R2                      ; 5BBD   00CA
        BPL     L_5BC1                          ; 5BBE   0203 0001

        NEGR    R2                              ; 5BC0   0022
L_5BC1:
        CMPI    #$0004, R2                      ; 5BC1   037A 0004
        BGT     L_5CB6                          ; 5BC3   020E 00F1

        CLRR    R0                              ; 5BC5   01C0
        MVO     R0,     G_01B4                  ; 5BC6   0240 01B4
        MVI     G_01B2, R0                      ; 5BC8   0280 01B2
        DECR    R0                              ; 5BCA   0010
        BPL     L_5BCE                          ; 5BCB   0203 0001

        CLRR    R0                              ; 5BCD   01C0
L_5BCE:
        MVO     R0,     G_01B2                  ; 5BCE   0240 01B2
        TSTR    R0                              ; 5BD0   0080
        BNEQ    L_5C31                          ; 5BD1   020C 005E

        MVI     G_0355, R0                      ; 5BD3   0280 0355
        SDBD                                    ; 5BD5   0001
        ANDI    #$F7FF, R0                      ; 5BD6   03B8 00FF 00F7
        MVO     R0,     G_0355                  ; 5BD9   0240 0355
        MVII    #$02E5, R4                      ; 5BDB   02BC 02E5
        MVII    #$0315, R5                      ; 5BDD   02BD 0315
        MVI@    R4,     R3                      ; 5BDF   02A3
        MVO@    R3,     R5                      ; 5BE0   026B
        MVI@    R4,     R3                      ; 5BE1   02A3
        MVO@    R3,     R5                      ; 5BE2   026B
        MVII    #$0002, R3                      ; 5BE3   02BB 0002
        MVII    #$02DD, R4                      ; 5BE5   02BC 02DD

        JSR     R5,     X_PRINT_R5              ; 5BE7   0004 0118 007B
        STRING  "Game Over Player "             ; 5BEA  
        DECLE   $0000                           ; 5BFB   0000

        MVI     G_0170, R0                      ; 5BFC   0280 0170
        INCR    R0                              ; 5BFE   0008
        MVII    #$0002, R3                      ; 5BFF   02BB 0002
        MVII    #$0001, R1                      ; 5C01   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 5C03   0004 0118 00C5

        MVII    #$0001, R0                      ; 5C06   02B8 0001

        JSR     R5,     L_5F3B                  ; 5C08   0004 015C 033B

        MVII    #$00FF, R0                      ; 5C0B   02B8 00FF
        MVO     R0,     G_01B4                  ; 5C0D   0240 01B4
        SDBD                                    ; 5C0F   0001
        MVII    #$1906, R0                      ; 5C10   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5C13   0240 035D
        MVII    #$0064, R0                      ; 5C15   02B8 0064
        MVO     R0,     G_035B                  ; 5C17   0240 035B
        MVO     R0,     G_034B                  ; 5C19   0240 034B

        JSR     R5,     .EXEC.A62               ; 5C1B   0004 0118 0262

        MVII    #$0012, R0                      ; 5C1E   02B8 0012
        MVII    #$02DD, R4                      ; 5C20   02BC 02DD

        JSR     R5,     X_FILL_ZERO             ; 5C22   0004 0114 0338

        MVII    #$02E5, R4                      ; 5C25   02BC 02E5
        MVII    #$0315, R5                      ; 5C27   02BD 0315
        MVI@    R5,     R3                      ; 5C29   02AB
        MVO@    R3,     R4                      ; 5C2A   0263
        MVI@    R5,     R3                      ; 5C2B   02AB
        MVO@    R3,     R4                      ; 5C2C   0263
        MVII    #$00FF, R0                      ; 5C2D   02B8 00FF
        MVO     R0,     G_01D1                  ; 5C2F   0240 01D1
L_5C31:
        CLRR    R0                              ; 5C31   01C0
        MVO     R0,     G_031E                  ; 5C32   0240 031E
        SDBD                                    ; 5C34   0001
        MVII    #$510C, R0                      ; 5C35   02B8 000C 0051
        MVO     R0,     G_035D                  ; 5C38   0240 035D
        MVI     G_01B1, R0                      ; 5C3A   0280 01B1
        CMPI    #$0001, R0                      ; 5C3C   0378 0001
        BEQ     L_5C79                          ; 5C3E   0204 0039

        MVI     G_0170, R0                      ; 5C40   0280 0170
        TSTR    R0                              ; 5C42   0080
        BNEQ    L_5C4B                          ; 5C43   020C 0006

        MVII    #$01A7, R4                      ; 5C45   02BC 01A7
        MVII    #$01AC, R5                      ; 5C47   02BD 01AC
        B       L_5C4F                          ; 5C49   0200 0004

L_5C4B:
        MVII    #$01AC, R4                      ; 5C4B   02BC 01AC
        MVII    #$01A7, R5                      ; 5C4D   02BD 01A7
L_5C4F:
        MVI     G_035C, R1                      ; 5C4F   0281 035C
        MVO@    R1,     R4                      ; 5C51   0261
        SWAP    R1,     1                       ; 5C52   0041
        MVO@    R1,     R4                      ; 5C53   0261
        MVI     G_01A1, R1                      ; 5C54   0281 01A1
        MVO@    R1,     R4                      ; 5C56   0261
        MVI     G_0199, R1                      ; 5C57   0281 0199
        MVO@    R1,     R4                      ; 5C59   0261
        MVI     G_01B2, R1                      ; 5C5A   0281 01B2
        MVO@    R1,     R4                      ; 5C5C   0261
        MVI@    R5,     R1                      ; 5C5D   02A9
        MVI@    R5,     R2                      ; 5C5E   02AA
        SWAP    R2,     1                       ; 5C5F   0042
        XORR    R2,     R1                      ; 5C60   01D1
        PSHR    R1                              ; 5C61   0271
        MVI@    R5,     R1                      ; 5C62   02A9
        MVO     R1,     G_01A1                  ; 5C63   0241 01A1
        MVO     R1,     G_01A0                  ; 5C65   0241 01A0
        MVI@    R5,     R1                      ; 5C67   02A9
        MVO     R1,     G_0199                  ; 5C68   0241 0199
        MVI@    R5,     R1                      ; 5C6A   02A9
        MVO     R1,     G_01B2                  ; 5C6B   0241 01B2
        MVI     G_0170, R0                      ; 5C6D   0280 0170
        INCR    R0                              ; 5C6F   0008
        ANDI    #$0001, R0                      ; 5C70   03B8 0001
        MVO     R0,     G_0170                  ; 5C72   0240 0170
        TSTR    R1                              ; 5C74   0089
        BEQ     L_5CB7                          ; 5C75   0204 0040
        B       L_5C85                          ; 5C77   0200 000C

L_5C79:
        MVI     G_035C, R1                      ; 5C79   0281 035C
        PSHR    R1                              ; 5C7B   0271
        MVI     G_01B2, R0                      ; 5C7C   0280 01B2
        TSTR    R0                              ; 5C7E   0080
        BEQ     L_5CB7                          ; 5C7F   0204 0036

        MVI     G_01A1, R0                      ; 5C81   0280 01A1
        MVO     R0,     G_01A0                  ; 5C83   0240 01A0
L_5C85:
        MVI     G_01A1, R0                      ; 5C85   0280 01A1

        JSR     R5,     X_CLAMP                 ; 5C87   0004 0114 0270
        DECLE   $0000                           ; 5C8A   0000

        INCR    R3                              ; 5C8B   000B
        MVO     R0,     G_01B9                  ; 5C8C   0240 01B9
        MVI     G_01B4, R0                      ; 5C8E   0280 01B4
        SWAP    R0,     1                       ; 5C90   0040

        JSR     R5,     L_5F3B                  ; 5C91   0004 015C 033B
        JSR     R5,     L_54FB                  ; 5C94   0004 0154 00FB

        CLRR    R0                              ; 5C97   01C0
        MVO     R0,     G_0178                  ; 5C98   0240 0178
        MVO     R0,     G_019B                  ; 5C9A   0240 019B
        MVII    #$00FF, R0                      ; 5C9C   02B8 00FF
        MVO     R0,     G_0179                  ; 5C9E   0240 0179

        JSR     R5,     L_6397                  ; 5CA0   0004 0160 0397

        PULR    R1                              ; 5CA3   02B1
        MVO     R1,     G_035C                  ; 5CA4   0241 035C
        MVO     R1,     G_0354                  ; 5CA6   0241 0354
        MVI     G_01A1, R1                      ; 5CA8   0281 01A1

        JSR     R5,     L_5A04                  ; 5CAA   0004 0158 0204
        JSR     R5,     L_5A66                  ; 5CAD   0004 0158 0266
        JSR     R5,     L_5AAD                  ; 5CB0   0004 0158 02AD
        JSR     R5,     L_641A                  ; 5CB3   0004 0164 001A

L_5CB6:
        PULR    R7                              ; 5CB6   02B7

L_5CB7:
        PULR    R1                              ; 5CB7   02B1
        MVI     G_01B1, R1                      ; 5CB8   0281 01B1
        CMPI    #$0001, R1                      ; 5CBA   0379 0001
        BEQ     L_5CC1                          ; 5CBC   0204 0003

        TSTR    R0                              ; 5CBE   0080
        BEQ     L_5C31                          ; 5CBF   0224 008F

L_5CC1:
        CLRR    R1                              ; 5CC1   01C9
        MVO     R1,     G_01B1                  ; 5CC2   0241 01B1
        MVO     R1,     G_0199                  ; 5CC4   0241 0199
        MVII    #$0008, R0                      ; 5CC6   02B8 0008
        SDBD                                    ; 5CC8   0001
        MVII    #$66A8, R1                      ; 5CC9   02B9 00A8 0066
        MVII    #$031D, R2                      ; 5CCC   02BA 031D

        JSR     R5,     X_INIT_MOBS             ; 5CCE   0004 0114 02B4
        JSR     R5,     .EXEC.A61               ; 5CD1   0004 0118 0261

        DECR    R4                              ; 5CD4   0014
        MVII    #$0008, R0                      ; 5CD5   02B8 0008
        MVO     R0,     G_0171                  ; 5CD7   0240 0171
        PULR    R7                              ; 5CD9   02B7

L_5CDA:
        PSHR    R5                              ; 5CDA   0275
        MVII    #$0005, R0                      ; 5CDB   02B8 0005
        MVO     R0,     G_0171                  ; 5CDD   0240 0171

        JSR     R5,     L_62FB                  ; 5CDF   0004 0160 02FB
        JSR     R5,     L_5CE9                  ; 5CE2   0004 015C 00E9
        JSR     R5,     L_6F97                  ; 5CE5   0004 016C 0397

        PULR    R7                              ; 5CE8   02B7

L_5CE9:
        PSHR    R5                              ; 5CE9   0275
        MVII    #$032B, R1                      ; 5CEA   02B9 032B
        MVII    #$0007, R0                      ; 5CEC   02B8 0007
L_5CEE:
        MVI@    R1,     R2                      ; 5CEE   028A
        ADDI    #$0078, R2                      ; 5CEF   02FA 0078
        MVO@    R2,     R1                      ; 5CF1   024A
        ADDI    #$0008, R1                      ; 5CF2   02F9 0008
        DECR    R0                              ; 5CF4   0010
        BNEQ    L_5CEE                          ; 5CF5   022C 0008
        PULR    R7                              ; 5CF7   02B7

L_5CF8:
        PSHR    R5                              ; 5CF8   0275
        DECLE   $0280,  $015E,  $03B8,  $00EF   ; 5CF9   0280 015E 03B8 00EF
        DECLE   $03F8,  $0010,  $0240,  $015E   ; 5CFD   03F8 0010 0240 015E
        DECLE   $0004,  $0174,  $005B,  $0004   ; 5D01   0004 0174 005B 0004
        DECLE   $0178,  $03E0,  $0280,  $015E   ; 5D05   0178 03E0 0280 015E
        DECLE   $03B8,  $0010,  $022C,  $000B   ; 5D09   03B8 0010 022C 000B

        PULR    R7                              ; 5D0D   02B7

        PSHR    R5                              ; 5D0E   0275
        MVI     G_0317, R3                      ; 5D0F   0283 0317
        DECR    R3                              ; 5D11   0013
        BEQ     L_5DD5                          ; 5D12   0204 00C1

        MVO     R3,     G_0317                  ; 5D14   0243 0317
        MVI     G_0184, R3                      ; 5D16   0283 0184
        ADD     G_01B7, R3                      ; 5D18   02C3 01B7
        MVO     R0,     G_01B7                  ; 5D1A   0240 01B7
        MVII    #$0001, R0                      ; 5D1C   02B8 0001
        MVO     R0,     G_032B                  ; 5D1E   0240 032B
        MVI     G_032C, R4                      ; 5D20   0284 032C
        MOVR    R4,     R2                      ; 5D22   00A2
        ANDI    #$000F, R2                      ; 5D23   03BA 000F
        CLRR    R0                              ; 5D25   01C0
        CLRR    R1                              ; 5D26   01C9
        TSTR    R2                              ; 5D27   0092
        BEQ     L_5D49                          ; 5D28   0204 001F

        CMPI    #$0001, R2                      ; 5D2A   037A 0001
        BNEQ    L_5D31                          ; 5D2C   020C 0003

        INCR    R1                              ; 5D2E   0009
        B       L_5D40                          ; 5D2F   0200 000F

L_5D31:
        CMPI    #$0002, R2                      ; 5D31   037A 0002
        BNEQ    L_5D38                          ; 5D33   020C 0003

        INCR    R0                              ; 5D35   0008
        B       L_5D40                          ; 5D36   0200 0008

L_5D38:
        CMPI    #$0004, R2                      ; 5D38   037A 0004
        BNEQ    L_5D3F                          ; 5D3A   020C 0003

        DECR    R1                              ; 5D3C   0011
        B       L_5D40                          ; 5D3D   0200 0001

L_5D3F:
        DECR    R0                              ; 5D3F   0010
L_5D40:
        TSTR    R4                              ; 5D40   00A4
        BMI     L_5D45                          ; 5D41   020B 0002

        SLL     R0,     1                       ; 5D43   0048
        SLL     R1,     1                       ; 5D44   0049
L_5D45:
        SDBD                                    ; 5D45   0001
        XORI    #$8000, R4                      ; 5D46   03FC 0000 0080
L_5D49:
        MVI     G_0327, R2                      ; 5D49   0282 0327
        SWAP    R2,     1                       ; 5D4B   0042
        ADDR    R0,     R2                      ; 5D4C   00C2
        ANDI    #$00FF, R2                      ; 5D4D   03BA 00FF
        MVO     R2,     G_01B5                  ; 5D4F   0242 01B5
        SWAP    R2,     1                       ; 5D51   0042
        MVO     R2,     G_0327                  ; 5D52   0242 0327
        MVO     R2,     G_032F                  ; 5D54   0242 032F
        NOP                                     ; 5D56   0034
        MVO     R2,     G_0337                  ; 5D57   0242 0337
        MVO     R2,     G_033F                  ; 5D59   0242 033F
        NOP                                     ; 5D5B   0034
        MVO     R2,     G_0347                  ; 5D5C   0242 0347
        MVI     G_0328, R2                      ; 5D5E   0282 0328
        SWAP    R2,     1                       ; 5D60   0042
        ADDR    R1,     R2                      ; 5D61   00CA
        ANDI    #$00FF, R2                      ; 5D62   03BA 00FF
        MVO     R2,     G_01B6                  ; 5D64   0242 01B6
        SWAP    R2,     1                       ; 5D66   0042
        MVO     R2,     G_0328                  ; 5D67   0242 0328
        MVO     R2,     G_0330                  ; 5D69   0242 0330
        NOP                                     ; 5D6B   0034
        MVO     R2,     G_0338                  ; 5D6C   0242 0338
        MVO     R2,     G_0340                  ; 5D6E   0242 0340
        NOP                                     ; 5D70   0034
        MVO     R2,     G_0348                  ; 5D71   0242 0348
        MVI     G_01B5, R0                      ; 5D73   0280 01B5
        MVI     G_01B6, R1                      ; 5D75   0281 01B6
        ANDI    #$0007, R0                      ; 5D77   03B8 0007
        BNEQ    L_5DBE                          ; 5D79   020C 0043

        ANDI    #$0007, R1                      ; 5D7B   03B9 0007
        BNEQ    L_5DBE                          ; 5D7D   020C 003F

        MVI     G_01B5, R1                      ; 5D7F   0281 01B5
        MVI     G_01B6, R2                      ; 5D81   0282 01B6
        PSHR    R4                              ; 5D83   0274
        SDBD                                    ; 5D84   0001
        MVII    #$FFF0, R0                      ; 5D85   02B8 00F0 00FF
        ADDR    R0,     R1                      ; 5D88   00C1
        ADDR    R0,     R2                      ; 5D89   00C2
        SLR     R1,     2                       ; 5D8A   0065
        DECR    R1                              ; 5D8B   0011
        SLR     R2,     2                       ; 5D8C   0066
        DECR    R2                              ; 5D8D   0012
        MVII    #$0004, R0                      ; 5D8E   02B8 0004

        JSR     R5,     X_RAND1                 ; 5D90   0004 0114 027D

        PSHR    R0                              ; 5D93   0270

        JSR     R5,     L_5157                  ; 5D94   0004 0150 0157

        PULR    R2                              ; 5D97   02B2
        PULR    R4                              ; 5D98   02B4
L_5D99:
        ADD     G_0183, R2                      ; 5D99   02C2 0183
        ADD     G_01B7, R2                      ; 5D9B   02C2 01B7
        PSHR    R4                              ; 5D9D   0274
        ANDI    #$0003, R2                      ; 5D9E   03BA 0003
        SLL     R2,     2                       ; 5DA0   004E
        SDBD                                    ; 5DA1   0001
        MVII    #$549B, R4                      ; 5DA2   02BC 009B 0054
        ADDR    R2,     R4                      ; 5DA5   00D4
        MVII    #$0004, R1                      ; 5DA6   02B9 0004
L_5DA8:
        MVI@    R4,     R2                      ; 5DA8   02A2
        ANDR    R0,     R2                      ; 5DA9   0182
        BNEQ    L_5DAF                          ; 5DAA   020C 0003

        DECR    R1                              ; 5DAC   0011
        BNEQ    L_5DA8                          ; 5DAD   022C 0006

L_5DAF:
        PULR    R4                              ; 5DAF   02B4
        MOVR    R4,     R3                      ; 5DB0   00A3
        ANDI    #$000F, R3                      ; 5DB1   03BB 000F
        XORR    R2,     R3                      ; 5DB3   01D3
        CMPI    #$0005, R3                      ; 5DB4   037B 0005
        BEQ     L_5DCD                          ; 5DB6   0204 0015

        CMPI    #$000A, R3                      ; 5DB8   037B 000A
        BEQ     L_5DCD                          ; 5DBA   0204 0011

L_5DBC:
        CLRR    R4                              ; 5DBC   01E4
        XORR    R2,     R4                      ; 5DBD   01D4
L_5DBE:
        MVO     R4,     G_032C                  ; 5DBE   0244 032C

        JSR     R5,     L_6056                  ; 5DC0   0004 0160 0056

        PULR    R7                              ; 5DC3   02B7

        MOVR    R4,     R2                      ; 5DC4   00A2
        ANDI    #$000F, R4                      ; 5DC5   03BC 000F
        ANDR    R0,     R2                      ; 5DC7   0182
        BNEQ    L_5DBE                          ; 5DC8   022C 000B

        MOVR    R0,     R2                      ; 5DCA   0082
        B       L_5DA8                          ; 5DCB   0220 0024

L_5DCD:
        MOVR    R2,     R3                      ; 5DCD   0093
        COMR    R3                              ; 5DCE   001B
        ANDR    R0,     R3                      ; 5DCF   0183
        BEQ     L_5DBC                          ; 5DD0   0224 0015

        MOVR    R3,     R0                      ; 5DD2   0098
        B       L_5D99                          ; 5DD3   0220 003B

L_5DD5:
        CLRR    R1                              ; 5DD5   01C9
        MVO     R1,     G_01BD                  ; 5DD6   0241 01BD

        JSR     R5,     L_6D97                  ; 5DD8   0004 016C 0197

L_5DDB:
        MVI     G_0354, R1                      ; 5DDB   0281 0354
        PSHR    R1                              ; 5DDD   0271
        MVI     G_035C, R1                      ; 5DDE   0281 035C
        PSHR    R1                              ; 5DE0   0271

        JSR     R5,     L_6397                  ; 5DE1   0004 0160 0397

        PULR    R1                              ; 5DE4   02B1
        MVO     R1,     G_035C                  ; 5DE5   0241 035C
        PULR    R1                              ; 5DE7   02B1
        MVO     R1,     G_0354                  ; 5DE8   0241 0354
        MVII    #$00FF, R1                      ; 5DEA   02B9 00FF
        MVO     R1,     G_0179                  ; 5DEC   0241 0179
        CLRR    R0                              ; 5DEE   01C0
        MVO     R0,     G_0178                  ; 5DEF   0240 0178
        MVO     R0,     G_019B                  ; 5DF1   0240 019B
        MVII    #$0001, R1                      ; 5DF3   02B9 0001

        JSR     R5,     L_54FB                  ; 5DF5   0004 0154 00FB

        PULR    R7                              ; 5DF8   02B7

L_5DF9:
        PSHR    R5                              ; 5DF9   0275
        SDBD                                    ; 5DFA   0001
        MVII    #$6658, R1                      ; 5DFB   02B9 0058 0066
        MVII    #$0325, R2                      ; 5DFE   02BA 0325
        MVII    #$0005, R0                      ; 5E00   02B8 0005

        JSR     R5,     X_INIT_MOBS             ; 5E02   0004 0114 02B4

        MVI     G_035C, R1                      ; 5E05   0281 035C
        ANDI    #$000F, R1                      ; 5E07   03B9 000F
        SLL     R1,     2                       ; 5E09   004D
        SLL     R1,     1                       ; 5E0A   0049
        ADDI    #$0018, R1                      ; 5E0B   02F9 0018
        SWAP    R1,     1                       ; 5E0D   0041
        MVO     R1,     G_0327                  ; 5E0E   0241 0327
        MVO     R1,     G_032F                  ; 5E10   0241 032F
        NOP                                     ; 5E12   0034
        MVO     R2,     G_0337                  ; 5E13   0242 0337
        MVO     R2,     G_033F                  ; 5E15   0242 033F
        NOP                                     ; 5E17   0034
        MVO     R2,     G_0347                  ; 5E18   0242 0347
        MVI     G_035C, R1                      ; 5E1A   0281 035C
        ANDI    #$0007, R1                      ; 5E1C   03B9 0007
        SLL     R1,     2                       ; 5E1E   004D
        SLL     R1,     1                       ; 5E1F   0049
        ADDI    #$0018, R1                      ; 5E20   02F9 0018
        SWAP    R1,     1                       ; 5E22   0041
        MVO     R1,     G_0328                  ; 5E23   0241 0328
        MVO     R1,     G_0330                  ; 5E25   0241 0330
        NOP                                     ; 5E27   0034
        MVO     R2,     G_0338                  ; 5E28   0242 0338
        MVO     R2,     G_0340                  ; 5E2A   0242 0340
        NOP                                     ; 5E2C   0034
        MVO     R2,     G_0348                  ; 5E2D   0242 0348
        CLRR    R1                              ; 5E2F   01C9
        MVO     R1,     G_032C                  ; 5E30   0241 032C
        INCR    R1                              ; 5E32   0009
        MVO     R1,     G_032B                  ; 5E33   0241 032B
        MVII    #$0325, R1                      ; 5E35   02B9 0325
        SDBD                                    ; 5E37   0001
        MVII    #$1000, R2                      ; 5E38   02BA 0000 0010
L_5E3B:
        MVI@    R1,     R3                      ; 5E3B   028B
        XORR    R2,     R3                      ; 5E3C   01D3
        MVO@    R3,     R1                      ; 5E3D   024B
        ADDI    #$0008, R1                      ; 5E3E   02F9 0008
        CMPI    #$034D, R1                      ; 5E40   0379 034D
        BNEQ    L_5E3B                          ; 5E42   022C 0008
        PULR    R7                              ; 5E44   02B7

        PSHR    R5                              ; 5E45   0275

        JSR     R5,     L_6041                  ; 5E46   0004 0160 0041

        MVI     G_0199, R1                      ; 5E49   0281 0199
        INCR    R1                              ; 5E4B   0009
        MVO     R1,     G_0199                  ; 5E4C   0241 0199
        CLRR    R1                              ; 5E4E   01C9
        MVO     R1,     G_019D                  ; 5E4F   0241 019D

        JSR     R5,     L_5AAD                  ; 5E51   0004 0158 02AD

        B       L_5DDB                          ; 5E54   0220 007A

L_5E56:
        MVII    #$0004, R0                      ; 5E56   02B8 0004
        B       L_5E64                          ; 5E58   0200 000A

L_5E5A:
        MVII    #$0002, R0                      ; 5E5A   02B8 0002
        B       L_5E64                          ; 5E5C   0200 0006

L_5E5E:
        MVII    #$0001, R0                      ; 5E5E   02B8 0001
        B       L_5E64                          ; 5E60   0200 0002

L_5E62:
        MVII    #$0008, R0                      ; 5E62   02B8 0008
L_5E64:
        XOR     G_01BA, R0                      ; 5E64   03C0 01BA
        MVO     R0,     G_01BA                  ; 5E66   0240 01BA
L_5E68:
        MOVR    R5,     R7                      ; 5E68   00AF

L_5E69:
        MVI     G_0171, R0                      ; 5E69   0280 0171
        TSTR    R0                              ; 5E6B   0080
        BEQ     L_5E68                          ; 5E6C   0224 0005

        MVI     G_0146, R0                      ; 5E6E   0280 0146
        CMPI    #$0014, R0                      ; 5E70   0378 0014
        BEQ     L_5E68                          ; 5E72   0224 000B

        MVII    #$0008, R0                      ; 5E74   02B8 0008
        MVII    #$0003, R1                      ; 5E76   02B9 0003
L_5E78:
        MOVR    R0,     R2                      ; 5E78   0082
        AND     G_01BA, R2                      ; 5E79   0382 01BA
        BNEQ    L_5E82                          ; 5E7B   020C 0005

        SLR     R0,     1                       ; 5E7D   0060
        DECR    R1                              ; 5E7E   0011
        BPL     L_5E78                          ; 5E7F   0223 0008
        MOVR    R5,     R7                      ; 5E81   00AF

L_5E82:
        XOR     G_01BA, R0                      ; 5E82   03C0 01BA
        MVO     R0,     G_01BA                  ; 5E84   0240 01BA
        CLRR    R0                              ; 5E86   01C0
        MVO     R0,     G_01CD                  ; 5E87   0240 01CD
        INCR    R1                              ; 5E89   0009
        ADDR    R7,     R1                      ; 5E8A   00F9
        ADD@    R1,     R7                      ; 5E8B   02CF

        DECLE   $0048,  $0026,  $0004           ; 5E8C   0048 0026 0004

        SLR     R2,     2                       ; 5E8F   0066
        PSHR    R5                              ; 5E90   0275

        JSR     R5,     X_PLAY_SFX2             ; 5E91   0004 0118 03BE
        DECLE   $0014                           ; 5E94  SFX prio
        DECLE   $0399                           ; 5E95  SFX data
        DECLE   $02C8,  $015E                   ; 5E96  SFX data
        DECLE   $02C4,  $014D                   ; 5E98  SFX data
        DECLE   $0001,  $02FF                   ; 5E9A  SFX data
        DECLE   $005A                           ; 5E9C  SFX data
        DECLE   $0056                           ; 5E9D  SFX data
        DECLE   $00AB                           ; 5E9E  SFX data
        DECLE   $03C8,  $006F                   ; 5E9F  SFX data
        DECLE   $03C4,  $006D                   ; 5EA1  SFX data
        DECLE   $03EA                           ; 5EA3  SFX data
        DECLE   $03E6                           ; 5EA4  SFX data
        DECLE   $0001,  $00B7                   ; 5EA5  SFX data
        DECLE   $006B                           ; 5EA7  SFX data
        DECLE   $0001,  $039F                   ; 5EA8  SFX data
        DECLE   $03CA                           ; 5EAA  SFX data
        DECLE   $03C6                           ; 5EAB  SFX data
        DECLE   $008F,  $001D                   ; 5EAC  SFX data
        DECLE   $00CF                           ; 5EAE  SFX end


        J       L_6DD6                          ; 5EAF   0004 036C 01D6

        PSHR    R5                              ; 5EB2   0275

        JSR     R5,     X_PLAY_SFX2             ; 5EB3   0004 0118 03BE
        DECLE   $0014                           ; 5EB6  SFX prio
        DECLE   $0399                           ; 5EB7  SFX data
        DECLE   $02C8,  $0096                   ; 5EB8  SFX data
        DECLE   $02C4,  $0085                   ; 5EBA  SFX data
        DECLE   $0001,  $0107                   ; 5EBC  SFX data
        DECLE   $005A                           ; 5EBE  SFX data
        DECLE   $0056                           ; 5EBF  SFX data
        DECLE   $00AB                           ; 5EC0  SFX data
        DECLE   $03C8,  $00D3                   ; 5EC1  SFX data
        DECLE   $03C4,  $00D1                   ; 5EC3  SFX data
        DECLE   $03EA                           ; 5EC5  SFX data
        DECLE   $03E6                           ; 5EC6  SFX data
        DECLE   $0001,  $034F                   ; 5EC7  SFX data
        DECLE   $006B                           ; 5EC9  SFX data
        DECLE   $0001,  $007B                   ; 5ECA  SFX data
        DECLE   $03CA                           ; 5ECC  SFX data
        DECLE   $03C6                           ; 5ECD  SFX data
        DECLE   $008F,  $001D                   ; 5ECE  SFX data
        DECLE   $00CF                           ; 5ED0  SFX end


        J       L_6DD6                          ; 5ED1   0004 036C 01D6

        PSHR    R5                              ; 5ED4   0275

        JSR     R5,     X_PLAY_SFX2             ; 5ED5   0004 0118 03BE
        DECLE   $0014                           ; 5ED8  SFX prio
        DECLE   $0399                           ; 5ED9  SFX data
        DECLE   $02C8,  $0096                   ; 5EDA  SFX data
        DECLE   $02C4,  $0085                   ; 5EDC  SFX data
        DECLE   $0001,  $0107                   ; 5EDE  SFX data
        DECLE   $005A                           ; 5EE0  SFX data
        DECLE   $0056                           ; 5EE1  SFX data
        DECLE   $00AB                           ; 5EE2  SFX data
        DECLE   $03C8,  $0137                   ; 5EE3  SFX data
        DECLE   $03C4,  $0135                   ; 5EE5  SFX data
        DECLE   $03EA                           ; 5EE7  SFX data
        DECLE   $03E6                           ; 5EE8  SFX data
        DECLE   $0001,  $034F                   ; 5EE9  SFX data
        DECLE   $006B                           ; 5EEB  SFX data
        DECLE   $0001,  $0067                   ; 5EEC  SFX data
        DECLE   $03EE                           ; 5EEE  SFX data
        DECLE   $008F,  $001D                   ; 5EEF  SFX data
        DECLE   $02CF                           ; 5EF1  SFX end


        PSHR    R5                              ; 5EF2   0275
        MVII    #$0002, R0                      ; 5EF3   02B8 0002
        MVO     R0,     G_01CD                  ; 5EF5   0240 01CD

        JSR     R5,     X_PLAY_SFX2             ; 5EF7   0004 0118 03BE
        DECLE   $0014                           ; 5EFA  SFX prio
        DECLE   $0079                           ; 5EFB  SFX data
        DECLE   $028D                           ; 5EFC  SFX data
        DECLE   $000F,  $03FA                   ; 5EFD  SFX data
        DECLE   $03B7                           ; 5EFF  SFX data
        DECLE   $001C,  $01DC                   ; 5F00  SFX data
        DECLE   $000B                           ; 5F02  SFX data
        DECLE   $03AB                           ; 5F03  SFX data
        DECLE   $010B                           ; 5F04  SFX data
        DECLE   $006B                           ; 5F05  SFX data
        DECLE   $00CF                           ; 5F06  SFX end


        J       L_6DD6                          ; 5F07   0004 036C 01D6

L_5F0A:
        PSHR    R5                              ; 5F0A   0275
        MVI     G_01B8, R0                      ; 5F0B   0280 01B8
        INCR    R0                              ; 5F0D   0008
        ANDI    #$001F, R0                      ; 5F0E   03B8 001F
        MVO     R0,     G_01B8                  ; 5F10   0240 01B8
        CMPI    #$0001, R0                      ; 5F12   0378 0001
        BEQ     L_5F17                          ; 5F14   0204 0001
        PULR    R7                              ; 5F16   02B7

L_5F17:
        CLRR    R0                              ; 5F17   01C0
        MVO     R0,     G_01CD                  ; 5F18   0240 01CD

        JSR     R5,     X_PLAY_MUS2             ; 5F1A   0004 0118 035D
        DECLE   $0022                           ; 5F1D  Note (short)
        DECLE   $000A                           ; 5F1E  Note (short)
        DECLE   $0052                           ; 5F1F  Note (short)
        DECLE   $000A                           ; 5F20  Note (short)
        DECLE   $0092                           ; 5F21  Note (short)
        DECLE   $000A                           ; 5F22  Note (short)
        DECLE   $00E2                           ; 5F23  Note (short)
        DECLE   $000A                           ; 5F24  Note (short)
        DECLE   $00A0                           ; 5F25  Note (short)
        DECLE   $0090                           ; 5F26  Note (short)
        DECLE   $00A0                           ; 5F27  Note (short)
        DECLE   $0090                           ; 5F28  Note (short)
        DECLE   $00A0                           ; 5F29  Note (short)
        DECLE   $0090                           ; 5F2A  Note (short)
        DECLE   $00A0                           ; 5F2B  Note (short)
        DECLE   $0090                           ; 5F2C  Note (short)
        DECLE   $00A0                           ; 5F2D  Note (short)
        DECLE   $0090                           ; 5F2E  Note (short)
        DECLE   $00A0                           ; 5F2F  Note (short)
        DECLE   $0098                           ; 5F30  Note (short)
        DECLE   $009A                           ; 5F31  Note (short)
        DECLE   $007A                           ; 5F32  Note (short)
        DECLE   $005A                           ; 5F33  Note (short)
        DECLE   $004A                           ; 5F34  Note (short)
        DECLE   $03F6,  $000D                   ; 5F35  Note (long)
        DECLE   $0000                           ; 5F37  End of music

        J       L_6DD6                          ; 5F38   0004 036C 01D6

L_5F3B:
        PSHR    R5                              ; 5F3B   0275
        DECLE   $01C9,  $0241,  $01CD,  $0281   ; 5F3C   01C9 0241 01CD 0281
        DECLE   $01B9,  $0009,  $02BA,  $015A   ; 5F40   01B9 0009 02BA 015A
        DECLE   $0251,  $0080,  $0203,  $0007   ; 5F44   0251 0080 0203 0007
        DECLE   $0004,  $0118,  $03BE           ; 5F48   0004 0118 03BE
        DECLE   $0082                           ; 5F4B  SFX prio
        DECLE   $001D                           ; 5F4C  SFX data
        DECLE   $0003,  $01B4                   ; 5F4D  SFX data
        DECLE   $0004,  $0118                   ; 5F4F  SFX data
        DECLE   $03BE                           ; 5F51  SFX data
        DECLE   $0052                           ; 5F52  SFX data
        DECLE   $024F,  $000A                   ; 5F53  SFX data
        DECLE   $0389                           ; 5F55  SFX data
        DECLE   $03C0,  $003C                   ; 5F56  SFX data
        DECLE   $03C8,  $009B                   ; 5F58  SFX data
        DECLE   $03C4,  $0190                   ; 5F5A  SFX data
        DECLE   $020E                           ; 5F5C  SFX data
        DECLE   $0001,  $007F                   ; 5F5D  SFX data
        DECLE   $002B                           ; 5F5F  SFX data
        DECLE   $0001,  $007F                   ; 5F60  SFX data
        DECLE   $01FE                           ; 5F62  SFX data
        DECLE   $0023,  $03DD                   ; 5F63  SFX data
        DECLE   $0003,  $0154                   ; 5F65  SFX data
        DECLE   $0389                           ; 5F67  SFX data
        DECLE   $0380,  $0140                   ; 5F68  SFX data
        DECLE   $0348,  $021B                   ; 5F6A  SFX data
        DECLE   $0354,  $02AF                   ; 5F6C  SFX data
        DECLE   $008F,  $001D                   ; 5F6E  SFX data
        DECLE   $0005                           ; 5F70  SFX data
        DECLE   $006B                           ; 5F71  SFX data
        DECLE   $0380,  $0140                   ; 5F72  SFX data
        DECLE   $008F,  $0015                   ; 5F74  SFX data
        DECLE   $0005                           ; 5F76  SFX data
        DECLE   $006B                           ; 5F77  SFX data
        DECLE   $0380,  $0140                   ; 5F78  SFX data
        DECLE   $016B                           ; 5F7A  SFX data
        DECLE   $0035                           ; 5F7B  SFX data
        DECLE   $006B                           ; 5F7C  SFX data
        DECLE   $0380,  $0140                   ; 5F7D  SFX data
        DECLE   $0348,  $021B                   ; 5F7F  SFX data
        DECLE   $0354,  $024E                   ; 5F81  SFX data
        DECLE   $008F,  $001D                   ; 5F83  SFX data
        DECLE   $0005                           ; 5F85  SFX data
        DECLE   $006B                           ; 5F86  SFX data
        DECLE   $0380,  $010D                   ; 5F87  SFX data
        DECLE   $008F,  $0015                   ; 5F89  SFX data
        DECLE   $0005                           ; 5F8B  SFX data
        DECLE   $006B                           ; 5F8C  SFX data
        DECLE   $0380,  $011D                   ; 5F8D  SFX data
        DECLE   $016B                           ; 5F8F  SFX data
        DECLE   $0035                           ; 5F90  SFX data
        DECLE   $006B                           ; 5F91  SFX data
        DECLE   $0380,  $011D                   ; 5F92  SFX data
        DECLE   $0348,  $021B                   ; 5F94  SFX data
        DECLE   $0354,  $01F4                   ; 5F96  SFX data
        DECLE   $008F,  $0015                   ; 5F98  SFX data
        DECLE   $0005                           ; 5F9A  SFX data
        DECLE   $006B                           ; 5F9B  SFX data
        DECLE   $0380,  $0140                   ; 5F9C  SFX data
        DECLE   $016B                           ; 5F9E  SFX data
        DECLE   $0035                           ; 5F9F  SFX data
        DECLE   $006B                           ; 5FA0  SFX data
        DECLE   $0380,  $0140                   ; 5FA1  SFX data
        DECLE   $0348,  $021B                   ; 5FA3  SFX data
        DECLE   $0354,  $02AE                   ; 5FA5  SFX data
        DECLE   $008F,  $0015                   ; 5FA7  SFX data
        DECLE   $0005                           ; 5FA9  SFX data
        DECLE   $006B                           ; 5FAA  SFX data
        DECLE   $0380,  $0153                   ; 5FAB  SFX data
        DECLE   $016B                           ; 5FAD  SFX data
        DECLE   $0035                           ; 5FAE  SFX data
        DECLE   $006B                           ; 5FAF  SFX data
        DECLE   $0380,  $0140                   ; 5FB0  SFX data
        DECLE   $0348,  $021B                   ; 5FB2  SFX data
        DECLE   $0364,  $0202                   ; 5FB4  SFX data
        DECLE   $008F,  $003D                   ; 5FB6  SFX data
        DECLE   $0035                           ; 5FB8  SFX data
        DECLE   $006B                           ; 5FB9  SFX data
        DECLE   $03F9                           ; 5FBA  SFX data
        DECLE   $02CF                           ; 5FBB  SFX end

        DECLE   $0035,  $008F,  $0027,  $0389   ; 5FBC   0035 008F 0027 0389
        DECLE   $03C0,  $00D2,  $03C8,  $015E   ; 5FC0   03C0 00D2 03C8 015E
        DECLE   $03C4,  $02E9,  $0021,  $0007   ; 5FC4   03C4 02E9 0021 0007
        DECLE   $03FE,  $00AB,  $0001           ; 5FC8   03FE 00AB 0001

        DIS                                     ; 5FCB   0003
        XORI    #$03F6, R2                      ; 5FCC   03FA 03F6
        MOVR    R1,     R7                      ; 5FCE   008F

        DECLE   $0013,  $03FE,  $008F,  $001F   ; 5FCF   0013 03FE 008F 001F

        DIS                                     ; 5FD3   0003
        AND@    R5,     R6                      ; 5FD4   03AE
        SUBR    R5,     R3                      ; 5FD5   012B
        ADDR    R1,     R7                      ; 5FD6   00CF

        MVII    #$00FF, R1                      ; 5FD7   02B9 00FF
        MVO     R1,     G_01B9                  ; 5FD9   0241 01B9
        PULR    R7                              ; 5FDB   02B7

L_5FDC:
        PSHR    R5                              ; 5FDC   0275

        JSR     R5,     .EXEC.7C1               ; 5FDD   0004 0114 03C1

        MVII    #$0001, R0                      ; 5FE0   02B8 0001
        MVO     R0,     G_01CD                  ; 5FE2   0240 01CD

        JSR     R5,     X_PLAY_SFX2             ; 5FE4   0004 0118 03BE
        DECLE   $0090                           ; 5FE7  SFX prio
        DECLE   $03DD                           ; 5FE8  SFX data
        DECLE   $03B9                           ; 5FE9  SFX data
        DECLE   $03C4,  $0073                   ; 5FEA  SFX data
        DECLE   $03D6                           ; 5FEC  SFX data
        DECLE   $0103,  $03EE                   ; 5FED  SFX data
        DECLE   $026B                           ; 5FEF  SFX data
        DECLE   $02CF                           ; 5FF0  SFX end

L_5FF1:
        PSHR    R5                              ; 5FF1   0275
        MVII    #$0006, R0                      ; 5FF2   02B8 0006
        SDBD                                    ; 5FF4   0001
        MVII    #$1918, R1                      ; 5FF5   02B9 0018 0019
        SDBD                                    ; 5FF8   0001
        MVII    #$6011, R5                      ; 5FF9   02BD 0011 0060
L_5FFC:
        MVI@    R5,     R2                      ; 5FFC   02AA
        MVO@    R1,     R2                      ; 5FFD   0251
        ADDI    #$0008, R1                      ; 5FFE   02F9 0008
        DECR    R0                              ; 6000   0010
        BNEQ    L_5FFC                          ; 6001   022C 0006

        MVII    #$000E, R0                      ; 6003   02B8 000E
        SDBD                                    ; 6005   0001
        MVII    #$6017, R5                      ; 6006   02BD 0017 0060
L_6009:
        MVI@    R5,     R1                      ; 6009   02A9
        SDBD                                    ; 600A   0001
        MVI@    R5,     R2                      ; 600B   02AA
        MVO@    R2,     R1                      ; 600C   024A
        DECR    R0                              ; 600D   0010
        BNEQ    L_6009                          ; 600E   022C 0006
        PULR    R7                              ; 6010   02B7

        MVI@    R3,     R6                      ; 6011   029E
        MVI@    R3,     R7                      ; 6012   029F

        DECLE   $02B2,  $02B3,  $02C6,  $02C7   ; 6013   02B2 02B3 02C6 02C7
        DECLE   $0214,  $0075,  $0009,  $0228   ; 6017   0214 0075 0009 0228
        DECLE   $007D,  $0009,  $0229,  $006D   ; 601B   007D 0009 0229 006D
        DECLE   $0009,  $023C,  $007D,  $0009   ; 601F   0009 023C 007D 0009
        DECLE   $0250,  $0065,  $0029,  $0251   ; 6023   0250 0065 0029 0251
        DECLE   $0075,  $0029,  $0264,  $0065   ; 6027   0075 0029 0264 0065
        DECLE   $0029,  $0265,  $006D,  $0029   ; 602B   0029 0265 006D 0029
        DECLE   $0278,  $005B,  $0019,  $0279   ; 602F   0278 005B 0019 0279

        SAR     R1,     2                       ; 6033   006D
        INCR    R1                              ; 6034   0009
        MVI@    R1,     R4                      ; 6035   028C
        RLC     R3,     1                       ; 6036   0053
        COMR    R1                              ; 6037   0019
        MVI@    R1,     R5                      ; 6038   028D
        RRC     R1,     2                       ; 6039   0075
        INCR    R1                              ; 603A   0009
        MVI@    R4,     R0                      ; 603B   02A0
        RLC     R3,     1                       ; 603C   0053
        COMR    R1                              ; 603D   0019
        PULR    R4                              ; 603E   02B4
        SLL     R3,     1                       ; 603F   004B
        COMR    R1                              ; 6040   0019
L_6041:
        PSHR    R5                              ; 6041   0275
        CLRR    R0                              ; 6042   01C0
        MVO     R0,     G_01BD                  ; 6043   0240 01BD
        MVO     R0,     G_01CD                  ; 6045   0240 01CD

        JSR     R5,     X_PLAY_SFX2             ; 6047   0004 0118 03BE
        DECLE   $0052                           ; 604A  SFX prio
        DECLE   $0035                           ; 604B  SFX data
        DECLE   $006B                           ; 604C  SFX data
        DECLE   $00FD                           ; 604D  SFX data
        DECLE   $0077,  $0051,  $0060           ; 604E  SFX data
UC_6051:
        SDBD                                    ; 6051  SLIB UCALL target
        MVII    #$6159, R4                      ; 6052   02BC 0059 0061
        PULR    R7                              ; 6055   02B7

L_6056:
        PSHR    R5                              ; 6056   0275
        CLRR    R0                              ; 6057   01C0
        MVO     R0,     G_01CD                  ; 6058   0240 01CD

        JSR     R5,     X_PLAY_SFX2             ; 605A   0004 0118 03BE
        DECLE   $0015                           ; 605D  SFX prio
        DECLE   $007D,  $0389,  $015D,  $0340   ; 605E   007D 0389 015D 0340
        DECLE   $00E2,  $0008,  $0000,  $0004   ; 6062   00E2 0008 0000 0004
        DECLE   $0000,  $00EB,  $0005,  $006B   ; 6066   0000 00EB 0005 006B
        DECLE   $0340,  $00FE,  $00EB,  $0005   ; 606A   0340 00FE 00EB 0005
        DECLE   $006B,  $0340,  $00E2,  $00EB   ; 606E   006B 0340 00E2 00EB
        DECLE   $0005,  $006B,  $0340,  $00FE   ; 6072   0005 006B 0340 00FE
        DECLE   $00EB,  $0035,  $006B,  $0340   ; 6076   00EB 0035 006B 0340
        DECLE   $00D7,  $0008,  $0000,  $0344   ; 607A   00D7 0008 0000 0344
        DECLE   $03F9,  $026B,  $0035,  $006B   ; 607E   03F9 026B 0035 006B
        DECLE   $0000,  $0000,  $0348,  $01AC   ; 6082   0000 0000 0348 01AC
        DECLE   $0344,  $01FC,  $026B,  $0035   ; 6086   0344 01FC 026B 0035
        DECLE   $006B,  $0340,  $00BE,  $0348   ; 608A   006B 0340 00BE 0348
        DECLE   $01AC,  $0344,  $01FC,  $00EB   ; 608E   01AC 0344 01FC 00EB
        DECLE   $0005,  $006B,  $0340,  $00D7   ; 6092   0005 006B 0340 00D7
        DECLE   $00EB,  $0035,  $006B,  $0340   ; 6096   00EB 0035 006B 0340
        DECLE   $00E2,  $0348,  $01AC,  $0344   ; 609A   00E2 0348 01AC 0344
        DECLE   $01FC,  $00EB,  $0005,  $006B   ; 609E   01FC 00EB 0005 006B
        DECLE   $0340,  $00D7,  $00EB,  $0035   ; 60A2   0340 00D7 00EB 0035
        DECLE   $006B,  $0340,  $00AA,  $0008   ; 60A6   006B 0340 00AA 0008
        DECLE   $0000,  $0344,  $03F9,  $026B   ; 60AA   0000 0344 03F9 026B
        DECLE   $0035,  $006B,  $0000,  $0000   ; 60AE   0035 006B 0000 0000
        DECLE   $0348,  $01AC,  $0344,  $01FC   ; 60B2   0348 01AC 0344 01FC
        DECLE   $026B,  $0035,  $006B,  $0340   ; 60B6   026B 0035 006B 0340
        DECLE   $00AA,  $0348,  $01AC,  $0344   ; 60BA   00AA 0348 01AC 0344
        DECLE   $01FC,  $00EB,  $0005,  $006B   ; 60BE   01FC 00EB 0005 006B
        DECLE   $0340,  $00A0,  $00EB,  $0035   ; 60C2   0340 00A0 00EB 0035
        DECLE   $006B,  $0340,  $00B4,  $0348   ; 60C6   006B 0340 00B4 0348
        DECLE   $01AC,  $0344,  $01FC,  $00EB   ; 60CA   01AC 0344 01FC 00EB
        DECLE   $0005,  $006B,  $0340,  $00AA   ; 60CE   0005 006B 0340 00AA
        DECLE   $00EB,  $0035,  $006B,  $0340   ; 60D2   00EB 0035 006B 0340
        DECLE   $0071,  $0008,  $0000,  $0344   ; 60D6   0071 0008 0000 0344
        DECLE   $03F9,  $00EB,  $0005,  $006B   ; 60DA   03F9 00EB 0005 006B
        DECLE   $0340,  $0078,  $00EB,  $0035   ; 60DE   0340 0078 00EB 0035
        DECLE   $006B,  $0340,  $007F,  $0348   ; 60E2   006B 0340 007F 0348
        DECLE   $01AC,  $0344,  $02A7,  $00EB   ; 60E6   01AC 0344 02A7 00EB
        DECLE   $0005,  $006B,  $0340,  $0078   ; 60EA   0005 006B 0340 0078
        DECLE   $00EB,  $0035,  $006B,  $0380   ; 60EE   00EB 0035 006B 0380
        DECLE   $0071,  $0008,  $0000,  $0344   ; 60F2   0071 0008 0000 0344
        DECLE   $03F9,  $00EB,  $0005,  $006B   ; 60F6   03F9 00EB 0005 006B
        DECLE   $0380,  $007F,  $00EB,  $0035   ; 60FA   0380 007F 00EB 0035
        DECLE   $006B,  $0380,  $0078,  $0348   ; 60FE   006B 0380 0078 0348
        DECLE   $01AC,  $0344,  $02A7,  $00EB   ; 6102   01AC 0344 02A7 00EB
        DECLE   $0005,  $006B,  $0380,  $0071   ; 6106   0005 006B 0380 0071
        DECLE   $00EB,  $0035,  $006B,  $0380   ; 610A   00EB 0035 006B 0380
        DECLE   $006B,  $0008,  $0000,  $0344   ; 610E   006B 0008 0000 0344
        DECLE   $03F9,  $026B,  $0035,  $006B   ; 6112   03F9 026B 0035 006B
        DECLE   $0000,  $0000,  $0348,  $01AC   ; 6116   0000 0000 0348 01AC
        DECLE   $0344,  $02A7,  $026B,  $0035   ; 611A   0344 02A7 026B 0035
        DECLE   $006B,  $0380,  $007F,  $0348   ; 611E   006B 0380 007F 0348
        DECLE   $01AC,  $0344,  $02A7,  $026B   ; 6122   01AC 0344 02A7 026B
        DECLE   $0035,  $006B,  $0380,  $006B   ; 6126   0035 006B 0380 006B
        DECLE   $0348,  $01AC,  $0344,  $02A7   ; 612A   0348 01AC 0344 02A7
        DECLE   $026B,  $0380,  $007F,  $0025   ; 612E   026B 0380 007F 0025
        DECLE   $0015,  $006B,  $03C0,  $0071   ; 6132   0015 006B 03C0 0071
        DECLE   $0008,  $0000,  $0344,  $02A7   ; 6136   0008 0000 0344 02A7
        DECLE   $026B,  $0035,  $006B,  $03C0   ; 613A   026B 0035 006B 03C0
        DECLE   $007F,  $0308,  $0153,  $0344   ; 613E   007F 0308 0153 0344
        DECLE   $023B,  $026B,  $0035,  $006B   ; 6142   023B 026B 0035 006B
        DECLE   $03C0,  $008F,  $0308,  $0153   ; 6146   03C0 008F 0308 0153
        DECLE   $0344,  $023B,  $026B,  $0035   ; 614A   0344 023B 026B 0035
        DECLE   $006B,  $03C0,  $007F,  $0308   ; 614E   006B 03C0 007F 0308
        DECLE   $0153,  $0344,  $023B,  $01EB   ; 6152   0153 0344 023B 01EB
        DECLE   $0005,  $0043,  $035A,  $0389   ; 6156   0005 0043 035A 0389
        DECLE   $0380,  $007F,  $0025,  $0015   ; 615A   0380 007F 0025 0015
        DECLE   $006B,  $0380,  $0071,  $0008   ; 615E   006B 0380 0071 0008
        DECLE   $0000,  $0344,  $02A7,  $026B   ; 6162   0000 0344 02A7 026B
        DECLE   $0035,  $006B,  $0380,  $007F   ; 6166   0035 006B 0380 007F
        DECLE   $0308,  $0153,  $0344,  $023B   ; 616A   0308 0153 0344 023B
        DECLE   $026B,  $0035,  $006B,  $0340   ; 616E   026B 0035 006B 0340
        DECLE   $008F,  $0008,  $0000,  $0344   ; 6172   008F 0008 0000 0344
        DECLE   $038A,  $026B,  $0035,  $006B   ; 6176   038A 026B 0035 006B
        DECLE   $0340,  $0097,  $0348,  $0168   ; 617A   0340 0097 0348 0168
        DECLE   $0344,  $025D,  $026B,  $0035   ; 617E   0344 025D 026B 0035
        DECLE   $006B,  $0340,  $00AA,  $0008   ; 6182   006B 0340 00AA 0008
        DECLE   $0000,  $0344,  $02A7,  $026B   ; 6186   0000 0344 02A7 026B
        DECLE   $0005,  $0015,  $006B,  $0000   ; 618A   0005 0015 006B 0000
        DECLE   $0000,  $0004,  $0000,  $026B   ; 618E   0000 0004 0000 026B
        DECLE   $0003,  $0023,  $0035           ; 6192   0003 0023 0035

        MOVR    R1,     R7                      ; 6195   008F

        COMR    R5                              ; 6196   001D
        ADDR    R1,     R7                      ; 6197   00CF

        JSR     R5,     L_6DA2                  ; 6198   0004 016C 01A2

        PULR    R7                              ; 619B   02B7

        RRC     R3,     2                       ; 619C   0077
        MOVR    R3,     R7                      ; 619D   009F

        SLR     R1,     1                       ; 619E   0061
        MVII    #$0003, R0                      ; 619F   02B8 0003

        JSR     R5,     X_RAND2                 ; 61A1   0004 0114 029E

        MVO     R0,     G_01BD                  ; 61A4   0240 01BD
        SDBD                                    ; 61A6   0001
        MVII    #$6060, R4                      ; 61A7   02BC 0060 0060
        PULR    R7                              ; 61AA   02B7

.GFX_LIST_61AB:
        DECLE   $003C,  $007E,  $0066,  $0066   ; 61AB  CART PIC #00
        DECLE   $0066,  $007E,  $003C,  $0000   ; 61AF  
        DECLE   $0018,  $0038,  $0018,  $0018   ; 61B3  CART PIC #01
        DECLE   $0018,  $003C,  $003C,  $0000   ; 61B7  
        DECLE   $007C,  $007E,  $0006,  $003C   ; 61BB  CART PIC #02
        DECLE   $0060,  $007E,  $003E,  $0000   ; 61BF  
        DECLE   $003C,  $007E,  $0066,  $000E   ; 61C3  CART PIC #03
        DECLE   $0066,  $007E,  $003C,  $0000   ; 61C7  
        DECLE   $000E,  $001E,  $0036,  $0066   ; 61CB  CART PIC #04
        DECLE   $007E,  $0006,  $0006,  $0000   ; 61CF  
        DECLE   $007E,  $007E,  $0060,  $007E   ; 61D3  CART PIC #05
        DECLE   $0006,  $007E,  $007C,  $0000   ; 61D7  
        DECLE   $003C,  $007E,  $0060,  $007C   ; 61DB  CART PIC #06
        DECLE   $0066,  $007E,  $003C,  $0000   ; 61DF  
        DECLE   $007E,  $007E,  $0066,  $000C   ; 61E3  CART PIC #07
        DECLE   $0018,  $0018,  $0018,  $0000   ; 61E7  
        DECLE   $003C,  $007E,  $0066,  $003C   ; 61EB  CART PIC #08
        DECLE   $0066,  $007E,  $003C,  $0000   ; 61EF  
        DECLE   $003C,  $007E,  $0066,  $003E   ; 61F3  CART PIC #09
        DECLE   $0006,  $007E,  $003C,  $0000   ; 61F7  
        DECLE   $00FF,  $00E7,  $00C3,  $0081   ; 61FB  CART PIC #0A
        DECLE   $0081,  $0081,  $0081,  $0081   ; 61FF  
        DECLE   $00FF,  $00C0,  $0080,  $0080   ; 6203  CART PIC #0B
        DECLE   $0080,  $0080,  $0080,  $0080   ; 6207  
        DECLE   $0000,  $0003,  $000F,  $003F   ; 620B  CART PIC #0C
        DECLE   $007F,  $007F,  $00FF,  $00FF   ; 620F  
        DECLE   $0000,  $00C0,  $0070,  $00DC   ; 6213  CART PIC #0D
        DECLE   $00E6,  $00F3,  $00F8,  $00F9   ; 6217  
        DECLE   $009D,  $00B5,  $00CD,  $00AD   ; 621B  CART PIC #0E
        DECLE   $00B7,  $00FF,  $00FF,  $007F   ; 621F  
        DECLE   $00B9,  $0069,  $0059,  $0079   ; 6223  CART PIC #0F
        DECLE   $0079,  $00F9,  $00F9,  $00F6   ; 6227  
        DECLE   $003F,  $00BF,  $005F,  $00BF   ; 622B  CART PIC #10
        DECLE   $003E,  $007E,  $00B9,  $00F7   ; 622F  
        DECLE   $00EC,  $00F5,  $00F9,  $0079   ; 6233  CART PIC #11
        DECLE   $0099,  $00F8,  $00E3,  $00C9   ; 6237  
        DECLE   $00E0,  $00F0,  $00F0,  $00F8   ; 623B  CART PIC #12
        DECLE   $00F8,  $00FC,  $00FC,  $00FE   ; 623F  
        DECLE   $00E0,  $00F0,  $00F8,  $00EC   ; 6243  CART PIC #13
        DECLE   $00E6,  $00E3,  $00E0,  $00E0   ; 6247  
        DECLE   $00FC,  $00F8,  $00F8,  $00F3   ; 624B  CART PIC #14
        DECLE   $00F6,  $00FC,  $00E0,  $00E0   ; 624F  
        DECLE   $003C,  $0099,  $00C2,  $00F1   ; 6253  CART PIC #15
        DECLE   $0065,  $0044,  $001D,  $00CD   ; 6257  
        DECLE   $0058,  $00B4,  $00DE,  $00F5   ; 625B  CART PIC #16
        DECLE   $007E,  $00D7,  $008F,  $0004   ; 625F  
        DECLE   $0008,  $005C,  $00FE,  $006E   ; 6263  CART PIC #17
        DECLE   $00AB,  $00DD,  $00FB,  $0056   ; 6267  
        DECLE   $006B,  $00F7,  $007E,  $00DC   ; 626B  CART PIC #18
        DECLE   $00EF,  $00BB,  $007D,  $00AE   ; 626F  
        DECLE   $0066,  $0066,  $0066,  $0066   ; 6273  CART PIC #19
        DECLE   $0066,  $007E,  $003C,  $0000   ; 6277  
        DECLE   $0000,  $003C,  $007E,  $0066   ; 627B  CART PIC #1A
        DECLE   $0066,  $007E,  $007C,  $0060   ; 627F  
        DECLE   $0000,  $0000,  $0034,  $0018   ; 6283  CART PIC #1B
        DECLE   $0018,  $0018,  $0018,  $002C   ; 6287  
        DECLE   $0050,  $0070,  $0020,  $0070   ; 628B  CART PIC #1C
        DECLE   $0000,  $0058,  $0058,  $00DE   ; 628F  
        DECLE   $00F8,  $00E1,  $00C9,  $0080   ; 6293  CART PIC #1D
        DECLE   $00A0,  $0000,  $0000,  $0060   ; 6297  
        DECLE   $001F,  $0087,  $0093,  $0081   ; 629B  CART PIC #1E
        DECLE   $0085,  $0080,  $0080,  $0086   ; 629F  
        DECLE   $0006,  $0000,  $0000,  $0005   ; 62A3  CART PIC #1F
        DECLE   $0001,  $0093,  $0087,  $001F   ; 62A7  
        DECLE   $0060,  $0000,  $0000,  $00A0   ; 62AB  CART PIC #20
        DECLE   $0080,  $00C9,  $00E1,  $00F8   ; 62AF  
        DECLE   $00FF,  $0081,  $00BD,  $00A1   ; 62B3  CART PIC #21
        DECLE   $00A1,  $00BD,  $0081,  $00FF   ; 62B7  
        DECLE   $0004,  $00A5,  $00C0,  $0080   ; 62BB   0004 00A5 00C0 0080
        DECLE   $0005,  $0090,  $00A0,  $00C6   ; 62BF   0005 0090 00A0 00C6
        DECLE   $0000,  $00F6,  $0000,  $0000   ; 62C3   0000 00F6 0000 0000
        DECLE   $0000,  $0046,  $0020,  $0010   ; 62C7   0000 0046 0020 0010
        DECLE   $0001,  $0080,  $0040,  $0025   ; 62CB   0001 0080 0040 0025
        DECLE   $0001,  $0080,  $0080,  $0085   ; 62CF   0001 0080 0080 0085
        DECLE   $0001,  $0001,  $0002,  $00A4   ; 62D3   0001 0001 0002 00A4
        DECLE   $0000,  $0062,  $0004,  $0008   ; 62D7   0000 0062 0004 0008
        DECLE   $0005,  $0000,  $0000,  $006F   ; 62DB   0005 0000 0000 006F
        DECLE   $0005,  $0008,  $0004,  $0062   ; 62DF   0005 0008 0004 0062
        DECLE   $0004,  $00A4,  $0002,  $0001   ; 62E3   0004 00A4 0002 0001
        DECLE   $0004,  $00A1,  $0001,  $0001   ; 62E7   0004 00A1 0001 0001
        DECLE   $0050,  $0070,  $0020,  $0070   ; 62EB  CART PIC #28
        DECLE   $0000,  $0058,  $0059,  $00DE   ; 62EF  
        DECLE   $0050,  $0070,  $0020,  $0070   ; 62F3  CART PIC #29
        DECLE   $0000,  $005A,  $0059,  $00DE   ; 62F7  
L_62FB:
        PSHR    R5                              ; 62FB   0275
        CLRR    R4                              ; 62FC   01E4
        MVO     R4,     G_0170                  ; 62FD   0244 0170
        MVO     R4,     G_019F                  ; 62FF   0244 019F

        JSR     R5,     L_5AFC                  ; 6301   0004 0158 02FC
        JSR     R5,     .EXEC.7B3               ; 6304   0004 0114 03B3
        JSR     R5,     L_6397                  ; 6307   0004 0160 0397

        MVII    #$00FF, R0                      ; 630A   02B8 00FF
        MVO     R0,     G_0179                  ; 630C   0240 0179
        MVO     R0,     G_01D1                  ; 630E   0240 01D1
        SDBD                                    ; 6310   0001
        MVII    #$510C, R0                      ; 6311   02B8 000C 0051
        MVO     R0,     G_035D                  ; 6314   0240 035D
        MVII    #$0001, R0                      ; 6316   02B8 0001
        MVO     R0,     G_0199                  ; 6318   0240 0199
        MVO     R0,     G_01AF                  ; 631A   0240 01AF
        MVII    #$0003, R0                      ; 631C   02B8 0003
        MVO     R0,     G_01B2                  ; 631E   0240 01B2
        MVO     R0,     G_01B0                  ; 6320   0240 01B0
        MVO     R0,     G_018A                  ; 6322   0240 018A
        MVII    #$0217, R4                      ; 6324   02BC 0217
        SDBD                                    ; 6326   0001
        MVII    #$1004, R1                      ; 6327   02B9 0004 0010
        SDBD                                    ; 632A   0001
        MVII    #$6391, R5                      ; 632B   02BD 0091 0063
L_632E:
        MVI@    R5,     R3                      ; 632E   02AB
        SDBD                                    ; 632F   0001
        XORI    #$0800, R3                      ; 6330   03FB 0000 0008
        XORR    R1,     R3                      ; 6333   01CB
        MVO@    R3,     R4                      ; 6334   0263
        DECR    R0                              ; 6335   0010
        BNEQ    L_632E                          ; 6336   022C 0009

        MVI     G_01B1, R0                      ; 6338   0280 01B1
        CMPI    #$0001, R0                      ; 633A   0378 0001
        BEQ     L_6354                          ; 633C   0204 0016

        MVII    #$0223, R4                      ; 633E   02BC 0223
        MVII    #$0003, R0                      ; 6340   02B8 0003
        SDBD                                    ; 6342   0001
        MVII    #$1001, R1                      ; 6343   02B9 0001 0010
        SDBD                                    ; 6346   0001
        MVII    #$6394, R5                      ; 6347   02BD 0094 0063
L_634A:
        MVI@    R5,     R3                      ; 634A   02AB
        SDBD                                    ; 634B   0001
        XORI    #$0800, R3                      ; 634C   03FB 0000 0008
        XORR    R1,     R3                      ; 634F   01CB
        MVO@    R3,     R4                      ; 6350   0263
        DECR    R0                              ; 6351   0010
        BNEQ    L_634A                          ; 6352   022C 0009

L_6354:
        JSR     R5,     L_641A                  ; 6354   0004 0164 001A

        MVII    #$019B, R4                      ; 6357   02BC 019B
        MVII    #$000A, R0                      ; 6359   02B8 000A

        JSR     R5,     X_FILL_ZERO             ; 635B   0004 0114 0338

        MVII    #$01AC, R4                      ; 635E   02BC 01AC
        MVII    #$0003, R0                      ; 6360   02B8 0003

        JSR     R5,     X_FILL_ZERO             ; 6362   0004 0114 0338
        JSR     R5,     L_5A66                  ; 6365   0004 0158 0266
        JSR     R5,     L_5AAD                  ; 6368   0004 0158 02AD

        MVII    #$0005, R0                      ; 636B   02B8 0005
        SDBD                                    ; 636D   0001
        MVII    #$0886, R1                      ; 636E   02B9 0086 0008
        MVII    #$0202, R4                      ; 6371   02BC 0202

        JSR     R5,     X_FILL_MEM              ; 6373   0004 0114 0341

        MVI     G_01B1, R0                      ; 6376   0280 01B1
        CMPI    #$0001, R0                      ; 6378   0378 0001
        BEQ     L_6385                          ; 637A   0204 0009

        MVII    #$0005, R0                      ; 637C   02B8 0005
        ADDI    #$0007, R4                      ; 637E   02FC 0007

        JSR     R5,     X_FILL_MEM              ; 6380   0004 0114 0341

        B       L_638C                          ; 6383   0200 0007

L_6385:
        MVII    #$0005, R0                      ; 6385   02B8 0005
        ADDI    #$0007, R4                      ; 6387   02FC 0007

        JSR     R5,     X_FILL_ZERO             ; 6389   0004 0114 0338

L_638C:
        CLRR    R1                              ; 638C   01C9

        JSR     R5,     L_5A04                  ; 638D   0004 0158 0204

        PULR    R7                              ; 6390   02B7

        MOVR    R1,     R0                      ; 6391   0088
        ADDR    R2,     R0                      ; 6392   00D0
        ADDR    R3,     R0                      ; 6393   00D8
        MOVR    R2,     R0                      ; 6394   0090
        ADDR    R2,     R0                      ; 6395   00D0
        ADDR    R3,     R0                      ; 6396   00D8
L_6397:
        PSHR    R5                              ; 6397   0275
        MVII    #$0007, R0                      ; 6398   02B8 0007
        SDBD                                    ; 639A   0001
        MVII    #$65E8, R1                      ; 639B   02B9 00E8 0065
        MVII    #$0325, R2                      ; 639E   02BA 0325

        JSR     R5,     X_INIT_MOBS             ; 63A0   0004 0114 02B4

        MVII    #$0002, R0                      ; 63A3   02B8 0002
        MVO     R0,     G_01D7                  ; 63A5   0240 01D7

        JSR     R5,     L_63DD                  ; 63A7   0004 0160 03DD

        MVO     R0,     G_01B8                  ; 63AA   0240 01B8
        MVO     R0,     G_0358                  ; 63AC   0240 0358
        MVO     R0,     G_0350                  ; 63AE   0240 0350
        MVO     R1,     G_0357                  ; 63B0   0241 0357
        NOP                                     ; 63B2   0034
        MVO     R1,     G_034F                  ; 63B3   0241 034F
        SWAP    R0,     1                       ; 63B5   0040
        MVO     R0,     G_017E                  ; 63B6   0240 017E
        SWAP    R1,     1                       ; 63B8   0041
        NOP                                     ; 63B9   0034
        MVO     R1,     G_017D                  ; 63BA   0241 017D

        JSR     R5,     L_63DD                  ; 63BC   0004 0160 03DD

        MVO     R0,     G_0330                  ; 63BF   0240 0330
        MVO     R1,     G_032F                  ; 63C1   0241 032F

        JSR     R5,     L_63DD                  ; 63C3   0004 0160 03DD

        MVO     R0,     G_0338                  ; 63C6   0240 0338
        MVO     R1,     G_0337                  ; 63C8   0241 0337

        JSR     R5,     L_63DD                  ; 63CA   0004 0160 03DD

        MVO     R0,     G_0340                  ; 63CD   0240 0340
        MVO     R1,     G_033F                  ; 63CF   0241 033F

        JSR     R5,     L_63DD                  ; 63D1   0004 0160 03DD

        MVO     R0,     G_0348                  ; 63D4   0240 0348
        MVO     R0,     G_0328                  ; 63D6   0240 0328
        MVO     R1,     G_0347                  ; 63D8   0241 0347
        MVO     R1,     G_0327                  ; 63DA   0241 0327
        PULR    R7                              ; 63DC   02B7

L_63DD:
        PSHR    R5                              ; 63DD   0275
L_63DE:
        MVII    #$0004, R0                      ; 63DE   02B8 0004

        JSR     R5,     X_RAND1                 ; 63E0   0004 0114 027D

        PSHR    R0                              ; 63E3   0270
        MVII    #$0003, R0                      ; 63E4   02B8 0003

        JSR     R5,     X_RAND1                 ; 63E6   0004 0114 027D

        PULR    R1                              ; 63E9   02B1
        SLL     R0,     2                       ; 63EA   004C
        SLL     R0,     1                       ; 63EB   0048
        ADDI    #$0018, R0                      ; 63EC   02F8 0018
        SLL     R1,     2                       ; 63EE   004D
        SLL     R1,     1                       ; 63EF   0049
        ADDI    #$0018, R1                      ; 63F0   02F9 0018
        SWAP    R0,     1                       ; 63F2   0040
        SWAP    R1,     1                       ; 63F3   0041
        CMP     G_0358, R0                      ; 63F4   0340 0358
        BNEQ    L_63FC                          ; 63F6   020C 0004

        CMP     G_0357, R1                      ; 63F8   0341 0357
        BEQ     L_63DE                          ; 63FA   0224 001D
L_63FC:
        PULR    R7                              ; 63FC   02B7

        MOVR    R1,     R2                      ; 63FD   008A
        ADDI    #$0007, R2                      ; 63FE   02FA 0007
        MVI@    R2,     R3                      ; 6400   0293
        SUBI    #$0004, R2                      ; 6401   033A 0004
        MVI@    R2,     R0                      ; 6403   0290
        SWAP    R0,     1                       ; 6404   0040
        ADDR    R3,     R0                      ; 6405   00D8
        SWAP    R0,     1                       ; 6406   0040
        MVO@    R0,     R2                      ; 6407   0250
        SWAP    R0,     1                       ; 6408   0040
        ANDI    #$0007, R0                      ; 6409   03B8 0007
        BEQ     L_6411                          ; 640B   0204 0004

        CMPI    #$0006, R0                      ; 640D   0378 0006
        BNEQ    L_6412                          ; 640F   020C 0001

L_6411:
        NEGR    R3                              ; 6411   0023
L_6412:
        MVII    #$0005, R0                      ; 6412   02B8 0005
        ADDI    #$0006, R1                      ; 6414   02F9 0006
        MVO@    R0,     R1                      ; 6416   0248
        INCR    R1                              ; 6417   0009
        MVO@    R3,     R1                      ; 6418   024B
        MOVR    R5,     R7                      ; 6419   00AF

L_641A:
        PSHR    R5                              ; 641A   0275
        MVII    #$0080, R0                      ; 641B   02B8 0080
        SDBD                                    ; 641D   0001
        MVII    #$4224, R4                      ; 641E   02BC 0024 0042

        JSR     R5,     X_FILL_ZERO             ; 6421   0004 0114 0338

        MVII    #$0001, R1                      ; 6424   02B9 0001
        MOVR    R1,     R2                      ; 6426   008A
        SDBD                                    ; 6427   0001
        MVII    #$4224, R5                      ; 6428   02BD 0024 0042
L_642B:
        MVO     R1,     G_01BE                  ; 642B   0241 01BE
        MVO     R2,     G_01BF                  ; 642D   0242 01BF
        PSHR    R5                              ; 642F   0275

        JSR     R5,     L_5157                  ; 6430   0004 0150 0157

        PSHR    R0                              ; 6433   0270

        JSR     R5,     L_57E3                  ; 6434   0004 0154 03E3

        PULR    R0                              ; 6437   02B0
        CLRR    R3                              ; 6438   01DB
        CMPI    #$0001, R1                      ; 6439   0379 0001
        BNEQ    L_6442                          ; 643B   020C 0005

        JSR     R5,     L_645C                  ; 643D   0004 0164 005C

        MVII    #$00F0, R3                      ; 6440   02BB 00F0
L_6442:
        PULR    R5                              ; 6442   02B5
        MVI@    R5,     R1                      ; 6443   02A9
        TSTR    R1                              ; 6444   0089
        BNEQ    L_6449                          ; 6445   020C 0002

        DECR    R5                              ; 6447   0015
        MVO@    R3,     R5                      ; 6448   026B
L_6449:
        MVI     G_01BE, R1                      ; 6449   0281 01BE
        MVI     G_01BF, R2                      ; 644B   0282 01BF
        ADDI    #$0002, R1                      ; 644D   02F9 0002
        CMPI    #$0021, R1                      ; 644F   0379 0021
        BNEQ    L_642B                          ; 6451   022C 0027

        MVII    #$0001, R1                      ; 6453   02B9 0001
        ADDI    #$0002, R2                      ; 6455   02FA 0002
        CMPI    #$0011, R2                      ; 6457   037A 0011
        BNEQ    L_642B                          ; 6459   022C 002F
        PULR    R7                              ; 645B   02B7

L_645C:
        PSHR    R5                              ; 645C   0275
        SDBD                                    ; 645D   0001
        MVII    #$6493, R5                      ; 645E   02BD 0093 0064
L_6461:
        MVI     G_01BE, R1                      ; 6461   0281 01BE
        MVI     G_01BF, R2                      ; 6463   0282 01BF
        ADD@    R5,     R1                      ; 6465   02E9
        ADD@    R5,     R2                      ; 6466   02EA
        DECR    R5                              ; 6467   0015
        RRC     R0,     1                       ; 6468   0070
        BNC     L_6461                          ; 6469   0229 0009

        ANDI    #$00FF, R1                      ; 646B   03B9 00FF
        ANDI    #$00FF, R2                      ; 646D   03BA 00FF
        PSHR    R5                              ; 646F   0275

        JSR     R5,     L_5157                  ; 6470   0004 0150 0157
        JSR     R5,     L_57E3                  ; 6473   0004 0154 03E3

        PULR    R5                              ; 6476   02B5
        CMPI    #$0002, R1                      ; 6477   0379 0002
        BNEQ    L_6492                          ; 6479   020C 0017

        DECR    R5                              ; 647B   0015
        MVI     G_01BE, R1                      ; 647C   0281 01BE
        MVI     G_01BF, R2                      ; 647E   0282 01BF
        ADD@    R5,     R1                      ; 6480   02E9
        ADD@    R5,     R2                      ; 6481   02EA
        ANDI    #$00FF, R1                      ; 6482   03B9 00FF
        ANDI    #$00FF, R2                      ; 6484   03BA 00FF
        SLR     R1,     1                       ; 6486   0061
        SLR     R2,     1                       ; 6487   0062
        SLL     R2,     2                       ; 6488   004E
        SLL     R2,     2                       ; 6489   004E
        XORR    R1,     R2                      ; 648A   01CA
        MVII    #$00F0, R1                      ; 648B   02B9 00F0
        SDBD                                    ; 648D   0001
        ADDI    #$4224, R2                      ; 648E   02FA 0024 0042
        MVO@    R1,     R2                      ; 6491   0251
L_6492:
        PULR    R7                              ; 6492   02B7

        DECLE   $0000,  $0002,  $0000,  $00FE   ; 6493   0000 0002 0000 00FE
        DECLE   $0000,  $0000,  $0000,  $0077   ; 6497   0000 0000 0000 0077
        DECLE   $00FF,  $0098,  $005B,  $0036   ; 649B   00FF 0098 005B 0036
        DECLE   $0084,  $00C3,  $0073,  $003E   ; 649F   0084 00C3 0073 003E
        DECLE   $00E4,  $00C8,  $001F,  $0037   ; 64A3   00E4 00C8 001F 0037
        DECLE   $00F2,  $00D2,  $004D,  $006D   ; 64A7   00F2 00D2 004D 006D
        DECLE   $00FB,  $002E,  $0091,  $0058   ; 64AB   00FB 002E 0091 0058
        DECLE   $00F7,  $00C7,  $000E,  $003C   ; 64AF   00F7 00C7 000E 003C
        DECLE   $0078,  $0047,  $0085,  $007F   ; 64B3   0078 0047 0085 007F
        DECLE   $00FF,  $0000,  $0000,  $007F   ; 64B7   00FF 0000 0000 007F
        DECLE   $00FF,  $0098,  $0021,  $0027   ; 64BB   00FF 0098 0021 0027

        ADDR    R5,     R7                      ; 64BF   00EF

        ADDR    R7,     R0                      ; 64C0   00F8
        GSWD    R1                              ; 64C1   0031
        DIS                                     ; 64C2   0003
        ADDR    R0,     R7                      ; 64C3   00C7

        ADDR    R7,     R6                      ; 64C4   00FE
        ADDR    R7,     R0                      ; 64C5   00F8
        RLC     R1,     1                       ; 64C6   0051
        MOVR    R0,     R7                      ; 64C7   0087

        DECLE   $002E,  $00F1,  $0060,  $0006   ; 64C8   002E 00F1 0060 0006
        DECLE   $00BF                           ; 64CC   00BF

        ADDR    R7,     R3                      ; 64CD   00FB
        NEGR    R1                              ; 64CE   0021
        MOVR    R0,     R6                      ; 64CF   0086
        ADDR    R3,     R4                      ; 64D0   00DC
        SARC    R1,     1                       ; 64D1   0079
        GSWD    R3                              ; 64D2   0033
        ADDR    R0,     R7                      ; 64D3   00C7

        MOVR    R3,     R4                      ; 64D4   009C
        RRC     R1,     1                       ; 64D5   0071
        RRC     R3,     2                       ; 64D6   0077
        ADDR    R5,     R7                      ; 64D7   00EF

        DECLE   $0000,  $0000,  $007F,  $007F   ; 64D8   0000 0000 007F 007F
        DECLE   $00C9,  $0093,  $0036,  $0036   ; 64DC   00C9 0093 0036 0036
        DECLE   $00DB,  $00DB,  $005D,  $00DD   ; 64E0   00DB 00DB 005D 00DD
        DECLE   $002C,  $002C,  $006B,  $006B   ; 64E4   002C 002C 006B 006B
        DECLE   $0091,  $0091,  $006B,  $006B   ; 64E8   0091 0091 006B 006B
        DECLE   $002C,  $002C,  $005D,  $00DD   ; 64EC   002C 002C 005D 00DD
        DECLE   $00DB,  $00DB,  $0036,  $0036   ; 64F0   00DB 00DB 0036 0036
        DECLE   $0093,  $00C9,  $007F,  $007F   ; 64F4   0093 00C9 007F 007F
        DECLE   $0000,  $0000,  $007F,  $00FF   ; 64F8   0000 0000 007F 00FF
        DECLE   $00FF,  $00FF,  $007F,  $00FF   ; 64FC   00FF 00FF 007F 00FF
        DECLE   $00FF,  $00FF,  $007F,  $00FF   ; 6500   00FF 00FF 007F 00FF
        DECLE   $00FF,  $00FF,  $007F,  $00FF   ; 6504   00FF 00FF 007F 00FF
        DECLE   $00FF,  $00FF,  $007F,  $00FF   ; 6508   00FF 00FF 007F 00FF
        DECLE   $00FF,  $00FF,  $007F,  $00FF   ; 650C   00FF 00FF 007F 00FF
        DECLE   $00FF,  $00FF,  $007F,  $00FF   ; 6510   00FF 00FF 007F 00FF
        DECLE   $00FF,  $00FF,  $007F,  $00FF   ; 6514   00FF 00FF 007F 00FF
        DECLE   $0000,  $0000                   ; 6518   0000 0000

        SARC    R1,     2                       ; 651A   007D
        ADDR    R5,     R7                      ; 651B   00EF

        MOVR    R0,     R6                      ; 651C   0086
        GSWD    R1                              ; 651D   0031
        RSWD    R6                              ; 651E   003E
        ADDR    R7,     R3                      ; 651F   00FB
        ADDR    R0,     R1                      ; 6520   00C1
        INCR    R7                              ; 6521   000F

        DECLE   $001F                           ; 6522   001F
L_6523:
        RRC     R0,     1                       ; 6523   0070
        DECLE   $00E1,  $009B,  $000E,  $0036   ; 6524   00E1 009B 000E 0036
        DECLE   $00F7                           ; 6528   00F7

        ADDR    R3,     R1                      ; 6529   00D9
        INCR    R4                              ; 652A   000C
        NEGR    R6                              ; 652B   0026
        ADDR    R4,     R3                      ; 652C   00E3
        MOVR    R6,     R3                      ; 652D   00B3
        COMR    R4                              ; 652E   001C
        SLR     R0,     2                       ; 652F   0064
        ADDR    R0,     R7                      ; 6530   00C7

        DECLE   $009B,  $003F                   ; 6531   009B 003F

        NEGR    R6                              ; 6533   0026
        MOVR    R0,     R1                      ; 6534   0081
        ADDR    R7,     R1                      ; 6535   00F9
        SARC    R3,     2                       ; 6536   007F
        ADDR    R3,     R7                      ; 6537   00DF

        DECLE   $0000,  $0000                   ; 6538   0000 0000

        SLLC    R3,     2                       ; 653A   005F
        SAR     R3,     2                       ; 653B   006F
        ADDR    R4,     R1                      ; 653C   00E1
        MOVR    R6,     R3                      ; 653D   00B3
        COMR    R6                              ; 653E   001E
        SLL     R0,     2                       ; 653F   004C
        ADDR    R0,     R3                      ; 6540   00C3
        RRC     R3,     2                       ; 6541   0077
        ADCR    R7                              ; 6542   002F

        ADDR    R0,     R5                      ; 6543   00C5
L_6544:
        ADDR    R6,     R0                      ; 6544   00F0
        DECLE   $003C,  $004B,  $00AB,  $002C   ; 6545   003C 004B 00AB 002C
        DECLE   $00D1,  $007F,  $00B7,  $0080   ; 6549   00D1 007F 00B7 0080
        DECLE   $0009,  $007F,  $007F,  $0081   ; 654D   0009 007F 007F 0081
        DECLE   $0081,  $003E,  $00BE,  $00C2   ; 6551   0081 003E 00BE 00C2
        DECLE   $0043,  $007F,  $00FF,  $0000   ; 6555   0043 007F 00FF 0000
        DECLE   $0000                           ; 6559   0000

        SARC    R1,     2                       ; 655A   007D
        ADDR    R7,     R5                      ; 655B   00FD
        MOVR    R0,     R6                      ; 655C   0086
        MOVR    R2,     R7                      ; 655D   0097

        RRC     R1,     2                       ; 655E   0075
        ADDR    R6,     R4                      ; 655F   00F4
        MOVR    R3,     R4                      ; 6560   009C
        SAR     R3,     1                       ; 6561   006B
        RRC     R2,     1                       ; 6562   0072
        MOVR    R3,     R7                      ; 6563   009F

        DECLE   $00BF                           ; 6564   00BF

        ADDR    R1,     R5                      ; 6565   00CD
        ADCR    R1                              ; 6566   0029
        SLLC    R2,     1                       ; 6567   005A
        ADDR    R1,     R6                      ; 6568   00CE
        RRC     R3,     1                       ; 6569   0073
        ADCR    R5                              ; 656A   002D
        SLL     R2,     1                       ; 656B   004A
        MOVR    R6,     R3                      ; 656C   00B3
        ADDR    R7,     R5                      ; 656D   00FD
        SARC    R0,     2                       ; 656E   007C
        MOVR    R4,     R7                      ; 656F   00A7

        ADDR    R2,     R6                      ; 6570   00D6
        RSWD    R1                              ; 6571   0039
L_6572:
        DECR    R7                              ; 6572   0017
        ADDR    R2,     R7                      ; 6573   00D7

        ADDR    R5,     R1                      ; 6574   00E9
        SLR     R1,     1                       ; 6575   0061
        SLLC    R3,     2                       ; 6576   005F
        ADDR    R3,     R7                      ; 6577   00DF

        DECLE   $0000,  $0000                   ; 6578   0000 0000

        SARC    R1,     2                       ; 657A   007D
        SLLC    R3,     2                       ; 657B   005F
        MOVR    R0,     R7                      ; 657C   0087

        ADDR    R4,     R1                      ; 657D   00E1
        RSWD    R4                              ; 657E   003C
        COMR    R6                              ; 657F   001E
        ADDR    R0,     R7                      ; 6580   00C7

        ADDR    R4,     R3                      ; 6581   00E3
        SLLC    R2,     2                       ; 6582   005E
        MOVR    R7,     R5                      ; 6583   00BD
        ADDR    R5,     R1                      ; 6584   00E9
        MOVR    R2,     R7                      ; 6585   0097
        ADCR    R7                              ; 6586   002F

        SARC    R2,     1                       ; 6587   007A
L_6588:
        MOVR    R6,     R4                      ; 6588   00B4
        ADCR    R5                              ; 6589   002D
        ADCR    R7                              ; 658A   002F

        SARC    R2,     1                       ; 658B   007A
L_658C:
        ADDR    R5,     R1                      ; 658C   00E9
        MOVR    R2,     R7                      ; 658D   0097

        SLLC    R2,     2                       ; 658E   005E
        MOVR    R7,     R5                      ; 658F   00BD
        ADDR    R0,     R7                      ; 6590   00C7

        ADDR    R4,     R3                      ; 6591   00E3
        RSWD    R4                              ; 6592   003C
        COMR    R6                              ; 6593   001E
        MOVR    R0,     R7                      ; 6594   0087

        DECLE   $00E1,  $007D,  $005F,  $0000   ; 6595   00E1 007D 005F 0000
        DECLE   $0000,  $0077,  $00BF,  $00FF   ; 6599   0000 0077 00BF 00FF
        DECLE   $00C9,  $007F,  $001D,  $00FF   ; 659D   00C9 007F 001D 00FF
        DECLE   $00E7,  $0077,  $004A,  $00F1   ; 65A1   00E7 0077 004A 00F1
        DECLE   $00F9,  $0076,  $0007,  $004F   ; 65A5   00F9 0076 0007 004F
        DECLE   $00F2,  $0070,  $0037           ; 65A9   00F2 0070 0037

        MOVR    R3,     R7                      ; 65AC   009F
        MOVR    R1,     R7                      ; 65AD   008F

        ADCR    R1                              ; 65AE   0029
        RRC     R3,     2                       ; 65AF   0077
        ADDR    R4,     R7                      ; 65B0   00E7

        DECLE   $00FF,  $005C,  $007F,  $0093   ; 65B1   00FF 005C 007F 0093
        DECLE   $00FF,  $007E,  $00F7,  $0000   ; 65B5   00FF 007E 00F7 0000
        DECLE   $0000                           ; 65B9   0000

        RLC     R2,     2                       ; 65BA   0056
        MOVR    R6,     R5                      ; 65BB   00B5
        ADDR    R7,     R3                      ; 65BC   00FB
        ADDR    R3,     R7                      ; 65BD   00DF

        SETC                                    ; 65BE   0007
        RRC     R0,     1                       ; 65BF   0070
        ADDR    R6,     R4                      ; 65C0   00F4
        ADCR    R7                              ; 65C1   002F
        ADCR    R7                              ; 65C2   002F

L_65C3:
        SARC    R2,     1                       ; 65C3   007A
L_65C4:
        MOVR    R2,     R1                      ; 65C4   0091
        TSTR    R1                              ; 65C5   0089
        SAR     R3,     2                       ; 65C6   006F
        ADDR    R7,     R3                      ; 65C7   00FB
        MOVR    R6,     R0                      ; 65C8   00B0
        INCR    R5                              ; 65C9   000D
        SAR     R3,     2                       ; 65CA   006F
        ADDR    R7,     R3                      ; 65CB   00FB
        MOVR    R2,     R1                      ; 65CC   0091
        TSTR    R1                              ; 65CD   0089
        ADCR    R7                              ; 65CE   002F

        SARC    R2,     1                       ; 65CF   007A
L_65D0:
        ADDR    R6,     R4                      ; 65D0   00F4
        ADCR    R7                              ; 65D1   002F

        SETC                                    ; 65D2   0007
L_65D3:
        RRC     R0,     1                       ; 65D3   0070
        ADDR    R7,     R3                      ; 65D4   00FB
        ADDR    R3,     R7                      ; 65D5   00DF

        RLC     R2,     2                       ; 65D6   0056
        MOVR    R6,     R5                      ; 65D7   00B5
        MOVR    R0,     R7                      ; 65D8   0087

        DECLE   $0018,  $00BB,  $0067,  $0000   ; 65D9   0018 00BB 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65E1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0050   ; 65E5   0000 0000 0000 0050
        DECLE   $0010,  $0098,  $0067,  $0000   ; 65E9   0010 0098 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65ED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00CA   ; 65F1   0000 0000 0000 00CA
        DECLE   $0000,  $0000,  $0000,  $0047   ; 65F5   0000 0000 0000 0047
        DECLE   $009A,  $0071,  $0067,  $0000   ; 65F9   009A 0071 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0067   ; 6601   0000 0000 0000 0067
        DECLE   $0000,  $0000,  $0000,  $0047   ; 6605   0000 0000 0000 0047
        DECLE   $009A,  $007A,  $0067,  $0000   ; 6609   009A 007A 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 660D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0066   ; 6611   0000 0000 0000 0066
        DECLE   $0000,  $0000,  $0000,  $0047   ; 6615   0000 0000 0000 0047
        DECLE   $009A,  $0068,  $0067,  $0000   ; 6619   009A 0068 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 661D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0064   ; 6621   0000 0000 0000 0064
        DECLE   $0000,  $0000,  $0000,  $0052   ; 6625   0000 0000 0000 0052
        DECLE   $0010,  $0091,  $0067,  $0000   ; 6629   0010 0091 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 662D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6631   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0053   ; 6635   0000 0000 0000 0053
        DECLE   $0010,  $0031,  $0067,  $0000   ; 6639   0010 0031 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 663D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6641   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0053   ; 6645   0000 0000 0000 0053
        DECLE   $0018,  $0028,  $0067,  $0000   ; 6649   0018 0028 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 664D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $006E   ; 6651   0000 0000 0000 006E
        DECLE   $0000,  $0000,  $0000,  $0052   ; 6655   0000 0000 0000 0052
        DECLE   $0000,  $00E0,  $0067,  $0000   ; 6659   0000 00E0 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 665D   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0002,  $0000   ; 6661   0000 0030 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0046   ; 6665   0000 0000 0000 0046
        DECLE   $0000,  $00E7,  $0067,  $0000   ; 6669   0000 00E7 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 666D   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0002,  $0000   ; 6671   0000 0030 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0042   ; 6675   0000 0000 0000 0042
        DECLE   $0000,  $00EE,  $0067,  $0000   ; 6679   0000 00EE 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 667D   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0002,  $0000   ; 6681   0000 0030 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0056   ; 6685   0000 0000 0000 0056
        DECLE   $0000,  $00F5,  $0067,  $0000   ; 6689   0000 00F5 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 668D   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0002,  $0000   ; 6691   0000 0030 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0053   ; 6695   0000 0000 0000 0053
        DECLE   $000A,  $00FC,  $0067,  $0000   ; 6699   000A 00FC 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 669D   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0002,  $0000   ; 66A1   0000 0030 0002 0000
        DECLE   $0000,  $0000,  $0000,  $008E   ; 66A5   0000 0000 0000 008E
        DECLE   $0010,  $000C,  $0068,  $0000   ; 66A9   0010 000C 0068 0000
        DECLE   $0038,  $0000,  $0056,  $0000   ; 66AD   0038 0000 0056 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; 66B1   0000 0000 0000 0006
        DECLE   $0000,  $0001,  $0000,  $005D   ; 66B5   0000 0001 0000 005D
        DECLE   $0010,  $0005,  $0068,  $0000   ; 66B9   0010 0005 0068 0000
        DECLE   $0030,  $0000,  $0056,  $0000   ; 66BD   0030 0000 0056 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 66C1   0000 0000 0000 0001
        DECLE   $0000,  $0001,  $0000,  $0049   ; 66C5   0000 0001 0000 0049
        DECLE   $0010,  $0013,  $0068,  $0000   ; 66C9   0010 0013 0068 0000
        DECLE   $0040,  $0000,  $0056,  $0000   ; 66CD   0040 0000 0056 0000
        DECLE   $0000,  $0000,  $0000,  $000B   ; 66D1   0000 0000 0000 000B
        DECLE   $0000,  $0001,  $0000,  $004A   ; 66D5   0000 0001 0000 004A
        DECLE   $0010,  $001A,  $0068,  $0000   ; 66D9   0010 001A 0068 0000
        DECLE   $0048,  $0000,  $0056,  $0000   ; 66DD   0048 0000 0056 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 66E1   0000 0000 0000 0010
        DECLE   $0000,  $0001,  $0000,  $004B   ; 66E5   0000 0001 0000 004B
        DECLE   $0010,  $0021,  $0068,  $0000   ; 66E9   0010 0021 0068 0000
        DECLE   $0060,  $0000,  $0056,  $0000   ; 66ED   0060 0000 0056 0000
        DECLE   $0000,  $0000,  $0000,  $0015   ; 66F1   0000 0000 0000 0015
        DECLE   $0000,  $0001,  $0000,  $004C   ; 66F5   0000 0001 0000 004C
        DECLE   $0010,  $0028,  $0068,  $0000   ; 66F9   0010 0028 0068 0000
        DECLE   $0068,  $0000,  $0056,  $0000   ; 66FD   0068 0000 0056 0000
        DECLE   $0000,  $0000,  $0000,  $001A   ; 6701   0000 0000 0000 001A
        DECLE   $0000,  $0001,  $0000,  $004E   ; 6705   0000 0001 0000 004E
        DECLE   $0010,  $002F,  $0068,  $0000   ; 6709   0010 002F 0068 0000
        DECLE   $0070,  $0000,  $0056,  $0000   ; 670D   0070 0000 0056 0000
        DECLE   $0000,  $0000,  $0000,  $001F   ; 6711   0000 0000 0000 001F
        DECLE   $0000,  $0001,  $0000,  $005C   ; 6715   0000 0001 0000 005C
        DECLE   $0010,  $0036,  $0068,  $0000   ; 6719   0010 0036 0068 0000
        DECLE   $0077,  $0000,  $0056,  $0000   ; 671D   0077 0000 0056 0000
        DECLE   $0000,  $0000,  $0000,  $0024   ; 6721   0000 0000 0000 0024
        DECLE   $0000,  $0001,  $0000,  $0300   ; 6725   0000 0001 0000 0300
        DECLE   $0000,  $00AE,  $0052,  $0001   ; 6729   0000 00AE 0052 0001
        DECLE   $000A,  $0002,  $019E,  $015B   ; 672D   000A 0002 019E 015B
        DECLE   $0300,  $0000,  $0000,  $0000   ; 6731   0300 0000 0000 0000
        DECLE   $0001,  $0065,  $0000,  $0300   ; 6735   0001 0065 0000 0300
        DECLE   $0000,  $00AE,  $0052,  $0005   ; 6739   0000 00AE 0052 0005
        DECLE   $000C,  $0002,  $019E,  $015B   ; 673D   000C 0002 019E 015B
        DECLE   $0300,  $0000,  $0000,  $0000   ; 6741   0300 0000 0000 0000
        DECLE   $0001,  $0065,  $0000,  $0300   ; 6745   0001 0065 0000 0300
        DECLE   $0000,  $00AE,  $0052,  $0008   ; 6749   0000 00AE 0052 0008
        DECLE   $0026,  $0002,  $019E,  $015B   ; 674D   0026 0002 019E 015B
        DECLE   $0300,  $0000,  $0000,  $0000   ; 6751   0300 0000 0000 0000
        DECLE   $0008,  $0016,  $0000,  $0300   ; 6755   0008 0016 0000 0300
        DECLE   $0000,  $00AE,  $0052,  $0005   ; 6759   0000 00AE 0052 0005
        DECLE   $0000,  $0002,  $019E,  $015B   ; 675D   0000 0002 019E 015B
        DECLE   $0300,  $0000,  $0000,  $0000   ; 6761   0300 0000 0000 0000
        DECLE   $0001,  $0065,  $0000,  $0300   ; 6765   0001 0065 0000 0300
        DECLE   $0000,  $00DA,  $0053,  $0008   ; 6769   0000 00DA 0053 0008
        DECLE   $0036,  $0002,  $0352,  $0158   ; 676D   0036 0002 0352 0158
        DECLE   $0300,  $0000,  $00DA,  $0053   ; 6771   0300 0000 00DA 0053
        DECLE   $0008,  $0036,  $0002,  $0352   ; 6775   0008 0036 0002 0352
        DECLE   $0158,  $0300,  $0000,  $00DA   ; 6779   0158 0300 0000 00DA
        DECLE   $0053,  $0008,  $0036,  $0002   ; 677D   0053 0008 0036 0002
        DECLE   $0352,  $0158,  $0300,  $0000   ; 6781   0352 0158 0300 0000
        DECLE   $0000,  $0000,  $0006,  $0052   ; 6785   0000 0000 0006 0052
        DECLE   $0000,  $0300,  $0000,  $00BC   ; 6789   0000 0300 0000 00BC
        DECLE   $0055,  $0006,  $0052,  $0000   ; 678D   0055 0006 0052 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; 6791   0300 0000 0000 0000
        DECLE   $0006,  $0046,  $0000,  $0300   ; 6795   0006 0046 0000 0300
        DECLE   $0000,  $00BC,  $0055,  $0006   ; 6799   0000 00BC 0055 0006
        DECLE   $0046,  $0000,  $0300,  $0000   ; 679D   0046 0000 0300 0000
        DECLE   $0000,  $0000,  $0006,  $0046   ; 67A1   0000 0000 0006 0046
        DECLE   $0000,  $0300,  $0000,  $00BC   ; 67A5   0000 0300 0000 00BC
        DECLE   $0055,  $0006,  $0046,  $0000   ; 67A9   0055 0006 0046 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; 67AD   0300 0000 0000 0000
        DECLE   $0001,  $0046,  $0000,  $0300   ; 67B1   0001 0046 0000 0300
        DECLE   $0000,  $00BF,  $0056,  $0001   ; 67B5   0000 00BF 0056 0001
        DECLE   $0046,  $0000,  $0300,  $0000   ; 67B9   0046 0000 0300 0000
        DECLE   $0000,  $0000,  $0001,  $005E   ; 67BD   0000 0000 0001 005E
        DECLE   $0002,  $0128,  $0158,  $0300   ; 67C1   0002 0128 0158 0300
        DECLE   $0000,  $00F3,  $0058,  $0001   ; 67C5   0000 00F3 0058 0001
        DECLE   $005F,  $0000,  $0300,  $0000   ; 67C9   005F 0000 0300 0000
        DECLE   $00F3,  $0058,  $0001,  $0061   ; 67CD   00F3 0058 0001 0061
        DECLE   $0000,  $0300,  $0000,  $00F3   ; 67D1   0000 0300 0000 00F3
        DECLE   $0058,  $0001,  $0063,  $0000   ; 67D5   0058 0001 0063 0000
        DECLE   $0300,  $0000,  $0031,  $0059   ; 67D9   0300 0000 0031 0059
        DECLE   $0001,  $0065,  $0000,  $0000   ; 67DD   0001 0065 0000 0000
        DECLE   $0000,  $000E,  $005D,  $0002   ; 67E1   0000 000E 005D 0002
        DECLE   $0067,  $0000,  $0000,  $0000   ; 67E5   0067 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $006B   ; 67E9   0000 0000 0002 006B
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67ED   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $006F,  $0000   ; 67F1   0000 0002 006F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67F5   0000 0000 0000 0000
        DECLE   $0002,  $0073,  $0000,  $0000   ; 67F9   0002 0073 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; 67FD   0000 0000 0000 0002
        DECLE   $0077,  $0002,  $0345,  $015E   ; 6801   0077 0002 0345 015E
        DECLE   $0000,  $0000,  $00FD,  $0063   ; 6805   0000 0000 00FD 0063
        DECLE   $0001,  $007B,  $0000,  $0000   ; 6809   0001 007B 0000 0000
        DECLE   $0000,  $00FD,  $0063,  $0001   ; 680D   0000 00FD 0063 0001
        DECLE   $007D,  $0000,  $0000,  $0000   ; 6811   007D 0000 0000 0000
        DECLE   $00FD,  $0063,  $0001,  $007F   ; 6815   00FD 0063 0001 007F
        DECLE   $0000,  $0000,  $0000,  $00FD   ; 6819   0000 0000 0000 00FD
        DECLE   $0063,  $0001,  $0081,  $0000   ; 681D   0063 0001 0081 0000
        DECLE   $0000,  $0000,  $00FD,  $0063   ; 6821   0000 0000 00FD 0063
        DECLE   $0001,  $0083,  $0000,  $0000   ; 6825   0001 0083 0000 0000
        DECLE   $0000,  $00FD,  $0063,  $0001   ; 6829   0000 00FD 0063 0001
        DECLE   $0085,  $0000,  $0000,  $0000   ; 682D   0085 0000 0000 0000
        DECLE   $00FD,  $0063,  $0001,  $0081   ; 6831   00FD 0063 0001 0081
        DECLE   $0000,  $0000,  $0000,  $00FD   ; 6835   0000 0000 0000 00FD
        DECLE   $0063,  $0001,  $0087,  $0000   ; 6839   0063 0001 0087 0000
        DECLE   $0000,  $0000,  $0014,  $001C   ; 683D   0000 0000 0014 001C
        DECLE   $000C,  $0014,  $0014,  $0008   ; 6841   000C 0014 0014 0008
        DECLE   $0036,  $0036,  $003E,  $0036   ; 6845   0036 0036 003E 0036
        DECLE   $0014,  $0014,  $0036,  $0036   ; 6849   0014 0014 0036 0036
        DECLE   $0000,  $0014,  $001C,  $005C   ; 684D   0000 0014 001C 005C
        DECLE   $005C,  $005C,  $003C,  $0000   ; 6851   005C 005C 003C 0000
        DECLE   $002E,  $0036,  $003E,  $0034   ; 6855   002E 0036 003E 0034
        DECLE   $0014,  $0016,  $0036,  $0030   ; 6859   0014 0016 0036 0030
        DECLE   $0000,  $0000,  $0000,  $0014   ; 685D   0000 0000 0000 0014
        DECLE   $001C,  $000C,  $0014,  $0014   ; 6861   001C 000C 0014 0014
        DECLE   $0008,  $0036,  $0036,  $003E   ; 6865   0008 0036 0036 003E
        DECLE   $0016,  $0030,  $0030,  $0000   ; 6869   0016 0030 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 686D   0000 0000 0000 0000
        DECLE   $0014,  $001C,  $0018,  $0018   ; 6871   0014 001C 0018 0018
        DECLE   $0000,  $003A,  $0036,  $003E   ; 6875   0000 003A 0036 003E
        DECLE   $0034,  $0006,  $0006,  $0000   ; 6879   0034 0006 0006 0000
        DECLE   $0000,  $0000,  $0000,  $0028   ; 687D   0000 0000 0000 0028
        DECLE   $0038,  $003A,  $003A,  $0002   ; 6881   0038 003A 003A 0002
        DECLE   $0078,  $0074,  $007C,  $002C   ; 6885   0078 0074 007C 002C
        DECLE   $0068,  $0068,  $000C,  $000C   ; 6889   0068 0068 000C 000C
        DECLE   $0000,  $0000,  $0014,  $001C   ; 688D   0000 0000 0014 001C
        DECLE   $0014,  $001C,  $001C,  $0028   ; 6891   0014 001C 001C 0028
        DECLE   $0054,  $005C,  $005C,  $005C   ; 6895   0054 005C 005C 005C
        DECLE   $003E,  $003E,  $0036,  $0036   ; 6899   003E 003E 0036 0036
        DECLE   $0000,  $0000,  $0014,  $001C   ; 689D   0000 0000 0014 001C
        DECLE   $0014,  $001C,  $001C,  $002A   ; 68A1   0014 001C 001C 002A
        DECLE   $0036,  $003E,  $003E,  $0036   ; 68A5   0036 003E 003E 0036
        DECLE   $0014,  $0014,  $0036,  $0036   ; 68A9   0014 0014 0036 0036
        DECLE   $0000,  $0014,  $001C,  $0014   ; 68AD   0000 0014 001C 0014
        DECLE   $009C,  $005C,  $005C,  $005C   ; 68B1   009C 005C 005C 005C
        DECLE   $002A,  $0036,  $003E,  $0034   ; 68B5   002A 0036 003E 0034
        DECLE   $0014,  $0016,  $0036,  $0030   ; 68B9   0014 0016 0036 0030
        DECLE   $0000,  $0000,  $0000,  $0014   ; 68BD   0000 0000 0000 0014
        DECLE   $003C,  $0054,  $005C,  $005C   ; 68C1   003C 0054 005C 005C
        DECLE   $005C,  $002A,  $0036,  $003E   ; 68C5   005C 002A 0036 003E
        DECLE   $0016,  $0030,  $0030,  $0000   ; 68C9   0016 0030 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68CD   0000 0000 0000 0000
        DECLE   $0014,  $001C,  $0014,  $001C   ; 68D1   0014 001C 0014 001C
        DECLE   $001C,  $002A,  $0036,  $003E   ; 68D5   001C 002A 0036 003E
        DECLE   $0034,  $0006,  $0006,  $0000   ; 68D9   0034 0006 0006 0000
        DECLE   $0000,  $0000,  $0000,  $0028   ; 68DD   0000 0000 0000 0028
        DECLE   $0039,  $002A,  $003A,  $003A   ; 68E1   0039 002A 003A 003A
        DECLE   $0054,  $006C,  $007C,  $002C   ; 68E5   0054 006C 007C 002C
        DECLE   $0068,  $0068,  $000C,  $000C   ; 68E9   0068 0068 000C 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68ED   0000 0000 0000 0000
        DECLE   $0008,  $0004,  $0002,  $0002   ; 68F1   0008 0004 0002 0002
        DECLE   $0002,  $0001,  $0001,  $0001   ; 68F5   0002 0001 0001 0001
        DECLE   $0000,  $0000,  $0001,  $0001   ; 68F9   0000 0000 0001 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0006,  $0001   ; 6901   0000 0000 0006 0001
        DECLE   $0001,  $0001,  $0000,  $0000   ; 6905   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0001   ; 6909   0000 0000 0001 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 690D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000C,  $0002   ; 6911   0000 0000 000C 0002
        DECLE   $0002,  $0000,  $0001,  $0001   ; 6915   0002 0000 0001 0001
        DECLE   $0001,  $0003,  $0002,  $0000   ; 6919   0001 0003 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 691D   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0004,  $0004   ; 6921   0000 0008 0004 0004
        DECLE   $0004,  $0002,  $0001,  $0001   ; 6925   0004 0002 0001 0001
        DECLE   $0001,  $0001,  $0003,  $0002   ; 6929   0001 0001 0003 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 692D   0000 0000 0000 0000
        DECLE   $0008,  $0004,  $0004,  $0004   ; 6931   0008 0004 0004 0004
        DECLE   $0002,  $0001,  $0001,  $0001   ; 6935   0002 0001 0001 0001
        DECLE   $0001,  $0003,  $0002,  $0003   ; 6939   0001 0003 0002 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 693D   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0008,  $0008   ; 6941   0000 0010 0008 0008
        DECLE   $0006,  $0001,  $0001,  $0001   ; 6945   0006 0001 0001 0001
        DECLE   $0001,  $0000,  $0002,  $0002   ; 6949   0001 0000 0002 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 694D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0030   ; 6951   0000 0000 0000 0030
        DECLE   $0008,  $0006,  $0001,  $0001   ; 6955   0008 0006 0001 0001
        DECLE   $0001,  $0002,  $0006,  $0000   ; 6959   0001 0002 0006 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 695D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0004   ; 6961   0000 0000 0018 0004
        DECLE   $0004,  $0003,  $0000,  $0000   ; 6965   0004 0003 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0001   ; 6969   0000 0000 0001 0001
        DECLE   $0000,  $0000,  $0008,  $000C   ; 696D   0000 0000 0008 000C
        DECLE   $000E,  $000E,  $000C,  $000C   ; 6971   000E 000E 000C 000C
        DECLE   $00F4,  $00FA,  $00FC,  $008C   ; 6975   00F4 00FA 00FC 008C
        DECLE   $0086,  $0086,  $0004,  $0086   ; 6979   0086 0086 0004 0086
        DECLE   $0000,  $0000,  $0000,  $0004   ; 697D   0000 0000 0000 0004
        DECLE   $0006,  $0007,  $0007,  $0006   ; 6981   0006 0007 0007 0006
        DECLE   $0006,  $007A,  $00FD,  $00FC   ; 6985   0006 007A 00FD 00FC
        DECLE   $00D8,  $0096,  $0092,  $0058   ; 6989   00D8 0096 0092 0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 698D   0000 0000 0000 0000
        DECLE   $0004                           ; 6991   0004

        CLRC                                    ; 6992   0006
        SETC                                    ; 6993   0007
        INCR    R7                              ; 6994   000F

        DECR    R4                              ; 6995   0014
L_6996:
        ADDR    R7,     R0                      ; 6996   00F8
        DECLE   $00FB,  $00F9,  $00D8,  $0030   ; 6997   00FB 00F9 00D8 0030
        DECLE   $0040,  $0000,  $0000,  $0000   ; 699B   0040 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $000C   ; 699F   0000 0000 0008 000C
        DECLE   $000E,  $000E,  $000C,  $00F4   ; 69A3   000E 000E 000C 00F4
        DECLE   $00FA,  $00FC,  $008C,  $0008   ; 69A7   00FA 00FC 008C 0008
        DECLE   $001A,  $0083,  $0000,  $0000   ; 69AB   001A 0083 0000 0000
        DECLE   $0008,  $000C,  $000E,  $000E   ; 69AF   0008 000C 000E 000E
        DECLE   $000C,  $0014,  $00FA,  $00FC   ; 69B3   000C 0014 00FA 00FC
        DECLE   $00FC,  $0098,  $0008,  $0008   ; 69B7   00FC 0098 0008 0008
        DECLE   $000C,  $000C,  $0000,  $0000   ; 69BB   000C 000C 0000 0000
        DECLE   $0010,  $0018,  $001C,  $001C   ; 69BF   0010 0018 001C 001C
        DECLE   $0018,  $000C,  $00F2,  $00FC   ; 69C3   0018 000C 00F2 00FC
        DECLE   $00FC,  $0098,  $008E,  $0082   ; 69C7   00FC 0098 008E 0082
        DECLE   $00D0,  $0018,  $0000,  $0000   ; 69CB   00D0 0018 0000 0000
        DECLE   $0000,  $0010,  $0018,  $001C   ; 69CF   0000 0010 0018 001C
        DECLE   $001C,  $0018,  $0008,  $00F4   ; 69D3   001C 0018 0008 00F4
        DECLE   $00FF,  $00F9,  $0080,  $00D0   ; 69D7   00FF 00F9 0080 00D0
        DECLE   $0070,  $0000,  $0000,  $0000   ; 69DB   0070 0000 0000 0000
        DECLE   $0000,  $0008,  $000C,  $000E   ; 69DF   0000 0008 000C 000E
        DECLE   $000E,  $000C,  $0004,  $007A   ; 69E3   000E 000C 0004 007A
        DECLE   $00FC,  $00FE,  $00C6,  $0042   ; 69E7   00FC 00FE 00C6 0042
        DECLE   $006B,  $0000,  $0000,  $0000   ; 69EB   006B 0000 0000 0000
        DECLE   $0008,  $001C,  $003C,  $0016   ; 69EF   0008 001C 003C 0016
        DECLE   $007F,  $00FF,  $007F,  $007E   ; 69F3   007F 00FF 007F 007E
        DECLE   $007E,  $007E,  $00FE,  $00FC   ; 69F7   007E 007E 00FE 00FC
        DECLE   $00FC,  $0074,  $0000,  $0000   ; 69FB   00FC 0074 0000 0000
        DECLE   $0008,  $001C,  $003C,  $0014   ; 69FF   0008 001C 003C 0014
        DECLE   $003E,  $007E,  $00FF,  $00FF   ; 6A03   003E 007E 00FF 00FF
        DECLE   $007F,  $007E,  $007E,  $003E   ; 6A07   007F 007E 007E 003E
        DECLE   $003E,  $003A,  $0000,  $0000   ; 6A0B   003E 003A 0000 0000
        DECLE   $0000,  $0070,  $0038,  $003C   ; 6A0F   0000 0070 0038 003C
        DECLE   $0028,  $003C,  $007C,  $00FE   ; 6A13   0028 003C 007C 00FE
        DECLE   $00FE,  $00FE,  $00FE,  $007E   ; 6A17   00FE 00FE 00FE 007E
        DECLE   $007E,  $005C,  $0000,  $0000   ; 6A1B   007E 005C 0000 0000
        DECLE   $0070,  $0038,  $003C,  $0028   ; 6A1F   0070 0038 003C 0028
        DECLE   $003C,  $007E,  $00FE,  $00FE   ; 6A23   003C 007E 00FE 00FE
        DECLE   $007E,  $007F,  $007F,  $003F   ; 6A27   007E 007F 007F 003F
        DECLE   $0037,  $0000,  $0000,  $0000   ; 6A2B   0037 0000 0000 0000
        DECLE   $0008,  $0018,  $003C,  $0016   ; 6A2F   0008 0018 003C 0016
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 6A33   007F 00FF 00FF 00FF
        DECLE   $00FF,  $007F,  $007F,  $007F   ; 6A37   00FF 007F 007F 007F
        DECLE   $003B,  $0000,  $0000,  $0000   ; 6A3B   003B 0000 0000 0000
        DECLE   $0000,  $000E,  $001C,  $003C   ; 6A3F   0000 000E 001C 003C
        DECLE   $0014,  $00FF,  $00FF,  $00FF   ; 6A43   0014 00FF 00FF 00FF
        DECLE   $007F,  $003F,  $003F,  $003F   ; 6A47   007F 003F 003F 003F
        DECLE   $003F,  $001D,  $0000,  $0000   ; 6A4B   003F 001D 0000 0000
        DECLE   $0000,  $000E,  $001C,  $00BC   ; 6A4F   0000 000E 001C 00BC
        DECLE   $00D5,  $00FF,  $00FF,  $007F   ; 6A53   00D5 00FF 00FF 007F
        DECLE   $007F,  $003F,  $003F,  $003E   ; 6A57   007F 003F 003F 003E
        DECLE   $001E,  $000E,  $0000,  $0000   ; 6A5B   001E 000E 0000 0000
        DECLE   $0000,  $000E,  $001C,  $003C   ; 6A5F   0000 000E 001C 003C
        DECLE   $0014,  $007C,  $00FE,  $00FE   ; 6A63   0014 007C 00FE 00FE
        DECLE   $007E,  $007E,  $003E,  $003F   ; 6A67   007E 007E 003E 003F
        DECLE   $003F                           ; 6A6B   003F
L_6A6C:
        DECR    R7                              ; 6A6C   0017

        DECLE   $0000,  $0000,  $0000,  $0030   ; 6A6D   0000 0000 0000 0030
        DECLE   $0074,  $006E,  $00F6,  $00FE   ; 6A71   0074 006E 00F6 00FE
        DECLE   $0092,  $00DA,  $0092,  $00FE   ; 6A75   0092 00DA 0092 00FE
        DECLE   $007C,  $0044,  $007C,  $0038   ; 6A79   007C 0044 007C 0038
        DECLE   $0000,  $0000,  $0000,  $0030   ; 6A7D   0000 0000 0000 0030
        DECLE   $0074,  $006E,  $00F6,  $00FE   ; 6A81   0074 006E 00F6 00FE
        DECLE   $0092,  $00DA,  $0092,  $00FE   ; 6A85   0092 00DA 0092 00FE
        DECLE   $007C,  $006C,  $007C,  $0038   ; 6A89   007C 006C 007C 0038
        DECLE   $0000,  $0000,  $0030,  $0074   ; 6A8D   0000 0000 0030 0074
        DECLE   $006E,  $00F6,  $00FE,  $0092   ; 6A91   006E 00F6 00FE 0092
        DECLE   $00DA,  $0092,  $00FE,  $007C   ; 6A95   00DA 0092 00FE 007C
        DECLE   $006C,  $006C,  $0038,  $0010   ; 6A99   006C 006C 0038 0010
        DECLE   $0000,  $0000,  $0030,  $0074   ; 6A9D   0000 0000 0030 0074
        DECLE   $006E,  $00F6,  $00FE,  $0092   ; 6AA1   006E 00F6 00FE 0092
        DECLE   $00B6,  $0092,  $00FE,  $006C   ; 6AA5   00B6 0092 00FE 006C
        DECLE   $0044,  $006C,  $0038,  $0010   ; 6AA9   0044 006C 0038 0010
        DECLE   $0000,  $0000,  $0030,  $0074   ; 6AAD   0000 0000 0030 0074
        DECLE   $006E,  $00F6,  $00FE,  $0092   ; 6AB1   006E 00F6 00FE 0092
        DECLE   $00B6,  $0092,  $00FE,  $006C   ; 6AB5   00B6 0092 00FE 006C
        DECLE   $0044,  $0044,  $0028,  $0010   ; 6AB9   0044 0044 0028 0010
        DECLE   $0000,  $0000,  $0030,  $0074   ; 6ABD   0000 0000 0030 0074
        DECLE   $006E,  $00F6,  $00FE,  $0092   ; 6AC1   006E 00F6 00FE 0092
        DECLE   $00DA,  $0092,  $00FE,  $006C   ; 6AC5   00DA 0092 00FE 006C
        DECLE   $0044,  $0054,  $0038,  $0010   ; 6AC9   0044 0054 0038 0010
        DECLE   $0000,  $0000,  $0000,  $003C   ; 6ACD   0000 0000 0000 003C
        DECLE   $003E,  $00DE,  $00D2,  $00B2   ; 6AD1   003E 00DE 00D2 00B2
        DECLE   $00D6,  $00F7,  $00FF,  $00FF   ; 6AD5   00D6 00F7 00FF 00FF
        DECLE   $007F,  $001F,  $000F,  $0000   ; 6AD9   007F 001F 000F 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 6ADD   0000 0000 0000 003C
        DECLE   $003E,  $00DE,  $00D2,  $00B2   ; 6AE1   003E 00DE 00D2 00B2
        DECLE   $00D6,  $00F7,  $00FF,  $00FE   ; 6AE5   00D6 00F7 00FF 00FE
        DECLE   $0079,  $001F,  $000F,  $0000   ; 6AE9   0079 001F 000F 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 6AED   0000 0000 0000 003C
        DECLE   $003E,  $00DE,  $00D2,  $00B2   ; 6AF1   003E 00DE 00D2 00B2
        DECLE   $00D6,  $00F7,  $00FF,  $00FE   ; 6AF5   00D6 00F7 00FF 00FE
        DECLE   $0078,  $0011,  $001F,  $000F   ; 6AF9   0078 0011 001F 000F
        DECLE   $0000,  $0000                   ; 6AFD   0000 0000

        RSWD    R4                              ; 6AFF   003C
        RSWD    R4                              ; 6B00   003C
        ADDR    R3,     R6                      ; 6B01   00DE
        ADDR    R2,     R2                      ; 6B02   00D2
        MOVR    R6,     R2                      ; 6B03   00B2
        ADDR    R2,     R7                      ; 6B04   00D7

        DECLE   $00F7,  $00FE,  $00F8,  $0070   ; 6B05   00F7 00FE 00F8 0070
        DECLE   $0011,  $001F,  $000F,  $0000   ; 6B09   0011 001F 000F 0000
        DECLE   $0000,  $0000,  $003C,  $003C   ; 6B0D   0000 0000 003C 003C
        DECLE   $00DE,  $00D2,  $00B6,  $00D3   ; 6B11   00DE 00D2 00B6 00D3
        DECLE   $00F7,  $00FE,  $00F8,  $0070   ; 6B15   00F7 00FE 00F8 0070
        DECLE   $0010,  $0011,  $001F,  $000F   ; 6B19   0010 0011 001F 000F
        DECLE   $0000,  $0000,  $003C,  $003C   ; 6B1D   0000 0000 003C 003C
        DECLE   $00DE,  $00D2,  $00B6,  $00D3   ; 6B21   00DE 00D2 00B6 00D3
        DECLE   $00F7,  $00FE,  $00F8,  $0071   ; 6B25   00F7 00FE 00F8 0071
        DECLE   $001F,  $000F,  $0000,  $0000   ; 6B29   001F 000F 0000 0000
        DECLE   $0000,  $0034,  $0018,  $0018   ; 6B2D   0000 0034 0018 0018
        DECLE   $0018,  $0018,  $002C,  $0000   ; 6B31   0018 0018 002C 0000
        DECLE   $0000,  $0000,  $0070,  $0040   ; 6B35   0000 0000 0070 0040
        DECLE   $0070,  $0010,  $0010,  $0070   ; 6B39   0070 0010 0010 0070
        DECLE   $0000,  $0018,  $0024,  $0024   ; 6B3D   0000 0018 0024 0024
        DECLE   $0024,  $0018,  $0000,  $0000   ; 6B41   0024 0018 0000 0000
        DECLE   $0070,  $0010,  $0030,  $0040   ; 6B45   0070 0010 0030 0040
        DECLE   $0040,  $0070,  $0000,  $0018   ; 6B49   0040 0070 0000 0018
        DECLE   $0024,  $0024,  $0018,  $0000   ; 6B4D   0024 0024 0018 0000
        DECLE   $0006,  $0009,  $0009,  $0006   ; 6B51   0006 0009 0009 0006
        DECLE   $00E0,  $0020,  $0040,  $0040   ; 6B55   00E0 0020 0040 0040
        DECLE   $0040,  $0000,  $0038,  $0020   ; 6B59   0040 0000 0038 0020
        DECLE   $0038,  $0008,  $0038,  $0000   ; 6B5D   0038 0008 0038 0000
        DECLE   $0006,  $0009,  $0009,  $0006   ; 6B61   0006 0009 0009 0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; 6B79   0000 0000 0000 0060
        DECLE   $000C,  $0066,  $0000,  $0000   ; 6B7D   000C 0066 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B89   0000 0000 0000 0000
        DECLE   $005B,  $0020,  $0000,  $0000   ; 6B8D   005B 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B95   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6B99   0000 0000

        SARC    R0,     1                       ; 6B9B   0078
        INCR    R7                              ; 6B9C   000F

        DECLE   $0000                           ; 6B9D   0000
L_6B9E:
        ADDR    R6,     R0                      ; 6B9E   00F0
        DECLE   $0007,  $0000,  $0000,  $0000   ; 6B9F   0007 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA7   0000 0000 0000 0000
        DECLE   $0000,  $007C,  $0000,  $004E   ; 6BAB   0000 007C 0000 004E
        DECLE   $0003,  $0000,  $0000,  $0000   ; 6BAF   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BB3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0066   ; 6BB7   0000 0000 0000 0066
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BBB   0000 0000 0000 0000
        DECLE   $0000,  $004D,  $0000,  $0000   ; 6BBF   0000 004D 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC7   0000 0000 0000 0000
        DECLE   $003E,  $0000,  $0000,  $0000   ; 6BCB   003E 0000 0000 0000
        DECLE   $003B,  $0000,  $0000,  $0000   ; 6BCF   003B 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD3   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $006A,  $0080   ; 6BD7   0000 0001 006A 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BDB   0000 0000 0000 0000
        DECLE   $0000,  $0012,  $0045,  $0080   ; 6BDF   0000 0012 0045 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $006D   ; 6BE7   0000 0000 0000 006D
        DECLE   $0080,  $0000,  $0000,  $0000   ; 6BEB   0080 0000 0000 0000
        DECLE   $0080,  $0051,  $0000,  $0000   ; 6BEF   0080 0051 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF3   0000 0000 0000 0000
        DECLE   $003C,  $007E,  $0000,  $0000   ; 6BF7   003C 007E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BFB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007E,  $007E   ; 6BFF   0000 0000 007E 007E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C03   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $007E,  $0000   ; 6C07   0000 003C 007E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C0B   0000 0000 0000 0000
        DECLE   $0000,  $007E,  $007E,  $0000   ; 6C0F   0000 007E 007E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C13   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $007E,  $0066   ; 6C17   0000 003C 007E 0066
        DECLE   $0066,  $0060,  $0060,  $0060   ; 6C1B   0066 0060 0060 0060
        DECLE   $006E,  $0062,  $0062,  $007E   ; 6C1F   006E 0062 0062 007E
        DECLE   $007E,  $003C,  $0000,  $003C   ; 6C23   007E 003C 0000 003C
        DECLE   $002C,  $000C,  $007C,  $006C   ; 6C27   002C 000C 007C 006C
        DECLE   $007E,  $0000,  $0000,  $0000   ; 6C2B   007E 0000 0000 0000
        DECLE   $003C,  $002C,  $000C,  $007C   ; 6C2F   003C 002C 000C 007C
        DECLE   $006C,  $007E,  $0000,  $0000   ; 6C33   006C 007E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0022   ; 6C37   0000 0000 0000 0022
        DECLE   $0077,  $007F,  $007F,  $006B   ; 6C3B   0077 007F 007F 006B
        DECLE   $006B,  $006B,  $0063,  $0063   ; 6C3F   006B 006B 0063 0063
        DECLE   $0063,  $0063,  $0000,  $0000   ; 6C43   0063 0063 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 6C47   0000 0000 0000 003C
        DECLE   $007C,  $0060,  $0060,  $0078   ; 6C4B   007C 0060 0060 0078
        DECLE   $0078,  $0060,  $0060,  $0060   ; 6C4F   0078 0060 0060 0060
        DECLE   $007C,  $003C,  $0000,  $0000   ; 6C53   007C 003C 0000 0000
        DECLE   $0000,  $003C,  $007E,  $0066   ; 6C57   0000 003C 007E 0066
        DECLE   $0066,  $0066,  $0066,  $0066   ; 6C5B   0066 0066 0066 0066
        DECLE   $0066,  $0066,  $0066,  $007E   ; 6C5F   0066 0066 0066 007E
        DECLE   $007E,  $003C,  $0000,  $0000   ; 6C63   007E 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0066   ; 6C67   0000 0000 0000 0066
        DECLE   $0066,  $0066,  $0066,  $0066   ; 6C6B   0066 0066 0066 0066
        DECLE   $0066,  $0066,  $0066,  $007E   ; 6C6F   0066 0066 0066 007E
        DECLE   $003C,  $0018,  $0000,  $0000   ; 6C73   003C 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001C   ; 6C77   0000 0000 0000 001C
        DECLE   $003E,  $0036,  $0036,  $0036   ; 6C7B   003E 0036 0036 0036
        DECLE   $003C,  $0038,  $003C,  $0036   ; 6C7F   003C 0038 003C 0036
        DECLE   $0036,  $0036                   ; 6C83   0036 0036
L_6C85:
        PSHR    R5                              ; 6C85   0275
        MVI     .ISRVEC.0,R1                    ; 6C86   0281 0100
        MVO     R1,     G_01C2                  ; 6C88   0241 01C2
        MVI     .ISRVEC.1,R1                    ; 6C8A   0281 0101
        MVO     R1,     G_01C3                  ; 6C8C   0241 01C3
        SDBD                                    ; 6C8E   0001
        MVII    #$6D61, R1                      ; 6C8F   02B9 0061 006D
        MOVR    R1,     R2                      ; 6C92   008A
        ANDI    #$00FF, R1                      ; 6C93   03B9 00FF
        SWAP    R2,     1                       ; 6C95   0042
        ANDI    #$00FF, R2                      ; 6C96   03BA 00FF
        MVO     R1,     .ISRVEC.0               ; 6C98   0241 0100
        MVO     R2,     .ISRVEC.1               ; 6C9A   0242 0101
        MVII    #$0018, R1                      ; 6C9C   02B9 0018
        MOVR    R1,     R2                      ; 6C9E   008A
        MVII    #$0001, R3                      ; 6C9F   02BB 0001
        MOVR    R3,     R4                      ; 6CA1   009C
L_6CA2:
        PSHR    R1                              ; 6CA2   0271
        PSHR    R2                              ; 6CA3   0272
        MVO     R1,     G_01C4                  ; 6CA4   0241 01C4
        MVO     R2,     G_01C5                  ; 6CA6   0242 01C5

        JSR     R5,     L_5B69                  ; 6CA8   0004 0158 0369

        PULR    R2                              ; 6CAB   02B2
        PULR    R1                              ; 6CAC   02B1
        MOVR    R0,     R5                      ; 6CAD   0085
        MVII    #$0008, R0                      ; 6CAE   02B8 0008
        SUBI    #$000B, R5                      ; 6CB0   033D 000B
        BMI     L_6CA2                          ; 6CB2   022B 0011
        BEQ     L_6CC2                          ; 6CB4   0204 000C

        DECR    R5                              ; 6CB6   0015
        INCR    R5                              ; 6CB7   000D
        ADDR    R7,     R5                      ; 6CB8   00FD
        ADD@    R5,     R7                      ; 6CB9   02EF

        DECLE   $001B,  $0036,  $0024,  $002D   ; 6CBA   001B 0036 0024 002D
        DECLE   $003F                           ; 6CBE   003F

        SAR     R2,     1                       ; 6CBF   006A
        SLL     R2,     2                       ; 6CC0   004E
        SLLC    R1,     2                       ; 6CC1   005D
L_6CC2:
        CLRR    R0                              ; 6CC2   01C0
        MVO     R0,     G_01C4                  ; 6CC3   0240 01C4
        SDBD                                    ; 6CC5   0001
        MVII    #$0500, R0                      ; 6CC6   02B8 0000 0005
L_6CC9:
        DECR    R0                              ; 6CC9   0010
        BNEQ    L_6CC9                          ; 6CCA   022C 0002

        MVI     G_01C2, R1                      ; 6CCC   0281 01C2
        MVI     G_01C3, R2                      ; 6CCE   0282 01C3
        MVO     R1,     .ISRVEC.0               ; 6CD0   0241 0100
        MVO     R2,     .ISRVEC.1               ; 6CD2   0242 0101
        PULR    R7                              ; 6CD4   02B7

        CMPI    #$0018, R2                      ; 6CD5   037A 0018
        BEQ     L_6CA2                          ; 6CD7   0224 0036

        SUBR    R0,     R2                      ; 6CD9   0102
        SUBI    #$0002, R4                      ; 6CDA   033C 0002
        B       L_6CA2                          ; 6CDC   0220 003B

        CMPI    #$0018, R1                      ; 6CDE   0379 0018
        BEQ     L_6CA2                          ; 6CE0   0224 003F

        SUBR    R0,     R1                      ; 6CE2   0101
        SUBI    #$0002, R3                      ; 6CE3   033B 0002
        B       L_6CA2                          ; 6CE5   0220 0044

        CMPI    #$0090, R1                      ; 6CE7   0379 0090
        BEQ     L_6CA2                          ; 6CE9   0224 0048

        ADDR    R0,     R1                      ; 6CEB   00C1
        ADDI    #$0002, R3                      ; 6CEC   02FB 0002
        B       L_6CA2                          ; 6CEE   0220 004D

        CMPI    #$0050, R2                      ; 6CF0   037A 0050
        BEQ     L_6CA2                          ; 6CF2   0224 0051

        ADDR    R0,     R2                      ; 6CF4   00C2
        ADDI    #$0002, R4                      ; 6CF5   02FC 0002
        B       L_6CA2                          ; 6CF7   0220 0056

        CMPI    #$0018, R2                      ; 6CF9   037A 0018
        BEQ     L_6CA2                          ; 6CFB   0224 005A

        MVO     R1,     G_01C6                  ; 6CFD   0241 01C6
        MVO     R2,     G_01C7                  ; 6CFF   0242 01C7
        CLRR    R1                              ; 6D01   01C9
        SDBD                                    ; 6D02   0001
        MVII    #$FFFF, R2                      ; 6D03   02BA 00FF 00FF
        B       L_6D2F                          ; 6D06   0200 0027

        CMPI    #$0018, R1                      ; 6D08   0379 0018
        BEQ     L_6CA2                          ; 6D0A   0224 0069

        MVO     R1,     G_01C6                  ; 6D0C   0241 01C6
        MVO     R2,     G_01C7                  ; 6D0E   0242 01C7
        SDBD                                    ; 6D10   0001
        MVII    #$FFFF, R1                      ; 6D11   02B9 00FF 00FF
        CLRR    R2                              ; 6D14   01D2
        B       L_6D2F                          ; 6D15   0200 0018

        CMPI    #$0090, R1                      ; 6D17   0379 0090
        BEQ     L_6CA2                          ; 6D19   0224 0078

        MVO     R1,     G_01C6                  ; 6D1B   0241 01C6
        MVO     R2,     G_01C7                  ; 6D1D   0242 01C7
        MVII    #$0001, R1                      ; 6D1F   02B9 0001
        CLRR    R2                              ; 6D21   01D2
        B       L_6D2F                          ; 6D22   0200 000B

        CMPI    #$0050, R2                      ; 6D24   037A 0050
        BEQ     L_6CA2                          ; 6D26   0224 0085

        MVO     R1,     G_01C6                  ; 6D28   0241 01C6
        MVO     R2,     G_01C7                  ; 6D2A   0242 01C7
        CLRR    R1                              ; 6D2C   01C9
        MVII    #$0001, R2                      ; 6D2D   02BA 0001
L_6D2F:
        ADDR    R3,     R1                      ; 6D2F   00D9
        ADDR    R4,     R2                      ; 6D30   00E2
        MVO     R1,     G_01C0                  ; 6D31   0241 01C0
        MVO     R2,     G_01C1                  ; 6D33   0242 01C1
        MVO     R3,     G_01C8                  ; 6D35   0243 01C8
        MVO     R4,     G_01C9                  ; 6D37   0244 01C9
        INCR    R0                              ; 6D39   0008

        JSR     R5,     L_518B                  ; 6D3A   0004 0150 018B
        JSR     R5,     L_520E                  ; 6D3D   0004 0150 020E

        TSTR    R0                              ; 6D40   0080
        BNEQ    L_6D4D                          ; 6D41   020C 000A

        MVI     G_01C6, R1                      ; 6D43   0281 01C6
        MVI     G_01C7, R2                      ; 6D45   0282 01C7
        MVI     G_01C8, R3                      ; 6D47   0283 01C8
        MVI     G_01C9, R4                      ; 6D49   0284 01C9
        B       L_6CA2                          ; 6D4B   0220 00AA

L_6D4D:
        MVI     G_01C0, R1                      ; 6D4D   0281 01C0
        MVI     G_01C1, R2                      ; 6D4F   0282 01C1

        JSR     R5,     L_518B                  ; 6D51   0004 0150 018B
        JSR     R5,     L_520E                  ; 6D54   0004 0150 020E

        MVI     G_01C6, R1                      ; 6D57   0281 01C6
        MVI     G_01C7, R2                      ; 6D59   0282 01C7
        MVI     G_01C8, R3                      ; 6D5B   0283 01C8
        MVI     G_01C9, R4                      ; 6D5D   0284 01C9
        B       L_6CA2                          ; 6D5F   0220 00BE

        PSHR    R5                              ; 6D61   0275
        MVI     G_01C4, R0                      ; 6D62   0280 01C4
        XORI    #$0200, R0                      ; 6D64   03F8 0200
        MVO     R0,     .STIC.X.0               ; 6D66   0240 0000
        MVI     G_01C5, R0                      ; 6D68   0280 01C5
        XORI    #$0100, R0                      ; 6D6A   03F8 0100
        MVO     R0,     .STIC.Y.0               ; 6D6C   0240 0008
        SDBD                                    ; 6D6E   0001
        MVII    #$22FA, R0                      ; 6D6F   02B8 00FA 0022
        MVO     R0,     .STIC.A.0               ; 6D72   0240 0010
        MVII    #$01C2, R4                      ; 6D74   02BC 01C2
        PULR    R5                              ; 6D76   02B5
        SDBD                                    ; 6D77   0001
        MVI@    R4,     R7                      ; 6D78   02A7

L_6D79:
        JSR     R4,     X_SFX_OK                ; 6D79   0004 001C 02AD

        PSHR    R5                              ; 6D7C   0275
        MVI     G_0171, R0                      ; 6D7D   0280 0171
        TSTR    R0                              ; 6D7F   0080
        BEQ     L_6D96                          ; 6D80   0204 0014

        MVI     G_01CA, R0                      ; 6D82   0280 01CA
        DECR    R0                              ; 6D84   0010
        BMI     L_6D8A                          ; 6D85   020B 0003

        MVO     R0,     G_01CA                  ; 6D87   0240 01CA
        PULR    R7                              ; 6D89   02B7

L_6D8A:
        JSR     R5,     L_6DA2                  ; 6D8A   0004 016C 01A2

        MVII    #$0003, R0                      ; 6D8D   02B8 0003

        JSR     R5,     X_RAND2                 ; 6D8F   0004 0114 029E

        ADDI    #$0003, R0                      ; 6D92   02F8 0003
        MVO     R0,     G_01CA                  ; 6D94   0240 01CA
L_6D96:
        PULR    R7                              ; 6D96   02B7

L_6D97:
        PSHR    R5                              ; 6D97   0275

        JSR     R5,     X_PLAY_SFX2             ; 6D98   0004 0118 03BE
        DECLE   $0090                           ; 6D9B  SFX prio
        DECLE   $0035                           ; 6D9C   0035

        MOVR    R1,     R7                      ; 6D9D   008F

        COMR    R5                              ; 6D9E   001D
        ADDR    R1,     R7                      ; 6D9F   00CF
        B       L_6D8A                          ; 6DA0   0220 0017

L_6DA2:
        PSHR    R5                              ; 6DA2   0275
        MVII    #$0004, R0                      ; 6DA3   02B8 0004
        MVO     R0,     G_01CB                  ; 6DA5   0240 01CB
        MVII    #$0002, R0                      ; 6DA7   02B8 0002
        MVO     R0,     G_01CD                  ; 6DA9   0240 01CD

        JSR     R5,     X_PLAY_SFX2             ; 6DAB   0004 0118 03BE
        DECLE   $0003                           ; 6DAE  SFX prio
        DECLE   $0079,  $03B7,  $002D,  $001C   ; 6DAF   0079 03B7 002D 001C
        DECLE   $01DC,  $000B,  $006B,  $0035   ; 6DB3   01DC 000B 006B 0035
        DECLE   $006B,  $03B7                   ; 6DB7   006B 03B7

        SAR     R1,     2                       ; 6DB9   006D
        ADCR    R4                              ; 6DBA   002C
        XORR    R0,     R4                      ; 6DBB   01C4
        INCR    R7                              ; 6DBC   000F

        DECLE   $0001                           ; 6DBD   0001
L_6DBE:
        INCR    R3                              ; 6DBE   000B
        SUBR    R5,     R3                      ; 6DBF   012B
        CMP@    R1,     R5                      ; 6DC0   034D
        ANDR    R1,     R4                      ; 6DC1   018C
        ANDR    R5,     R0                      ; 6DC2   01A8
        INCR    R3                              ; 6DC3   000B
        MOVR    R1,     R7                      ; 6DC4   008F

        DECLE   $0383,  $008F,  $0383,  $00CF   ; 6DC5   0383 008F 0383 00CF
        DECLE   $02BB,  $01F0,  $0004,  $0174   ; 6DC9   02BB 01F0 0004 0174
        DECLE   $01A0,  $02BB,  $00F0,  $0004   ; 6DCD   01A0 02BB 00F0 0004

        CMPR    R6,     R4                      ; 6DD1   0174
        ANDR    R4,     R0                      ; 6DD2   01A0
        CLRR    R0                              ; 6DD3   01C0
        MVO     R0,     G_01D5                  ; 6DD4   0240 01D5
L_6DD6:
        MVII    #$0003, R0                      ; 6DD6   02B8 0003
        MVO     R0,     G_01CD                  ; 6DD8   0240 01CD
        PULR    R7                              ; 6DDA   02B7

        PSHR    R5                              ; 6DDB   0275
        MVI     G_0102, R1                      ; 6DDC   0281 0102
        CMPI    #$0081, R1                      ; 6DDE   0379 0081
        BEQ     L_6EB9                          ; 6DE0   0204 00D7

        MVI     G_01CB, R1                      ; 6DE2   0281 01CB
        TSTR    R1                              ; 6DE4   0089
        BEQ     L_6DF6                          ; 6DE5   0204 000F

        DECR    R1                              ; 6DE7   0011
        MVO     R1,     G_01CB                  ; 6DE8   0241 01CB
        ANDI    #$0001, R1                      ; 6DEA   03B9 0001
        CMPI    #$0001, R1                      ; 6DEC   0379 0001
        BNEQ    L_6DF2                          ; 6DEE   020C 0002

        MVII    #$0007, R1                      ; 6DF0   02B9 0007
L_6DF2:
        MVO     R1,     .STIC.CS.0              ; 6DF2   0241 0028
        MVO     R1,     .STIC.CS.2              ; 6DF4   0241 002A
L_6DF6:
        MVO     R1,     .STIC.VIDEN             ; 6DF6   0241 0020
        MVI     G_01D7, R1                      ; 6DF8   0281 01D7
        CLRR    R0                              ; 6DFA   01C0
        CMPI    #$0002, R1                      ; 6DFB   0379 0002
        BNEQ    L_6E0F                          ; 6DFD   020C 0010

        MVO     R0,     .STIC.X.0               ; 6DFF   0240 0000
        MVO     R0,     .STIC.X.1               ; 6E01   0240 0001
        MVO     R0,     .STIC.X.2               ; 6E03   0240 0002
        MVO     R0,     .STIC.X.3               ; 6E05   0240 0003
        MVO     R0,     .STIC.X.4               ; 6E07   0240 0004
        MVO     R0,     .STIC.X.5               ; 6E09   0240 0005
        MVO     R0,     .STIC.X.6               ; 6E0B   0240 0006
        MVO     R0,     .STIC.X.7               ; 6E0D   0240 0007
L_6E0F:
        MVO     R0,     G_01D7                  ; 6E0F   0240 01D7
        MVI     G_019E, R1                      ; 6E11   0281 019E
        CMP     G_01D1, R1                      ; 6E13   0341 01D1
        BEQ     L_6E62                          ; 6E15   0204 004B

        MVO     R1,     G_01D1                  ; 6E17   0241 01D1
        MVII    #$0004, R0                      ; 6E19   02B8 0004
        SDBD                                    ; 6E1B   0001
        MVII    #$6F83, R4                      ; 6E1C   02BC 0083 006F
L_6E1F:
        MVI@    R4,     R1                      ; 6E1F   02A1
        MVI@    R4,     R2                      ; 6E20   02A2
        SDBD                                    ; 6E21   0001
        XORI    #$0803, R2                      ; 6E22   03FA 0003 0008
        MVO@    R2,     R1                      ; 6E25   024A
        DECR    R0                              ; 6E26   0010
        BNEQ    L_6E1F                          ; 6E27   022C 0009

        MVI     G_01D1, R0                      ; 6E29   0280 01D1

        JSR     R5,     X_CLAMP                 ; 6E2B   0004 0114 0270
        DECLE   $0000                           ; 6E2E   0000

        INCR    R3                              ; 6E2F   000B
        MOVR    R0,     R1                      ; 6E30   0081
        SDBD                                    ; 6E31   0001
        MVII    #$6F8B, R2                      ; 6E32   02BA 008B 006F
        ADDR    R1,     R2                      ; 6E35   00CA
        MVI@    R2,     R2                      ; 6E36   0292
        MVI@    R2,     R4                      ; 6E37   0294
        ANDI    #$01F8, R4                      ; 6E38   03BC 01F8
        PSHR    R1                              ; 6E3A   0271
        SDBD                                    ; 6E3B   0001
        MVII    #$3908, R1                      ; 6E3C   02B9 0008 0039
        SDBD                                    ; 6E3F   0001
        ADDI    #$3800, R4                      ; 6E40   02FC 0000 0038
        MVII    #$0008, R0                      ; 6E43   02B8 0008

        JSR     R5,     .EXEC.730               ; 6E45   0004 0114 0330

        PULR    R1                              ; 6E48   02B1
        SDBD                                    ; 6E49   0001
        MVII    #$090B, R0                      ; 6E4A   02B8 000B 0009
        MVO@    R0,     R2                      ; 6E4D   0250
        SLL     R1,     2                       ; 6E4E   004D
        SDBD                                    ; 6E4F   0001
        ADDI    #$62BB, R1                      ; 6E50   02F9 00BB 0062
        MOVR    R1,     R4                      ; 6E53   008C
        MVI@    R4,     R1                      ; 6E54   02A1
        SDBD                                    ; 6E55   0001
        ADDI    #$3908, R1                      ; 6E56   02F9 0008 0039
        MVII    #$0003, R0                      ; 6E59   02B8 0003
        MVO     R1,     .STIC.VIDEN             ; 6E5B   0241 0020

        JSR     R5,     .EXEC.730               ; 6E5D   0004 0114 0330

        MVO     R1,     .STIC.VIDEN             ; 6E60   0241 0020
L_6E62:
        MVI     G_01B1, R0                      ; 6E62   0280 01B1
        CMPI    #$0001, R0                      ; 6E64   0378 0001
        BNEQ    L_6E6E                          ; 6E66   020C 0006

        MVI     .PSG0.lft_hand,R0               ; 6E68   0280 01FF
        AND     .PSG0.rgt_hand,R0               ; 6E6A   0380 01FE
        B       L_6E7A                          ; 6E6C   0200 000C

L_6E6E:
        MVI     G_0170, R0                      ; 6E6E   0280 0170
        CMPI    #$0000, R0                      ; 6E70   0378 0000
        BNEQ    L_6E78                          ; 6E72   020C 0004

        MVI     .PSG0.lft_hand,R0               ; 6E74   0280 01FF
        B       L_6E7A                          ; 6E76   0200 0002

L_6E78:
        MVI     .PSG0.rgt_hand,R0               ; 6E78   0280 01FE
L_6E7A:
        CMP     G_01D0, R0                      ; 6E7A   0340 01D0
        BEQ     L_6E82                          ; 6E7C   0204 0004

        MVO     R0,     G_01D0                  ; 6E7E   0240 01D0
        B       L_6EB9                          ; 6E80   0200 0037

L_6E82:
        CMP     G_01D2, R0                      ; 6E82   0340 01D2
        BEQ     L_6EB9                          ; 6E84   0204 0033

        MVO     R0,     G_01D2                  ; 6E86   0240 01D2
        CMPI    #$00FF, R0                      ; 6E88   0378 00FF
        BNEQ    L_6E92                          ; 6E8A   020C 0006

        SDBD                                    ; 6E8C   0001
        MVII    #$FFFF, R0                      ; 6E8D   02B8 00FF 00FF
        B       L_6EB6                          ; 6E90   0200 0024

L_6E92:
        MOVR    R0,     R1                      ; 6E92   0081
        SLR     R1,     2                       ; 6E93   0065
        SLR     R1,     2                       ; 6E94   0065
        SLR     R1,     1                       ; 6E95   0061
        ANDI    #$000F, R0                      ; 6E96   03B8 000F
        INCR    R1                              ; 6E98   0009
        ADDR    R7,     R1                      ; 6E99   00F9
        ADD@    R1,     R7                      ; 6E9A   02CF

        COMR    R6                              ; 6E9B   001E
        INCR    R0                              ; 6E9C   0008
        INCR    R0                              ; 6E9D   0008
        COMR    R6                              ; 6E9E   001E
        INCR    R0                              ; 6E9F   0008
        COMR    R6                              ; 6EA0   001E
        COMR    R6                              ; 6EA1   001E
        INCR    R0                              ; 6EA2   0008
        SDBD                                    ; 6EA3   0001
        MVII    #$6F7B, R4                      ; 6EA4   02BC 007B 006F
        MOVR    R0,     R1                      ; 6EA7   0081
        MVII    #$0001, R0                      ; 6EA8   02B8 0001
L_6EAA:
        MOVR    R1,     R2                      ; 6EAA   008A
        AND@    R4,     R2                      ; 6EAB   03A2
        CMP@    R4,     R2                      ; 6EAC   0362
        BEQ     L_6EB6                          ; 6EAD   0204 0007

        SLL     R0,     1                       ; 6EAF   0048
        CMPI    #$0010, R0                      ; 6EB0   0378 0010
        BNEQ    L_6EAA                          ; 6EB2   022C 0009
        B       L_6EB9                          ; 6EB4   0200 0003

L_6EB6:
        JSR     R5,     L_53B1                  ; 6EB6   0004 0150 03B1
L_6EB9:
        JSR     R5,     X_DEF_ISR               ; 6EB9   0004 0110 0126

        MVI     G_0102, R0                      ; 6EBC   0280 0102
        CMPI    #$0081, R0                      ; 6EBE   0378 0081
        BEQ     L_6F75                          ; 6EC0   0204 00B3

L_6EC2:
        CLRR    R0                              ; 6EC2   01C0
        MVI     G_01BD, R1                      ; 6EC3   0281 01BD
        INCR    R1                              ; 6EC5   0009
        ADDR    R7,     R1                      ; 6EC6   00F9
        ADD@    R1,     R7                      ; 6EC7   02CF

        INCR    R3                              ; 6EC8   000B
        DIS                                     ; 6EC9   0003
        SETC                                    ; 6ECA   0007
        MVO     R0,     .PSG0.chn_a_vol         ; 6ECB   0240 01FB
        B       L_6ED3                          ; 6ECD   0200 0004

        MVO     R0,     .PSG0.chn_b_vol         ; 6ECF   0240 01FC
        MVO     R0,     .PSG0.chn_c_vol         ; 6ED1   0240 01FD
L_6ED3:
        MVI     G_01CD, R1                      ; 6ED3   0281 01CD
        INCR    R1                              ; 6ED5   0009
        ADDR    R7,     R1                      ; 6ED6   00F9
        ADD@    R1,     R7                      ; 6ED7   02CF

        DECLE   $0005                           ; 6ED8   0005

        GSWD    R2                              ; 6ED9   0032
        MOVR    R3,     R5                      ; 6EDA   009D
        RRC     R1,     1                       ; 6EDB   0071
        MOVR    R4,     R2                      ; 6EDC   00A2
        MVII    #$01FB, R3                      ; 6EDD   02BB 01FB
L_6EDF:
        MVI@    R3,     R0                      ; 6EDF   0298

        JSR     R5,     X_CLAMP                 ; 6EE0   0004 0114 0270
        DECLE   $0000                           ; 6EE3   0000

        INCR    R4                              ; 6EE4   000C
        MVO@    R0,     R3                      ; 6EE5   0258
        INCR    R3                              ; 6EE6   000B
        CMPI    #$01FE, R3                      ; 6EE7   037B 01FE
        BNEQ    L_6EDF                          ; 6EE9   022C 000B

        MVI     G_01D3, R1                      ; 6EEB   0281 01D3
        INCR    R1                              ; 6EED   0009
        ANDI    #$0003, R1                      ; 6EEE   03B9 0003
        MVO     R1,     G_01D3                  ; 6EF0   0241 01D3
        SLL     R1,     2                       ; 6EF2   004D
        SLL     R1,     2                       ; 6EF3   004D
        SDBD                                    ; 6EF4   0001
        ADDI    #$4100, R1                      ; 6EF5   02F9 0000 0041
        PSHR    R1                              ; 6EF8   0271
        MVII    #$000E, R0                      ; 6EF9   02B8 000E
        MOVR    R1,     R4                      ; 6EFB   008C
        MVII    #$00F0, R1                      ; 6EFC   02B9 00F0

        JSR     R5,     .EXEC.730               ; 6EFE   0004 0114 0330

        MVII    #$000E, R0                      ; 6F01   02B8 000E
        PULR    R1                              ; 6F03   02B1
        MVII    #$01F0, R4                      ; 6F04   02BC 01F0

        JSR     R5,     .EXEC.730               ; 6F06   0004 0114 0330

        PULR    R7                              ; 6F09   02B7

        MVI     G_01CC, R0                      ; 6F0A   0280 01CC
        DECR    R0                              ; 6F0C   0010
        BLE     L_6F12                          ; 6F0D   0206 0003

        MVO     R0,     G_01CC                  ; 6F0F   0240 01CC
        PULR    R7                              ; 6F11   02B7

L_6F12:
        MVI     G_0318, R4                      ; 6F12   0284 0318
        DECLE   $02A0,  $0378,  $00FF,  $0204   ; 6F14   02A0 0378 00FF 0204
        DECLE   $001F,  $0240,  $01CC,  $02A2   ; 6F18   001F 0240 01CC 02A2
        DECLE   $037A,  $00FF,  $0204,  $001C   ; 6F1C   037A 00FF 0204 001C
        DECLE   $0274,  $0090,  $03BA,  $007F   ; 6F20   0274 0090 03BA 007F
        DECLE   $0004,  $0170,  $0365,  $0048   ; 6F24   0004 0170 0365 0048
        DECLE   $0040,  $03B8,  $0007,  $0004   ; 6F28   0040 03B8 0007 0004
        DECLE   $0174,  $0153,  $02B4,  $02B9   ; 6F2C   0174 0153 02B4 02B9
        DECLE   $000C,  $0244,  $0318,  $0004   ; 6F30   000C 0244 0318 0004

        CMPR    R6,     R4                      ; 6F34   0174
        CMPR    R4,     R3                      ; 6F35   0163
        B       L_6EC2                          ; 6F36   0220 0075

        CLRR    R0                              ; 6F38   01C0
        MVO     R0,     G_01CD                  ; 6F39   0240 01CD
        PULR    R7                              ; 6F3B   02B7

        DECLE   $0244,  $0318,  $02BB,  $01F0   ; 6F3C   0244 0318 02BB 01F0
        DECLE   $0004,  $0174,  $01A0,  $02BB   ; 6F40   0004 0174 01A0 02BB
        DECLE   $00F0,  $0004                   ; 6F44   00F0 0004

        CMPR    R6,     R4                      ; 6F46   0174
        ANDR    R4,     R0                      ; 6F47   01A0
        PULR    R7                              ; 6F48   02B7

        MVI     G_01CC, R0                      ; 6F49   0280 01CC
        DECR    R0                              ; 6F4B   0010
        BLE     L_6F51                          ; 6F4C   0206 0003

        MVO     R0,     G_01CC                  ; 6F4E   0240 01CC
        PULR    R7                              ; 6F50   02B7

L_6F51:
        MVII    #$003C, R0                      ; 6F51   02B8 003C
        MVO     R0,     G_01CC                  ; 6F53   0240 01CC
        MVI     G_01D5, R2                      ; 6F55   0282 01D5
        INCR    R2                              ; 6F57   000A
        CMPI    #$0060, R2                      ; 6F58   037A 0060
        BNEQ    L_6F5D                          ; 6F5A   020C 0001

        CLRR    R2                              ; 6F5C   01D2
L_6F5D:
        MVO     R2,     G_01D5                  ; 6F5D   0242 01D5
        DECLE   $0004                           ; 6F5F   0004

        CMPR    R6,     R0                      ; 6F60   0170
        CMP@    R4,     R5                      ; 6F61   0365
        MVI     G_01D4, R0                      ; 6F62   0280 01D4
        INCR    R0                              ; 6F64   0008
        CMPI    #$0006, R0                      ; 6F65   0378 0006
        BNEQ    L_6F6A                          ; 6F67   020C 0001

        CLRR    R0                              ; 6F69   01C0
L_6F6A:
        MVO     R0,     G_01D4                  ; 6F6A   0240 01D4
        DECLE   $0004,  $0174,  $0153,  $02B9   ; 6F6C   0004 0174 0153 02B9
        DECLE   $000A,  $0004                   ; 6F70   000A 0004

        CMPR    R6,     R4                      ; 6F72   0174
        CMPR    R4,     R3                      ; 6F73   0163
        PULR    R7                              ; 6F74   02B7

L_6F75:
        MVII    #$00F0, R3                      ; 6F75   02BB 00F0
        DECLE   $0004                           ; 6F77   0004

        CMPR    R6,     R4                      ; 6F78   0174
        ANDR    R4,     R0                      ; 6F79   01A0
        PULR    R7                              ; 6F7A   02B7

        INCR    R5                              ; 6F7B   000D
        INCR    R4                              ; 6F7C   000C
        INCR    R3                              ; 6F7D   000B
        INCR    R1                              ; 6F7E   0009
        SETC                                    ; 6F7F   0007
        DIS                                     ; 6F80   0003
L_6F81:
        INCR    R6                              ; 6F81   000E
        CLRC                                    ; 6F82   0006
        ADD@    R2,     R1                      ; 6F83   02D1
        ADDR    R5,     R0                      ; 6F84   00E8
        ADD@    R2,     R2                      ; 6F85   02D2
        ADDR    R6,     R0                      ; 6F86   00F0
        ADD@    R4,     R6                      ; 6F87   02E6
        ADDR    R7,     R0                      ; 6F88   00F8
        ADD@    R4,     R5                      ; 6F89   02E5
        SUBR    R0,     R0                      ; 6F8A   0100
        ADD@    R2,     R2                      ; 6F8B   02D2
        ADD@    R2,     R2                      ; 6F8C   02D2
        ADD@    R4,     R6                      ; 6F8D   02E6
        ADD@    R4,     R6                      ; 6F8E   02E6
        ADD@    R4,     R6                      ; 6F8F   02E6
        ADD@    R4,     R6                      ; 6F90   02E6
        ADD@    R4,     R5                      ; 6F91   02E5
        ADD@    R4,     R5                      ; 6F92   02E5
        ADD@    R2,     R1                      ; 6F93   02D1
        ADD@    R2,     R1                      ; 6F94   02D1
        ADD@    R2,     R1                      ; 6F95   02D1
        ADD@    R2,     R1                      ; 6F96   02D1
L_6F97:
        PSHR    R5                              ; 6F97   0275
        SDBD                                    ; 6F98   0001
        MVII    #$6FD5, R0                      ; 6F99   02B8 00D5 006F
        MVO     R0,     G_0318                  ; 6F9C   0240 0318
        CLRR    R0                              ; 6F9E   01C0
        MVO     R0,     G_01CD                  ; 6F9F   0240 01CD

        JSR     R5,     X_PLAY_MUS2             ; 6FA1   0004 0118 035D
        DECLE   $03F4,  $000F                   ; 6FA4  Note (long)
        DECLE   $0214                           ; 6FA6  Note (short)
        DECLE   $01F4                           ; 6FA7  Note (short)
        DECLE   $03F2,  $0217                   ; 6FA8  Note (long)
        DECLE   $000B                           ; 6FAA  Note (short)
        DECLE   $01F2                           ; 6FAB  Note (short)
        DECLE   $01D2                           ; 6FAC  Note (short)
        DECLE   $01C4                           ; 6FAD  Note (short)
        DECLE   $01A4                           ; 6FAE  Note (short)
        DECLE   $0197                           ; 6FAF  Note (short)
        DECLE   $03F4,  $01A4                   ; 6FB0  Note (long)
        DECLE   $03F2,  $000C                   ; 6FB2  Note (long)
        DECLE   $0154                           ; 6FB4  Note (short)
        DECLE   $0134                           ; 6FB5  Note (short)
        DECLE   $03F2,  $0157                   ; 6FB6  Note (long)
        DECLE   $000D                           ; 6FB8  Note (short)
        DECLE   $0105                           ; 6FB9  Note (short)
        DECLE   $0115                           ; 6FBA  Note (short)
        DECLE   $00D3                           ; 6FBB  Note (short)
        DECLE   $03F4,  $00E1                   ; 6FBC  Note (long)
        DECLE   $03F2,  $000C                   ; 6FBE  Note (long)
        DECLE   $0094                           ; 6FC0  Note (short)
        DECLE   $0074                           ; 6FC1  Note (short)
        DECLE   $03F2,  $0097                   ; 6FC2  Note (long)
        DECLE   $000E                           ; 6FC4  Note (short)
        DECLE   $0072                           ; 6FC5  Note (short)
        DECLE   $0052                           ; 6FC6  Note (short)
        DECLE   $0044                           ; 6FC7  Note (short)
        DECLE   $0024                           ; 6FC8  Note (short)
        DECLE   $03F4,  $0014                   ; 6FC9  Note (long)
        DECLE   $03F4,  $0025                   ; 6FCB  Note (long)
        DECLE   $03F4,  $000D                   ; 6FCD  Note (long)
        DECLE   $0000                           ; 6FCF  End of music

        MVII    #$0001, R0                      ; 6FD0   02B8 0001
        MVO     R0,     G_01CD                  ; 6FD2   0240 01CD
        PULR    R7                              ; 6FD4   02B7

        DECLE   $0001,  $000E,  $0078,  $0082   ; 6FD5   0001 000E 0078 0082
        DECLE   $0022,  $0119,  $0022,  $019C   ; 6FD9   0022 0119 0022 019C
        DECLE   $0022,  $021F,  $0022,  $02A2   ; 6FDD   0022 021F 0022 02A2
        DECLE   $0022,  $0125,  $0022,  $01A8   ; 6FE1   0022 0125 0022 01A8
        DECLE   $0022,  $02AB,  $0022,  $02A8   ; 6FE5   0022 02AB 0022 02A8
        DECLE   $0001,  $00A1,  $0001,  $011A   ; 6FE9   0001 00A1 0001 011A
        DECLE   $0001,  $0182,  $0001,  $022B   ; 6FED   0001 0182 0001 022B
        DECLE   $0078,  $02A1,  $0005,  $0228   ; 6FF1   0078 02A1 0005 0228
        DECLE   $0078,  $02A8,  $0005           ; 6FF5   0078 02A8 0005

        BNOV    L_6F81                          ; 6FF8   022A 0078

        MVI@    R5,     R2                      ; 6FFA   02AA
        ADDR    R7,     R6                      ; 6FFB   00FE
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; 6FFC   00FF 00FF 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5036       <entry>
;;  $5076       $507D  
;;  $50A4       <entry>
;;  $50DC       $55B8  
;;  $5157       $5217   $52D5   $5D94   $6430   $6470  
;;  $5161       $517B  
;;  $517D       $5174  
;;  $518B       $516B   $6D3A   $6D51  
;;  $51A9       $51A5   $51AE  
;;  $51AC       $51A2  
;;  $51B8       $50E4  
;;  $51CC       $51FB  
;;  $51D0       $51D9   $51F5  
;;  $51F7       $51DD  
;;  $520D       $5208  
;;  $520E       $51F2   $6D3D   $6D54  
;;  $5214       $5254   $525E  
;;  $523D       $524B  
;;  $5246       $5242  
;;  $5262       $521E  
;;  $5264       $51EF  
;;  $5271       $529D  
;;  $52A0       $5274   $527D   $5288   $5291  
;;  $52A3       $52A9  
;;  $52A7       $52A4  
;;  $52BD       $53AF  
;;  $52DF       $539C  
;;  $52EA       $52E5  
;;  $52F1       $52EC  
;;  $52F8       $52F3  
;;  $52F9       $52E8   $52EF   $52F6  
;;  $5301       $52C0   $52C5  
;;  $5305       $52FF  
;;  $5329       $53A2   $53A7  
;;  $5350       $5344  
;;  $5358       $532E  
;;  $5366       $5332  
;;  $5370       $5336  
;;  $5378       $534E   $5356   $5364   $536E  
;;  $5398       $538C  
;;  $5399       $52DB  
;;  $53A4       $52B7  
;;  $53B1       $6EB6  
;;  $53C5       $53BB   $53BF  
;;  $53D4       $53C3   $53D8  
;;  $53D5       $53B3  
;;  $53E5       $53E0  
;;  $540A       $5405  
;;  $5411       $540C  
;;  $5418       $5413  
;;  $5419       $5408   $540F   $5416  
;;  $541E       $541A  
;;  $5422       $5401  
;;  $5458       $5499  
;;  $5467       $5470   $5491  
;;  $546F       $546A  
;;  $5474       $546D  
;;  $5483       $5496  
;;  $5485       $543F   $5443   $548E  
;;  $5493       $547D   $5481  
;;  $54AB       $5454  
;;  $54BF       $54D5  
;;  $54D4       $54C8   $54E4   $54EE   $54F6  
;;  $54DB       $54D0  
;;  $54E2       $54DF  
;;  $54F0       $54E6  
;;  $54F8       $54D8  
;;  $54FB       <entry> $5C94   $5DF5  
;;  $554F       $5578   $559A  
;;  $5558       $556F  
;;  $556E       $555B   $5563  
;;  $557A       $5574  
;;  $559C       $5509   $550E   $557F   $55AE  
;;  $55A0       $5500  
;;  $55B8       $55B2  
;;  $55BD       $56C7  
;;  $55D1       $55C1  
;;  $55F0       $55EB  
;;  $55F7       $55F2  
;;  $55FE       $55F9  
;;  $55FF       $55EE   $55F5   $55FC  
;;  $5602       $55E7  
;;  $563B       $56BD  
;;  $564A       $564F   $56B5  
;;  $5651       $564C  
;;  $565E       $56BA  
;;  $565F       $5622   $5626   $56B2   $56C9  
;;  $567A       $5664  
;;  $5684       $5668  
;;  $568C       $5674   $5678   $5682  
;;  $56AD       $569D  
;;  $56B7       $5658   $565C  
;;  $56CB       $5637  
;;  $56DF       $56DC  
;;  $56EE       $56E9  
;;  $56FF       $5726  
;;  $5723       $571B  
;;  $5725       $5708   $5719   $5721   $573D   $5747   $574F  
;;  $572D       $575F   $5763  
;;  $572E       $5710  
;;  $573B       $5732  
;;  $5749       $573F  
;;  $5751       $572B  
;;  $5765       $55FF  
;;  $5777       $576F  
;;  $577B       $5775  
;;  $5788       $5781  
;;  $5790       $578C  
;;  $57E3       $6434   $6473  
;;  $57E5       $57E8  
;;  $57FD       $57F3  
;;  $581B       $57ED   $57FB   $5800   $5826  
;;  $581F       $5805  
;;  $5851       $5832  
;;  $5866       $5863  
;;  $586B       $5868  
;;  $58AD       $58C6  
;;  $58C3       $58AE   $58B7   $58C0  
;;  $58E0       $5895   $58A2  
;;  $58F2       $586E   $5872  
;;  $590B       $58FA  
;;  $592A       $591D   $592F  
;;  $592B       $5922  
;;  $594E       $5953  
;;  $594F       $5936  
;;  $5955       $588A   $5897   $58CC  
;;  $5972       $5960   $5966  
;;  $5980       $5976  
;;  $599B       $598D  
;;  $59A9       $59A5  
;;  $59B9       $59AC  
;;  $59BB       $5984   $5998  
;;  $59DA       <entry> $5BA4  
;;  $59ED       $59E3  
;;  $59F3       $59EB  
;;  $59F5       $59FA  
;;  $5A03       $59DE  
;;  $5A04       $59B6   $5CAA   $638D  
;;  $5A1B       $5A1F  
;;  $5A2B       $5A25  
;;  $5A66       <entry> $5CAD   $6365  
;;  $5A67       $5A5D  
;;  $5A89       $5A7C  
;;  $5A93       $5AA4  
;;  $5AA6       $5A91  
;;  $5AAD       $581B   $5CB0   $5E51   $6368  
;;  $5ACC       $5AC8  
;;  $5ADE       $5ADA  
;;  $5AE1       $5AC3   $5AD4  
;;  $5AE2       $5A2B  
;;  $5AE9       $5AF2   $5AF9  
;;  $5AFC       $6301  
;;  $5B15       $5B49  
;;  $5B19       $5B22   $5B2B   $5B3A  
;;  $5B2D       $5B24  
;;  $5B3C       $5B1E  
;;  $5B4B       $5B40   $5B44  
;;  $5B69       $51D4   $5B19   $6CA8  
;;  $5B6A       $5B95  
;;  $5B79       $5B7A  
;;  $5B8B       $5B87   $5B93  
;;  $5B97       $5B8D  
;;  $5BA7       $5BA2  
;;  $5BB2       $5BAF  
;;  $5BC1       $5BBE  
;;  $5BCE       $5BCB  
;;  $5C31       $5BD1   $5CBF  
;;  $5C4B       $5C43  
;;  $5C4F       $5C49  
;;  $5C79       $5C3E  
;;  $5C85       $5C77  
;;  $5CB6       $5BB4   $5BC3  
;;  $5CB7       $5C75   $5C7F  
;;  $5CC1       $5CBC  
;;  $5CDA       $55B4  
;;  $5CE9       $5CE2  
;;  $5CEE       $5CF5  
;;  $5CF8       $5B7C  
;;  $5D31       $5D2C  
;;  $5D38       $5D33  
;;  $5D3F       $5D3A  
;;  $5D40       $5D2F   $5D36   $5D3D  
;;  $5D45       $5D41  
;;  $5D49       $5D28  
;;  $5D99       $5DD3  
;;  $5DA8       $5DAD   $5DCB  
;;  $5DAF       $5DAA  
;;  $5DBC       $5DD0  
;;  $5DBE       $5D79   $5D7D   $5DC8  
;;  $5DCD       $5DB6   $5DBA  
;;  $5DD5       $5D12  
;;  $5DDB       $5E54  
;;  $5DF9       $5924  
;;  $5E3B       $5E42  
;;  $5E56       $588E  
;;  $5E5A       $589B  
;;  $5E5E       $58D0  
;;  $5E62       $5829  
;;  $5E64       $5E58   $5E5C   $5E60  
;;  $5E68       $5E6C   $5E72  
;;  $5E69       $559C  
;;  $5E78       $5E7F  
;;  $5E82       $5E7B  
;;  $5F0A       $5751  
;;  $5F17       $5F14  
;;  $5F3B       $5C08   $5C91  
;;  $5FDC       $596E  
;;  $5FF1       $50EA  
;;  $5FFC       $6001  
;;  $6009       $600E  
;;  $6041       $5E46  
;;  $6051       <entry>
;;  $6056       $5DC0  
;;  $62FB       $50E7   $5CDF  
;;  $632E       $6336  
;;  $634A       $6352  
;;  $6354       $633C  
;;  $6385       $637A  
;;  $638C       $6383  
;;  $6397       $5CA0   $5DE1   $6307  
;;  $63DD       $63A7   $63BC   $63C3   $63CA   $63D1  
;;  $63DE       $63FA  
;;  $63FC       $63F6  
;;  $6411       $640B  
;;  $6412       $640F  
;;  $641A       $5CB3   $6354  
;;  $642B       $6451   $6459  
;;  $6442       $643B  
;;  $6449       $6445  
;;  $645C       $643D  
;;  $6461       $6469  
;;  $6492       $6479  
;;  $6523       $6521  
;;  $6544       $6542  
;;  $6572       $6572  
;;  $6588       $6586  
;;  $658C       $658A  
;;  $65C3       $65C1  
;;  $65C4       $65C2  
;;  $65D0       $65CE  
;;  $65D3       $65D1  
;;  $6996       $6994  
;;  $6A6C       $6A6C  
;;  $6B9E       $6B9C  
;;  $6C85       $520A  
;;  $6CA2       $6CB2   $6CD7   $6CDC   $6CE0   $6CE5   $6CE9   $6CEE   $6CF2  
;;  $6CA2       $6CF7   $6CFB   $6D0A   $6D19   $6D26   $6D4B   $6D5F  
;;  $6CC2       $6CB4  
;;  $6CC9       $6CCA  
;;  $6D2F       $6D06   $6D15   $6D22  
;;  $6D4D       $6D41  
;;  $6D79       <entry>
;;  $6D8A       $6D85   $6DA0  
;;  $6D96       $6D80  
;;  $6D97       $5DD8  
;;  $6DA2       $6198   $6D8A  
;;  $6DBE       $6DBC  
;;  $6DD6       $5EAF   $5ED1   $5F07   $5F38  
;;  $6DF2       $6DEE  
;;  $6DF6       $6DE5  
;;  $6E0F       $6DFD  
;;  $6E1F       $6E27  
;;  $6E62       $6E15  
;;  $6E6E       $6E66  
;;  $6E78       $6E72  
;;  $6E7A       $6E6C   $6E76  
;;  $6E82       $6E7C  
;;  $6E92       $6E8A  
;;  $6EAA       $6EB2  
;;  $6EB6       $6E90   $6EAD  
;;  $6EB9       $6DE0   $6E80   $6E84   $6EB4  
;;  $6EC2       $6F36  
;;  $6ED3       $6ECD  
;;  $6EDF       $6EE9  
;;  $6F12       $6F0D  
;;  $6F51       $6F4C  
;;  $6F5D       $6F5A  
;;  $6F6A       $6F67  
;;  $6F75       $6EC0  
;;  $6F81       $6FF8  
;;  $6F97       $50D2   $5CE5  
;; ======================================================================== ;;
