
        ORG     $5000
.HEADER:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5000   0000 0000 0000 0000
        DECLE   $3030,  $3030,  $3000,  $3000   ; 5004   3030 3030 3000 3000
        DECLE   $6666,  $0000,  $0000,  $0000   ; 5008   6666 0000 0000 0000

        DECR    R4                              ; 500C   0014
        DECLE   $3E14,  $3E14,  $0000,  $10FE   ; 500D   3E14 3E14 0000 10FE
        DECLE   $D0FE,  $16D6,  $FE10           ; 5011   D0FE 16D6 FE10

        SLR     R2,     1                       ; 5014   0062
        DECLE   $6408,  $1026,  $4600,  $107C   ; 5015   6408 1026 4600 107C
        DECLE   $6038,  $607C,  $1000,  $1020   ; 5019   6038 607C 1000 1020
        DECLE   $4000,  $0000,  $0000,  $0E08   ; 501D   4000 0000 0000 0E08
        DECLE   $0808,  $0808,  $080E,  $7010   ; 5021   0808 0808 080E 7010
        DECLE   $1010,  $1010,  $1070,  $1038   ; 5025   1010 1010 1070 1038
        DECLE   $6C38,  $1000,  $0000           ; 5029   6C38 1000 0000

        COMR    R0                              ; 502C   0018
        DECLE   $187E,  $1818,  $0000,  $0000   ; 502D   187E 1818 0000 0000
        DECLE   $0000                           ; 5031   0000

        COMR    R0                              ; 5032   0018
        DECLE   $1808,  $0000                   ; 5033   1808 0000

        SARC    R2,     2                       ; 5035   007E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5036   0000 0000 0000 0000

        COMR    R0                              ; 503A   0018
        DECLE   $1800                           ; 503B   1800

        SUBR    R0,     R2                      ; 503C   0102
        DECLE   $0408,  $1020,  $4080           ; 503D   0408 1020 4080

        ADDR    R7,     R6                      ; 5040   00FE
        DECLE   $C6D6,  $D6C6,  $FE00           ; 5041   C6D6 D6C6 FE00

        RSWD    R0                              ; 5044   0038
        DECLE   $1818,  $1818,  $7E00           ; 5045   1818 1818 7E00

        SARC    R2,     2                       ; 5048   007E
        DECLE   $6606,  $7E60,  $7E00           ; 5049   6606 7E60 7E00

        SARC    R2,     2                       ; 504C   007E
        DECLE   $063C,  $0606,  $7E00           ; 504D   063C 0606 7E00

        SLR     R2,     2                       ; 5050   0066
        DECLE   $6666,  $7E06,  $0600           ; 5051   6666 7E06 0600

        SARC    R2,     2                       ; 5054   007E
        DECLE   $607E,  $0666,  $7E00           ; 5055   607E 0666 7E00

        SARC    R2,     2                       ; 5058   007E
        DECLE   $607E,  $6666,  $7E00           ; 5059   607E 6666 7E00

        SARC    R2,     2                       ; 505C   007E
        DECLE   $060C,  $1830,  $3000           ; 505D   060C 1830 3000

        SARC    R2,     2                       ; 5060   007E
        DECLE   $663C,  $6666,  $7E00           ; 5061   663C 6666 7E00

        SARC    R2,     2                       ; 5064   007E
        DECLE   $6666,  $7E06,  $7E00,  $0000   ; 5065   6666 7E06 7E00 0000
        DECLE   $1818                           ; 5069   1818

        COMR    R0                              ; 506A   0018
        DECLE   $1800,  $0000,  $1818           ; 506B   1800 0000 1818

        COMR    R0                              ; 506E   0018
        DECLE   $1808                           ; 506F   1808

        CLRC                                    ; 5070   0006
        DECLE   $1860,  $1806,  $0000,  $0000   ; 5071   1860 1806 0000 0000
        DECLE   $7E00,  $7E00,  $0000           ; 5075   7E00 7E00 0000

        SLR     R0,     1                       ; 5078   0060
        DECLE   $1806,  $1860,  $0000,  $7E66   ; 5079   1806 1860 0000 7E66
        DECLE   $061E,  $1800,  $1800,  $FE82   ; 507D   061E 1800 1800 FE82
        DECLE   $BAAA,  $BE80,  $FE00,  $7E66   ; 5081   BAAA BE80 FE00 7E66
        DECLE   $6666,  $7E66,  $6600,  $7E66   ; 5085   6666 7E66 6600 7E66
        DECLE   $667C,  $6666,  $7E00,  $7E66   ; 5089   667C 6666 7E00 7E66
        DECLE   $6060,  $6066,  $7E00,  $7C66   ; 508D   6060 6066 7E00 7C66
        DECLE   $6666,  $6666,  $7C00,  $7E60   ; 5091   6666 6666 7C00 7E60
        DECLE   $607C,  $6060,  $7E00,  $7E60   ; 5095   607C 6060 7E00 7E60
        DECLE   $607C,  $6060,  $6000,  $7E66   ; 5099   607C 6060 6000 7E66
        DECLE   $606E,  $6666,  $7E00,  $6666   ; 509D   606E 6666 7E00 6666
        DECLE   $667E,  $6666,  $6600,  $7E18   ; 50A1   667E 6666 6600 7E18
        DECLE   $1818,  $1818,  $7E00,  $0606   ; 50A5   1818 1818 7E00 0606
        DECLE   $0606,  $6666,  $7E00,  $6666   ; 50A9   0606 6666 7E00 6666
        DECLE   $6C78,  $6666,  $6600,  $6060   ; 50AD   6C78 6666 6600 6060
        DECLE   $6060,  $6060,  $7E00,  $82C6   ; 50B1   6060 6060 7E00 82C6
        DECLE   $EEFE,  $D6D6,  $C600,  $4666   ; 50B5   EEFE D6D6 C600 4666
        DECLE   $767E,  $6E66,  $6200,  $7E66   ; 50B9   767E 6E66 6200 7E66
        DECLE   $6666,  $6666,  $7E00,  $7E66   ; 50BD   6666 6666 7E00 7E66
        DECLE   $6666,  $7E60,  $6000,  $7E66   ; 50C1   6666 7E60 6000 7E66
        DECLE   $6666,  $666E,  $7E03,  $7E66   ; 50C5   6666 666E 7E03 7E66
        DECLE   $6666,  $7C66,  $6600,  $7E66   ; 50C9   6666 7C66 6600 7E66
        DECLE   $607E,  $0666,  $7E00,  $7E18   ; 50CD   607E 0666 7E00 7E18
        DECLE   $1818,  $1818,  $1800,  $6666   ; 50D1   1818 1818 1800 6666
        DECLE   $6666,  $6666,  $7E00,  $6666   ; 50D5   6666 6666 7E00 6666
        DECLE   $6624,  $3C18,  $1800,  $C6C6   ; 50D9   6624 3C18 1800 C6C6
        DECLE   $D6D6,  $FE6C,  $6C00,  $6666   ; 50DD   D6D6 FE6C 6C00 6666
        DECLE   $3C18,  $3C66,  $6600,  $6666   ; 50E1   3C18 3C66 6600 6666
        DECLE   $6666,  $7E18,  $1800,  $7E06   ; 50E5   6666 7E18 1800 7E06
        DECLE   $0C18,  $3060,  $7E00,  $1E18   ; 50E9   0C18 3060 7E00 1E18
        DECLE   $1818,  $1818,  $181E,  $8040   ; 50ED   1818 1818 181E 8040
        DECLE   $2010,  $0804                   ; 50F1   2010 0804

        BC      G_C90D                          ; 50F3   0201 7818

        DECLE   $1818,  $1818,  $1878,  $1038   ; 50F5   1818 1818 1878 1038
        DECLE   $5492,  $1010,  $1000,  $0810   ; 50F9   5492 1010 1000 0810
        DECLE   $207E,  $2010,  $0800,  $0804   ; 50FD   207E 2010 0800 0804

        B       L_5103                          ; 5101   0200 0000

