(define (problem sokoban)
(:domain sokobanDomain)
(:objects P1 P2 P3 P4 P5 P6 P7 P8 P9 P10 P11 P12 P13 P14 P15 P16 P17 P18 P19 P20 P21 P22 P23 P24 P25 P26 P27 P28 P29 P30 P31 P32 P33 P34 P35 P36 P37 P38 P39 P40 P41 P42 P43 P44 P45 P46 P47 P48 - case)
(:INIT (NotGuard P1) (NotBlock P1) (NotGuard P2) (NotBlock P2) (NotGuard P7) (NotBlock P7) (NotGuard P8) (NotBlock P8) (NotGuard P10) (NotBlock P10) (NotGuard P11) (NotBlock P11) (NotGuard P16) (NotBlock P16) (NotGuard P17) (NotBlock P17) (NotGuard P20) (NotBlock P20) (NotGuard P21) (NotBlock P21) (Block P22) (NotGuard P22) (NotGuard P23) (NotBlock P23) (NotGuard P26) (NotBlock P26) (Guard P28) (NotBlock P28) (NotGuard P29) (NotBlock P29) (NotGuard P32) (NotBlock P32) (Block P33)(NotGuard P33) (Block P34) (NotGuard P34) (NotGuard P35) (NotBlock P35) (NotGuard P39) (NotBlock P39) (NotGuard P40) (NotBlock P40) (NotGuard P41) (NotBlock P41) (NotGuard P43) (NotBlock P43) (isRight P2 P1) (isRight P3 P2) (isRight P4 P3) (isRight P5 P4) (isRight P6 P5) (isRight P7 P6) (isRight P8 P7) (isRight P9 P8) (isRight P10 P9) (isRight P11 P10) (isRight P12 P11) (isRight P13 P12) (isRight P14 P13) (isRight P15 P14) (isRight P16 P15) (isRight P17 P16) (isRight P18 P17) (isRight P19 P18) (isRight P20 P19) (isRight P21 P20) (isRight P22 P21) (isRight P23 P22) (isRight P24 P23) (isRight P25 P24) (isRight P26 P25) (isRight P27 P26) (isRight P28 P27) (isRight P29 P28) (isRight P30 P29) (isRight P31 P30) (isRight P32 P31) (isRight P33 P32) (isRight P34 P33) (isRight P35 P34) (isRight P36 P35) (isRight P37 P36) (isRight P38 P37) (isRight P39 P38) (isRight P40 P39) (isRight P41 P40) (isRight P42 P41) (isRight P43 P42) (isRight P44 P43) (isRight P45 P44) (isRight P46 P45) (isRight P47 P46) (isRight P48 P47) (over P1 P7) (over P2 P8) (over P3 P9) (over P4 P10) (over P5 P11) (over P6 P12) (over P7 P13) (over P8 P14) (over P9 P15) (over P10 P16) (over P11 P17) (over P12 P18) (over P13 P19) (over P14 P20) (over P15 P21) (over P16 P22) (over P17 P23) (over P18 P24) (over P19 P25) (over P20 P26) (over P21 P27) (over P22 P28) (over P23 P29) (over P24 P30) (over P25 P31) (over P26 P32) (over P27 P33) (over P28 P34) (over P29 P35) (over P30 P36) (over P31 P37) (over P32 P38) (over P33 P39) (over P34 P40) (over P35 P41) (over P36 P42) (over P37 P43) (over P38 P44) (over P39 P45) (over P40 P46) (over P41 P47) (over P42 P48) )
(:goal (and (Block P17) (Block P22) (Block P34) )))