L_5103:
        DECLE   $0000,  $0000,  $7C0C,  $7C6C   ; 5103   0000 0000 7C0C 7C6C
        DECLE   $7E00,  $7030,  $3E36,  $3636   ; 5107   7E00 7030 3E36 3636
        DECLE   $3E00,  $0000,  $7E66,  $6060   ; 510B   3E00 0000 7E66 6060
        DECLE   $7E00,  $0E0C,  $7C6C,  $6C6C   ; 510F   7E00 0E0C 7C6C 6C6C
        DECLE   $7C00,  $0000,  $7E66,  $7E60   ; 5113   7C00 0000 7E66 7E60
        DECLE   $7E00                           ; 5117   7E00

        RSWD    R6                              ; 5118   003E
        DECLE   $307C,  $3030,  $3000,  $0000   ; 5119   307C 3030 3000 0000
        DECLE   $7E6C,  $6C7C,  $0C7C,  $6060   ; 511D   7E6C 6C7C 0C7C 6060
        DECLE   $7C6C,  $6C6C,  $6E00,  $1800   ; 5121   7C6C 6C6C 6E00 1800
        DECLE   $3818,  $1818,  $7E00,  $0600   ; 5125   3818 1818 7E00 0600
        DECLE   $0606,  $0636,  $363E,  $6060   ; 5129   0606 0636 363E 6060
        DECLE   $666C,  $7866,  $6600,  $3818   ; 512D   666C 7866 6600 3818
        DECLE   $1818,  $1818,  $7E00,  $0000   ; 5131   1818 1818 7E00 0000
        DECLE   $FED6,  $D6D6,  $D600,  $0000   ; 5135   FED6 D6D6 D600 0000
        DECLE   $7E36,  $3636,  $3600,  $0000   ; 5139   7E36 3636 3600 0000
        DECLE   $7E66,  $6666,  $7E00,  $0000   ; 513D   7E66 6666 7E00 0000
        DECLE   $7E36,  $363E,  $3030,  $0000   ; 5141   7E36 363E 3030 0000
        DECLE   $7C6C,  $6C7C,  $0C0E,  $0000   ; 5145   7C6C 6C7C 0C0E 0000
        DECLE   $7E36,  $3030,  $3000,  $0000   ; 5149   7E36 3030 3000 0000
        DECLE   $7E60,  $7E06,  $7E00           ; 514D   7E60 7E06 7E00

        GSWD    R0                              ; 5150   0030
        DECLE   $7E30,  $3030,  $3E00,  $0000   ; 5151   7E30 3030 3E00 0000
        DECLE   $6C6C,  $6C6C,  $7E00,  $0000   ; 5155   6C6C 6C6C 7E00 0000
        DECLE   $6666,  $663C,  $1800,  $0000   ; 5159   6666 663C 1800 0000
        DECLE   $D6D6,  $D6FE,  $6C00,  $0000   ; 515D   D6D6 D6FE 6C00 0000
        DECLE   $663C,  $183C,  $6600,  $0000   ; 5161   663C 183C 6600 0000
        DECLE   $7636,  $363E,  $063E,  $0000   ; 5165   7636 363E 063E 0000
        DECLE   $7E06,  $1860,  $7E00,  $0E08   ; 5169   7E06 1860 7E00 0E08
        DECLE   $0830,  $0808,  $0E00,  $1818   ; 516D   0830 0808 0E00 1818
        DECLE   $1818,  $1818,  $1818,  $7010   ; 5171   1818 1818 1818 7010
        DECLE   $100C,  $1010,  $7000,  $0000   ; 5175   100C 1010 7000 0000

        SARC    R0,     1                       ; 5179   0078
        DECLE   $1E00,  $0000,  $FFFF,  $FFFF   ; 517A   1E00 0000 FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $0000,  $0000   ; 517E   FFFF FFFF 0000 0000

        DIS                                     ; 5182   0003
        DECLE   $1FFF,  $0000,  $0000           ; 5183   1FFF 0000 0000

        ADDR    R0,     R0                      ; 5186   00C0
        DECLE   $F8FF,  $FF1F                   ; 5187   F8FF FF1F

        SUB     .STIC.X.0,R0                    ; 5189   0300 0000
        DECLE   $0000,  $FFF8,  $C000,  $0000   ; 518B   0000 FFF8 C000 0000
        DECLE   $0000,  $0000                   ; 518F   0000 0000

        SUBR    R1,     R7                      ; 5191   010F
        DECLE   $7FFF,  $FFFF,  $0000,  $80F0   ; 5192   7FFF FFFF 0000 80F0
        DECLE   $FEFF,  $FFFF,  $FFFF,  $FF7F   ; 5196   FEFF FFFF FFFF FF7F
        DECLE   $0F01,  $0000,  $FFFF,  $FFFE   ; 519A   0F01 0000 FFFF FFFE
        DECLE   $F080,  $0000,  $073F,  $FFFF   ; 519E   F080 0000 073F FFFF
        DECLE   $FFFF,  $FFFF,  $E0FC,  $FFFF   ; 51A2   FFFF FFFF E0FC FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 51A6   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $3F07,  $FFFF,  $FFFF   ; 51AA   FFFF 3F07 FFFF FFFF
        DECLE   $FFFF,  $FCE0,  $0000,  $0000   ; 51AE   FFFF FCE0 0000 0000

        SUB@    R1,     R7                      ; 51B2   030F
        DECLE   $3FFF,  $0000,  $0000,  $C0F0   ; 51B3   3FFF 0000 0000 C0F0
        DECLE   $FCFF,  $FF3F,  $0F03,  $0000   ; 51B7   FCFF FF3F 0F03 0000
        DECLE   $0000,  $FFFC,  $F0C0,  $0000   ; 51BB   0000 FFFC F0C0 0000
        DECLE   $0000                           ; 51BF   0000

        SUB@    R1,     R7                      ; 51C0   030F
        DECLE   $3FFF,  $FFFF,  $FFFF,  $C0F0   ; 51C1   3FFF FFFF FFFF C0F0
        DECLE   $FCFF,  $FFFF,  $FFFF,  $FFFF   ; 51C5   FCFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FF3F,  $0F03,  $FFFF   ; 51C9   FFFF FF3F 0F03 FFFF
        DECLE   $FFFF,  $FFFC,  $F0C0           ; 51CD   FFFF FFFC F0C0

        SUBR    R0,     R3                      ; 51D0   0103
        DECLE   $070F,  $1F3F,  $7FFF,  $80C0   ; 51D1   070F 1F3F 7FFF 80C0
        DECLE   $E0F0,  $F8FC,  $FEFF,  $FF7F   ; 51D5   E0F0 F8FC FEFF FF7F
        DECLE   $3F1F,  $0F07                   ; 51D9   3F1F 0F07

        SUB     G_FFFE, R1                      ; 51DB   0301 FFFE
        DECLE   $FCF8,  $F0E0,  $C080,  $0000   ; 51DD   FCF8 F0E0 C080 0000
        DECLE   $0000                           ; 51E1   0000

        SUBR    R0,     R3                      ; 51E2   0103
        DECLE   $070F,  $0000,  $0000,  $80C0   ; 51E3   070F 0000 0000 80C0
        DECLE   $E0F0,  $0F07                   ; 51E7   E0F0 0F07

        SUB     .STIC.X.0,R1                    ; 51E9   0301 0000
        DECLE   $0000,  $F0E0,  $C080,  $0000   ; 51EB   0000 F0E0 C080 0000
        DECLE   $0000,  $1F3F,  $7FFF,  $FFFF   ; 51EF   0000 1F3F 7FFF FFFF
        DECLE   $FFFF,  $F8FC,  $FEFF,  $FFFF   ; 51F3   FFFF F8FC FEFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FF7F   ; 51F7   FFFF FFFF FFFF FF7F
        DECLE   $3F1F,  $FFFF,  $FFFF,  $FFFE   ; 51FB   3F1F FFFF FFFF FFFE
        DECLE   $FCF8,  $1F1F,  $3F3F,  $7F7F   ; 51FF   FCF8 1F1F 3F3F 7F7F
        DECLE   $FFFF,  $F8F8,  $FCFC,  $FEFE   ; 5203   FFFF F8F8 FCFC FEFE
        DECLE   $FFFF,  $FFFF,  $7F7F,  $3F3F   ; 5207   FFFF FFFF 7F7F 3F3F
        DECLE   $1F1F,  $FFFF,  $FEFE,  $FCFC   ; 520B   1F1F FFFF FEFE FCFC
        DECLE   $F8F8                           ; 520F   F8F8

        SUBR    R0,     R1                      ; 5210   0101
        SUB     G_0707, R3                      ; 5211   0303 0707
        DECLE   $0F0F,  $8080,  $C0C0,  $E0E0   ; 5213   0F0F 8080 C0C0 E0E0
        DECLE   $F0F0,  $0F0F,  $0707           ; 5217   F0F0 0F0F 0707

        SUB     .ISRVEC.1,R3                    ; 521A   0303 0101
        DECLE   $F0F0,  $E0E0,  $C0C0,  $8080   ; 521C   F0F0 E0E0 C0C0 8080
        DECLE   $3F3F,  $7F7F,  $7FFF,  $FFFF   ; 5220   3F3F 7F7F 7FFF FFFF
        DECLE   $FCFC,  $FEFE,  $FEFF,  $FFFF   ; 5224   FCFC FEFE FEFF FFFF
        DECLE   $FFFF,  $FF7F,  $7F7F,  $3F3F   ; 5228   FFFF FF7F 7F7F 3F3F
        DECLE   $FFFF,  $FFFE,  $FEFE,  $FCFC   ; 522C   FFFF FFFE FEFE FCFC
        DECLE   $070F,  $0F0F,  $1F1F,  $1F3F   ; 5230   070F 0F0F 1F1F 1F3F
        DECLE   $E0F0,  $F0F0,  $F8F8,  $F8FC   ; 5234   E0F0 F0F0 F8F8 F8FC
        DECLE   $3F1F,  $1F1F,  $0F0F,  $0F07   ; 5238   3F1F 1F1F 0F0F 0F07
        DECLE   $FCF8,  $F8F8,  $F0F0,  $F0E0   ; 523C   FCF8 F8F8 F0F0 F0E0

        SUBR    R0,     R1                      ; 5240   0101
        SUBR    R0,     R3                      ; 5241   0103
        SUB     G_0707, R3                      ; 5242   0303 0707
        DECLE   $8080,  $80C0,  $C0C0,  $E0E0   ; 5244   8080 80C0 C0C0 E0E0
        DECLE   $0707                           ; 5248   0707

        SUB     G_0301, R3                      ; 5249   0303 0301
        SUBR    R0,     R1                      ; 524B   0101
        DECLE   $E0E0,  $C0C0,  $C080,  $8080   ; 524C   E0E0 C0C0 C080 8080
        DECLE   $0000,  $0000,  $0000,  $0FFF   ; 5250   0000 0000 0000 0FFF
        DECLE   $0000,  $0000,  $0000,  $F0FF   ; 5254   0000 0000 0000 F0FF
        DECLE   $0000,  $0000,  $0FFF,  $FFFF   ; 5258   0000 0000 0FFF FFFF
        DECLE   $0000,  $0000,  $F0FF,  $FFFF   ; 525C   0000 0000 F0FF FFFF
        DECLE   $0000,  $0FFF,  $FFFF,  $FFFF   ; 5260   0000 0FFF FFFF FFFF
        DECLE   $0000,  $F0FF,  $FFFF,  $FFFF   ; 5264   0000 F0FF FFFF FFFF
        DECLE   $0FFF,  $FFFF,  $FFFF,  $FFFF   ; 5268   0FFF FFFF FFFF FFFF
        DECLE   $F0FF,  $FFFF,  $FFFF,  $FFFF   ; 526C   F0FF FFFF FFFF FFFF

        SUBR    R0,     R1                      ; 5270   0101
        SUBR    R0,     R1                      ; 5271   0101
        SUB     G_0303, R3                      ; 5272   0303 0303
        DECLE   $8080,  $8080,  $C0C0,  $C0C0   ; 5274   8080 8080 C0C0 C0C0
        DECLE   $0707,  $0707,  $0F0F,  $0F0F   ; 5278   0707 0707 0F0F 0F0F
        DECLE   $E0E0,  $E0E0,  $F0F0,  $F0F0   ; 527C   E0E0 E0E0 F0F0 F0F0
        DECLE   $1F1F,  $1F1F,  $3F3F,  $3F3F   ; 5280   1F1F 1F1F 3F3F 3F3F
        DECLE   $F8F8,  $F8F8,  $FCFC,  $FCFC   ; 5284   F8F8 F8F8 FCFC FCFC
        DECLE   $7F7F,  $7F7F,  $FFFF,  $FFFF   ; 5288   7F7F 7F7F FFFF FFFF
        DECLE   $FEFE,  $FEFE,  $FFFF,  $FFFF   ; 528C   FEFE FEFE FFFF FFFF
        DECLE   $0F0F,  $0F0F,  $0F0F,  $0F0F   ; 5290   0F0F 0F0F 0F0F 0F0F
        DECLE   $F0F0,  $F0F0,  $F0F0,  $F0F0   ; 5294   F0F0 F0F0 F0F0 F0F0
        DECLE   $0000,  $0000,  $0000,  $0FF0   ; 5298   0000 0000 0000 0FF0
        DECLE   $0000,  $0000,  $0000,  $F00F   ; 529C   0000 0000 0000 F00F
        DECLE   $0000,  $0000,  $0FF0,  $0000   ; 52A0   0000 0000 0FF0 0000
        DECLE   $0000,  $0000,  $F00F,  $0000   ; 52A4   0000 0000 F00F 0000
        DECLE   $0000,  $0FF0,  $0000,  $0000   ; 52A8   0000 0FF0 0000 0000
        DECLE   $0000,  $F00F,  $0000,  $0000   ; 52AC   0000 F00F 0000 0000
        DECLE   $0FF0,  $0000,  $0000,  $0000   ; 52B0   0FF0 0000 0000 0000
        DECLE   $F00F,  $0000,  $0000,  $0000   ; 52B4   F00F 0000 0000 0000
        DECLE   $0000,  $0000                   ; 52B8   0000 0000

        DIS                                     ; 52BA   0003
        DECLE   $1CE0,  $0000,  $0000           ; 52BB   1CE0 0000 0000

        ADDR    R0,     R0                      ; 52BE   00C0
        DECLE   $3807,  $0000                   ; 52BF   3807 0000

        SUBR    R1,     R6                      ; 52C1   010E
        DECLE   $7080,  $0000,  $0000,  $8070   ; 52C2   7080 0000 0000 8070
        DECLE   $0E01,  $0000,  $0738,  $C000   ; 52C6   0E01 0000 0738 C000
        DECLE   $0000,  $0000,  $E01C           ; 52CA   0000 0000 E01C

        SUB     .STIC.X.0,R0                    ; 52CD   0300 0000
        DECLE   $0000,  $0000,  $0000           ; 52CF   0000 0000 0000

        SUB@    R1,     R4                      ; 52D2   030C
        DECLE   $30C0,  $0000,  $0000,  $C030   ; 52D3   30C0 0000 0000 C030
        DECLE   $0C03                           ; 52D7   0C03

        SUB@    R1,     R4                      ; 52D8   030C
        DECLE   $30C0,  $0000,  $0000,  $C030   ; 52D9   30C0 0000 0000 C030
        DECLE   $0C03,  $0000,  $0000,  $1020   ; 52DD   0C03 0000 0000 1020
        DECLE   $4080,  $0000,  $0000,  $0804   ; 52E1   4080 0000 0000 0804

        BC      L_52E7                          ; 52E5   0201 0000

L_52E7:
        DECLE   $0000,  $0000,  $0000,  $8040   ; 52E7   0000 0000 0000 8040
        DECLE   $2010,  $0000,  $0000           ; 52EB   2010 0000 0000

        SUBR    R0,     R2                      ; 52EE   0102
        DECLE   $0408,  $C0C0,  $C0C0,  $C0C0   ; 52EF   0408 C0C0 C0C0 C0C0
        DECLE   $C0C0                           ; 52F3   C0C0

        SUB     G_0303, R3                      ; 52F4   0303 0303
        SUB     G_0303, R3                      ; 52F6   0303 0303
        DECLE   $3030,  $3030,  $3030,  $3030   ; 52F8   3030 3030 3030 3030
        DECLE   $0C0C,  $0C0C,  $0C0C,  $0C0C   ; 52FC   0C0C 0C0C 0C0C 0C0C
        DECLE   $8080,  $8080,  $8080,  $8080   ; 5300   8080 8080 8080 8080

        SUBR    R0,     R1                      ; 5304   0101
        SUBR    R0,     R1                      ; 5305   0101
        SUBR    R0,     R1                      ; 5306   0101
        SUBR    R0,     R1                      ; 5307   0101
        DECLE   $1010,  $1010,  $1010,  $1010   ; 5308   1010 1010 1010 1010
        DECLE   $0808,  $0808,  $0808,  $0808   ; 530C   0808 0808 0808 0808
        DECLE   $F0F0,  $F0F0,  $0000,  $0000   ; 5310   F0F0 F0F0 0000 0000
        DECLE   $0F0F,  $0F0F,  $0000,  $0000   ; 5314   0F0F 0F0F 0000 0000
        DECLE   $0000,  $0000,  $F0F0,  $F0F0   ; 5318   0000 0000 F0F0 F0F0
        DECLE   $0000,  $0000,  $0F0F,  $0F0F   ; 531C   0000 0000 0F0F 0F0F
        DECLE   $FFFF,  $0000,  $0000,  $0000   ; 5320   FFFF 0000 0000 0000
        DECLE   $0000,  $FFFF,  $0000,  $0000   ; 5324   0000 FFFF 0000 0000
        DECLE   $0000,  $0000,  $FFFF,  $0000   ; 5328   0000 0000 FFFF 0000
        DECLE   $0000,  $0000,  $0000,  $FFFF   ; 532C   0000 0000 0000 FFFF
        DECLE   $FF00,  $0000,  $0000,  $0000   ; 5330   FF00 0000 0000 0000
        DECLE   $0000                           ; 5334   0000

        ADDR    R7,     R7                      ; 5335   00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5336   0000 0000 0000 0000
        DECLE   $FF00,  $0000,  $0000,  $0000   ; 533A   FF00 0000 0000 0000
        DECLE   $0000                           ; 533E   0000

        ADDR    R7,     R7                      ; 533F   00FF
        DECLE   $FFFF,  $FFFF,  $0000,  $0000   ; 5340   FFFF FFFF 0000 0000
        DECLE   $0000,  $0000,  $FFFF,  $FFFF   ; 5344   0000 0000 FFFF FFFF
        DECLE   $7E7E,  $7E7E,  $7E7E,  $7E7E   ; 5348   7E7E 7E7E 7E7E 7E7E
        DECLE   $0000                           ; 534C   0000

        ADDR    R7,     R7                      ; 534D   00FF
        DECLE   $FF00,  $0000                   ; 534E   FF00 0000

        ADDR    R7,     R7                      ; 5350   00FF
        DECLE   $FFFF,  $FFFF,  $FF00,  $4D61   ; 5351   FFFF FFFF FF00 4D61
        DECLE   $7474,  $656C,  $2045,  $6C65   ; 5355   7474 656C 2045 6C65
        DECLE   $6374,  $726F,  $6E69,  $6373   ; 5359   6374 726F 6E69 6373
        DECLE   $2020,  $2020,  $2020,  $2070   ; 535D   2020 2020 2020 2070
        DECLE   $7265,  $7365,  $6E74,  $7300   ; 5361   7265 7365 6E74 7300
        DECLE   $436F,  $7072,  $2040,  $2031   ; 5365   436F 7072 2040 2031
        DECLE   $3938,  $3420,  $4D61,  $7474   ; 5369   3938 3420 4D61 7474
        DECLE   $656C                           ; 536D   656C

        ADDR    R7,     R7                      ; 536E   00FF
        DECLE   $FF24                           ; 536F   FF24

        MOVR    R0,     R2                      ; 5370   0082
        DECLE   $AE08,  $C910,  $1488,  $9108   ; 5371   AE08 C910 1488 9108
        DECLE   $4222                           ; 5375   4222

        MVI     .EXEC.889,R2                    ; 5376   0282 1889
        DECLE   $0820,  $8A23                   ; 5378   0820 8A23

        BOV     G_7434                          ; 537A   0202 20B8

        DECLE   $8228,  $0A20,  $AE20,  $8AAA   ; 537C   8228 0A20 AE20 8AAA
        DECLE   $9220,  $8AB8,  $8288,  $22B8   ; 5380   9220 8AB8 8288 22B8
        DECLE   $8288,  $EA8A,  $AAAE,  $8868   ; 5384   8288 EA8A AAAE 8868
        DECLE   $AE0C,  $2711,  $1F00,  $2B32   ; 5388   AE0C 2711 1F00 2B32
        DECLE   $0A4A,  $D1B8,  $0451,  $726A   ; 538C   0A4A D1B8 0451 726A
        DECLE   $102C,  $0542,  $6262,  $7CF0   ; 5390   102C 0542 6262 7CF0
        DECLE   $2C0E                           ; 5394   2C0E

        NOP                                     ; 5395   0034
        DECLE   $0400,  $C398,  $B804,  $C0C3   ; 5396   0400 C398 B804 C0C3
        DECLE   $424D,  $D1C0,  $1460,  $0C02   ; 539A   424D D1C0 1460 0C02
        DECLE   $B800,  $0400,  $DC59,  $290A   ; 539E   B800 0400 DC59 290A
        DECLE   $5909,  $0804                   ; 53A2   5909 0804

        ADDR    R3,     R4                      ; 53A4   00DC
        DECLE   $5929,  $0520,  $1514,  $600C   ; 53A5   5929 0520 1514 600C
        DECLE   $0589,  $040A,  $B800,  $0400   ; 53A9   0589 040A B800 0400
        DECLE   $DC59,  $290E,  $2026,  $4F43   ; 53AD   DC59 290E 2026 4F43
        DECLE   $5F0A,  $1ABC,  $E8A5,  $A1B9   ; 53B1   5F0A 1ABC E8A5 A1B9
        DECLE   $FF04,  $0DB8,  $0810,  $7129   ; 53B5   FF04 0DB8 0810 7129

        CMP@    R6,     R1                      ; 53B9   0371
        DECLE   $0F69,  $1023                   ; 53BA   0F69 1023

        CMP     G_697D, R1                      ; 53BC   0341 697D
        DECLE   $F02C,  $165B,  $0910,  $BCE8   ; 53BE   F02C 165B 0910 BCE8
        DECLE   $A5A1,  $B804,  $7D56,  $102C   ; 53C2   A5A1 B804 7D56 102C
        DECLE   $046A,  $7DF0,  $2C0C,  $5B09   ; 53C6   046A 7DF0 2C0C 5B09
        DECLE   $0DBC,  $E8A5,  $BAEF,  $A091   ; 53CA   0DBC E8A5 BAEF A091
        DECLE   $6950,  $1262,  $2E07,  $5B09   ; 53CE   6950 1262 2E07 5B09
        DECLE   $0ABC,  $E8A5,  $A119,  $697D   ; 53D2   0ABC E8A5 A119 697D
        DECLE   $F02C,  $065B,  $091A,  $B808   ; 53D6   F02C 065B 091A B808
        DECLE   $BCE8,  $A5A1,  $7972,  $697D   ; 53DA   BCE8 A5A1 7972 697D
        DECLE   $F02C,  $0742,  $7210,  $2C0F   ; 53DE   F02C 0742 7210 2C0F
        DECLE   $BCE8,  $B161,  $7CF0,  $2C05   ; 53E2   BCE8 B161 7CF0 2C05
        DECLE   $B3BC,  $E8B5,  $A068,  $7CF0   ; 53E6   B3BC E8B5 A068 7CF0
        DECLE   $2C05,  $B010,  $0C01,  $B5B7   ; 53EA   2C05 B010 0C01 B5B7
        DECLE   $C060,  $7CF0,  $2C04,  $3C08   ; 53EE   C060 7CF0 2C04 3C08
        DECLE   $8BBB,  $0004                   ; 53F2   8BBB 0004

        XOR@    R3,     R1                      ; 53F4   03D9
        DECLE   $4BD9,  $8BBB,  $C0D9,  $4F43   ; 53F5   4BD9 8BBB C0D9 4F43
        DECLE   $7A53,  $AF7C,  $F024,  $9875   ; 53F9   7A53 AF7C F024 9875
        DECLE   $85E5,  $1465,  $B700           ; 53FD   85E5 1465 B700
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;; ======================================================================== ;;
