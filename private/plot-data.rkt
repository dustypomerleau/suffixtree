#lang racket/base
(require plot)
;; This is the data from brute-force.  x coordintes are length of string, y coordinates are milliseconds to construction.
(define data1 (map list->vector 
                   '((100 14.990234375) (110 16.52294921875) (120 17.443115234375) (130 20.457763671875) (140 23.302001953125) (150 23.739013671875) (160 26.3349609375) (170 27.94482421875) (180 78.650146484375) (190 31.906982421875) (200 34.135009765625) (210 34.589111328125) (220 37.965087890625) (230 39.967041015625) (240 41.73193359375) (250 44.333984375) (260 46.659912109375) (270 48.37890625) (280 51.503173828125) (290 63.3330078125) (300 107.18798828125) (310 57.0869140625) (320 59.1298828125) (330 60.94189453125) (340 64.843994140625) (350 67.240966796875) (360 69.3681640625) (370 74.322021484375) (380 72.60595703125) (390 120.06396484375) (400 77.0859375) (410 79.2548828125) (420 102.094970703125) (430 91.01708984375) (440 99.656005859375) (450 137.089111328125) (460 94.0849609375) (470 97.7880859375) (480 97.972900390625) (490 97.69091796875) (500 102.8740234375) (510 157.095947265625) (520 115.306884765625) (530 107.862060546875) (540 112.04296875) (550 113.037841796875) (560 166.109130859375) (570 117.38720703125) (580 120.919921875) (590 123.032958984375) (600 185.81298828125) (610 128.01318359375) (620 129.58203125) (630 135.343994140625) (640 182.10888671875) (650 137.47900390625) (660 155.47802734375) (670 143.3740234375) (680 190.7529296875) (690 151.052001953125) (700 150.214111328125) (710 198.387939453125) (720 176.541015625) (730 157.14599609375) (740 160.260986328125) (750 210.9169921875) (760 166.7880859375) (770 168.614013671875) (780 231.897216796875) (790 174.39501953125) (800 177.783935546875) (810 228.445068359375) (820 183.365966796875) (830 199.5849609375) (840 234.89794921875) (850 192.714111328125) (860 192.307861328125) (870 242.197021484375) (880 210.905029296875) (890 245.43994140625) (900 205.92919921875) (910 205.046875) (920 270.304931640625) (930 209.83203125) (940 214.719970703125) (950 261.2919921875) (960 235.14404296875) (970 263.048828125) (980 226.872802734375) (990 319.7099609375) (1000 240.81982421875) (1010 231.51123046875) (1020 281.621826171875) (1030 236.009033203125) (1040 297.964111328125) (1050 241.9619140625) (1060 294.7509765625) (1070 248.845947265625) (1080 312.903076171875) (1090 254.399169921875) (1100 304.9189453125) (1110 276.463134765625) (1120 310.0869140625) (1130 271.43994140625) (1140 315.282958984375) (1150 281.282958984375) (1160 322.01513671875) (1170 274.64111328125) (1180 341.27685546875) (1190 281.39404296875) (1200 333.381103515625) (1210 304.379150390625) (1220 336.45703125) (1230 293.48681640625) (1240 357.434814453125) (1250 295.748046875) (1260 348.1240234375) (1270 369.084228515625) (1280 306.424072265625) (1290 356.06298828125) (1300 328.552978515625) (1310 356.947021484375) (1320 321.800048828125) (1330 378.841064453125) (1340 371.06005859375) (1350 322.470947265625) (1360 386.906005859375) (1370 331.206787109375) (1380 374.73876953125) (1390 397.33203125) (1400 344.923828125) (1410 401.051025390625) (1420 392.115966796875) (1430 350.950927734375) (1440 409.8291015625) (1450 403.160888671875) (1460 367.3310546875) (1470 423.15087890625) (1480 420.708984375) (1490 377.89599609375) (1500 416.788818359375) (1510 433.27099609375) (1520 373.800048828125) (1530 442.95703125) (1540 440.81591796875) (1550 434.716064453125) (1560 398.26318359375) (1570 438.8720703125) (1580 448.68603515625) (1590 393.282958984375) (1600 443.39599609375) (1610 458.89208984375) (1620 448.278076171875) (1630 418.13720703125) (1640 452.518798828125) (1650 475.0400390625) (1660 466.18701171875) (1670 479.001220703125) (1680 421.916015625) (1690 486.26806640625) (1700 476.717041015625) (1710 475.31494140625) (1720 492.442138671875) (1730 432.796142578125) (1740 491.65185546875) (1750 488.822021484375) (1760 540.98779296875) (1770 493.455810546875) (1780 610.56591796875) (1790 512.760986328125) (1800 544.965087890625) (1810 578.65087890625) (1820 606.613037109375) (1830 623.594970703125) (1840 585.760986328125) (1850 599.956787109375) (1860 540.0849609375) (1870 481.39111328125) (1880 688.32080078125) (1890 542.10302734375) (1900 547.535888671875) (1910 545.343994140625) (1920 679.3349609375) (1930 558.718017578125) (1940 550.350830078125) (1950 569.0419921875) (1960 561.10986328125) (1970 578.541015625) (1980 564.444091796875) (1990 583.177001953125))))

(define data2 (map list->vector
                   '((100 15.26611328125) (110 17.322021484375) (120 18.533935546875) (130 21.302001953125) (140 21.946044921875) (150 25.56103515625) (160 26.802001953125) (170 29.05810546875) (180 78.237060546875) (190 35.326904296875) (200 35.027099609375) (210 35.965087890625) (220 38.471923828125) (230 40.178955078125) (240 42.897216796875) (250 44.702880859375) (260 47.886962890625) (270 48.7548828125) (280 52.074951171875) (290 53.136962890625) (300 59.4990234375) (310 59.91796875) (320 106.301025390625) (330 72.30712890625) (340 64.751953125) (350 67.39501953125) (360 70.869140625) (370 77.734130859375) (380 74.528076171875) (390 78.2978515625) (400 79.02099609375) (410 127.39990234375) (420 89.879150390625) (430 88.6728515625) (440 97.25390625) (450 101.60595703125) (460 95.028076171875) (470 99.639892578125) (480 145.284912109375) (490 101.784912109375) (500 103.0419921875) (510 105.0830078125) (520 112.697998046875) (530 112.890869140625) (540 167.241943359375) (550 116.18994140625) (560 121.95703125) (570 120.05419921875) (580 123.178955078125) (590 173.01806640625) (600 130.89404296875) (610 138.23291015625) (620 133.51806640625) (630 139.778076171875) (640 184.237060546875) (650 141.221923828125) (660 146.3701171875) (670 149.2138671875) (680 204.281005859375) (690 154.538818359375) (700 156.544921875) (710 156.7939453125) (720 224.295166015625) (730 197.2490234375) (740 164.174072265625) (750 180.176025390625) (760 226.118896484375) (770 178.89794921875) (780 178.718017578125) (790 235.333984375) (800 185.9580078125) (810 181.2890625) (820 186.640869140625) (830 242.947998046875) (840 200.631103515625) (850 197.43798828125) (860 242.263916015625) (870 202.135986328125) (880 213.446044921875) (890 253.0009765625) (900 210.87890625) (910 208.317138671875) (920 263.52197265625) (930 221.10302734375) (940 220.047119140625) (950 265.513916015625) (960 229.320068359375) (970 235.660888671875) (980 281.200927734375) (990 229.93603515625) (1000 238.552978515625) (1010 292.27587890625) (1020 243.78515625) (1030 290.091064453125) (1040 248.426025390625) (1050 255.827880859375) (1060 302.1650390625) (1070 255.23583984375) (1080 314.9658203125) (1090 262.301025390625) (1100 259.906982421875) (1110 312.846923828125) (1120 275.796142578125) (1130 316.489013671875) (1140 271.800048828125) (1150 334.93701171875) (1160 285.630859375) (1170 279.031982421875) (1180 345.8388671875) (1190 288.386962890625) (1200 334.14697265625) (1210 295.570068359375) (1220 351.555908203125) (1230 301.547119140625) (1240 352.257080078125) (1250 311.822021484375) (1260 351.966064453125) (1270 314.168212890625) (1280 370.7568359375) (1290 310.833984375) (1300 376.01904296875) (1310 324.89404296875) (1320 372.572998046875) (1330 340.64892578125) (1340 379.22802734375) (1350 331.384033203125) (1360 393.672119140625) (1370 340.635986328125) (1380 391.501220703125) (1390 351.799072265625) (1400 395.5390625) (1410 410.614013671875) (1420 383.72509765625) (1430 440.301025390625) (1440 365.77197265625) (1450 409.008056640625) (1460 374.4169921875) (1470 414.905029296875) (1480 423.447998046875) (1490 385.861083984375) (1500 423.827880859375) (1510 391.1279296875) (1520 428.214111328125) (1530 434.177978515625) (1540 398.992919921875) (1550 440.06103515625) (1560 401.337158203125) (1570 443.2978515625) (1580 462.491943359375) (1590 406.4541015625) (1600 452.47802734375) (1610 468.507080078125) (1620 415.6669921875) (1630 473.257080078125) (1640 465.178955078125) (1650 429.26611328125) (1660 472.62109375) (1670 480.718017578125) (1680 475.0009765625) (1690 491.90087890625) (1700 483.43212890625) (1710 456.050048828125) (1720 488.77587890625) (1730 506.14306640625) (1740 500.31884765625) (1750 453.172119140625) (1760 508.830078125) (1770 511.800048828125) (1780 471.0400390625) (1790 512.9169921875) (1800 529.0087890625) (1810 525.3720703125) (1820 472.256103515625) (1830 539.251953125) (1840 524.95703125) (1850 540.6611328125) (1860 487.759033203125) (1870 539.511962890625) (1880 534.781982421875) (1890 550.39794921875) (1900 549.302978515625) (1910 511.929931640625) (1920 549.032958984375) (1930 565.944091796875) (1940 557.0810546875) (1950 569.93994140625) (1960 519.06201171875) (1970 561.802978515625) (1980 576.126953125) (1990 569.794921875))))

(define data3 (map list->vector
                   '((100 15.51416015625) (110 16.431884765625) (120 18.156982421875) (130 20.269775390625) (140 22.35400390625) (150 25.743896484375) (160 26.2041015625) (170 29.47900390625) (180 78.666015625) (190 33.298095703125) (200 38.39013671875) (210 36.501953125) (220 38.951171875) (230 40.633056640625) (240 42.091064453125) (250 42.724853515625) (260 44.237060546875) (270 47.2890625) (280 49.965087890625) (290 51.532958984375) (300 53.162841796875) (310 100.491943359375) (320 56.52587890625) (330 65.02294921875) (340 63.661865234375) (350 64.003173828125) (360 66.94189453125) (370 68.35791015625) (380 72.802978515625) (390 115.765869140625) (400 73.47900390625) (410 78.18408203125) (420 80.8310546875) (430 83.18505859375) (440 89.172119140625) (450 86.572998046875) (460 138.699951171875) (470 92.52587890625) (480 93.599853515625) (490 97.7080078125) (500 98.4560546875) (510 101.06494140625) (520 146.0390625) (530 109.971923828125) (540 106.705078125) (550 117.922119140625) (560 112.323974609375) (570 161.35107421875) (580 116.158935546875) (590 119.76708984375) (600 123.800048828125) (610 169.89208984375) (620 127.275146484375) (630 136.345947265625) (640 131.048095703125) (650 136.555908203125) (660 177.280029296875) (670 139.561767578125) (680 141.39306640625) (690 147.8759765625) (700 192.963134765625) (710 153.02392578125) (720 150.051025390625) (730 196.9951171875) (740 159.802978515625) (750 166.198974609375) (760 161.1611328125) (770 207.82080078125) (780 166.703857421875) (790 169.59716796875) (800 217.215087890625) (810 182.158203125) (820 180.919921875) (830 219.220947265625) (840 181.501953125) (850 184.381103515625) (860 238.327880859375) (870 191.151123046875) (880 190.572998046875) (890 236.678955078125) (900 209.808837890625) (910 207.2109375) (920 247.60888671875) (930 201.30908203125) (940 251.123046875) (950 214.925048828125) (960 210.473876953125) (970 258.362060546875) (980 217.5810546875) (990 223.366943359375) (1000 271.9599609375) (1010 225.77001953125) (1020 271.161865234375) (1030 276.85205078125) (1040 278.94189453125) (1050 240.9111328125) (1060 239.322998046875) (1070 292.882080078125) (1080 245.018798828125) (1090 288.43603515625) (1100 249.526123046875) (1110 301.763916015625) (1120 258.160888671875) (1130 302.052001953125) (1140 266.877197265625) (1150 310.2060546875) (1160 263.882080078125) (1170 316.19482421875) (1180 274.631103515625) (1190 319.031005859375) (1200 274.078857421875) (1210 330.092041015625) (1220 283.576904296875) (1230 327.158203125) (1240 283.81591796875) (1250 343.35498046875) (1260 287.100830078125) (1270 341.02197265625) (1280 304.76513671875) (1290 342.87890625) (1300 304.080078125) (1310 354.856201171875) (1320 309.532958984375) (1330 355.298095703125) (1340 365.171875) (1350 316.303955078125) (1360 365.14599609375) (1370 328.934814453125) (1380 365.44091796875) (1390 331.623046875) (1400 375.202880859375) (1410 372.217041015625) (1420 343.80908203125) (1430 381.0390625) (1440 386.993896484375) (1450 354.18212890625) (1460 390.06103515625) (1470 348.46484375) (1480 401.0771484375) (1490 398.802001953125) (1500 365.73388671875) (1510 400.81494140625) (1520 409.469970703125) (1530 379.512939453125) (1540 404.2470703125) (1550 421.9990234375) (1560 373.550048828125) (1570 417.8369140625) (1580 430.368896484375) (1590 393.863037109375) (1600 460.346923828125) (1610 452.412109375) (1620 399.16796875) (1630 435.89794921875) (1640 437.31005859375) (1650 452.275146484375) (1660 399.501953125) (1670 454.10791015625) (1680 450.927001953125) (1690 470.027099609375) (1700 418.511962890625) (1710 469.360107421875) (1720 465.149169921875) (1730 473.98583984375) (1740 427.654052734375) (1750 468.300048828125) (1760 482.2958984375) (1770 479.4609375) (1780 447.02587890625) (1790 479.052001953125) (1800 489.39404296875) (1810 489.06591796875) (1820 501.02001953125) (1830 454.3408203125) (1840 500.900146484375) (1850 538.711181640625) (1860 506.725830078125) (1870 506.9990234375) (1880 515.870849609375) (1890 468.289794921875) (1900 485.69287109375) (1910 521.97607421875) (1920 483.014892578125) (1930 529.029052734375) (1940 492.89892578125) (1950 485.117919921875) (1960 538.024169921875) (1970 494.948974609375) (1980 552.215087890625) (1990 503.460205078125))))

(define data-ukkonen
  (map list->vector
       '((100 31.324951171875) (110 34.505859375) (120 36.193115234375) (130 38.297119140625) (140 43.240966796875) (150 46.27783203125) (160 49.028076171875) (170 58.3349609375) (180 55.97705078125) (190 59.34716796875) (200 61.318115234375) (210 65.461181640625) (220 67.43994140625) (230 70.7099609375) (240 74.178955078125) (250 77.492919921875) (260 80.033935546875) (270 85.318115234375) (280 87.720947265625) (290 88.75) (300 91.906982421875) (310 102.94287109375) (320 103.25) (330 104.741943359375) (340 107.10888671875) (350 179.679931640625) (360 120.44921875) (370 116.7099609375) (380 118.97802734375) (390 127.738037109375) (400 122.779052734375) (410 125.840087890625) (420 130.0068359375) (430 136.093994140625) (440 136.380859375) (450 140.908935546875) (460 142.39990234375) (470 157.203857421875) (480 151.903076171875) (490 151.037109375) (500 155.947021484375) (510 232.9091796875) (520 168.736083984375) (530 166.65185546875) (540 168.01708984375) (550 167.701171875) (560 173.56591796875) (570 181.7861328125) (580 188.505126953125) (590 188.648193359375) (600 187.841064453125) (610 192.67578125) (620 192.64208984375) (630 201.774169921875) (640 276.43701171875) (650 202.430908203125) (660 205.12890625) (670 211.260986328125) (680 223.580810546875) (690 215.7490234375) (700 217.9921875) (710 222.3681640625) (720 232.125) (730 229.68505859375) (740 303.77197265625) (750 236.0009765625) (760 243.625) (770 248.37890625) (780 246.045166015625) (790 245.423828125) (800 253.552001953125) (810 252.226806640625) (820 255.526123046875) (830 334.923095703125) (840 305.046142578125) (850 267.296142578125) (860 298.802001953125) (870 279.7880859375) (880 275.907958984375) (890 274.823974609375) (900 288.655029296875) (910 373.2041015625) (920 285.4970703125) (930 297.27392578125) (940 300.194091796875) (950 296.7451171875) (960 296.3359375) (970 329.11181640625) (980 386.81005859375) (990 309.4560546875) (1000 323.177001953125) (1010 316.78515625) (1020 316.31396484375) (1030 325.5830078125) (1040 333.109130859375) (1050 405.9990234375) (1060 339.401123046875) (1070 337.522216796875) (1080 335.134033203125) (1090 354.201904296875) (1100 342.843994140625) (1110 432.280029296875) (1120 359.243896484375) (1130 357.156982421875) (1140 360.486083984375) (1150 376.39599609375) (1160 362.81298828125) (1170 452.778076171875) (1180 379.326904296875) (1190 395.26904296875) (1200 386.446044921875) (1210 383.33203125) (1220 394.482177734375) (1230 502.02392578125) (1240 394.247802734375) (1250 396.23291015625) (1260 395.77392578125) (1270 401.8701171875) (1280 482.734130859375) (1290 437.385009765625) (1300 410.822998046875) (1310 409.787109375) (1320 421.933837890625) (1330 495.385009765625) (1340 430.035888671875) (1350 420.8310546875) (1360 435.52197265625) (1370 431.02392578125) (1380 440.804931640625) (1390 517.2412109375) (1400 440.659912109375) (1410 464.48193359375) (1420 443.692138671875) (1430 459.177978515625) (1440 530.262939453125) (1450 461.091064453125) (1460 457.2021484375) (1470 472.66796875) (1480 537.7109375) (1490 474.0498046875) (1500 470.35205078125) (1510 482.92919921875) (1520 471.838134765625) (1530 569.16796875) (1540 486.175048828125) (1550 496.8359375) (1560 621.48486328125) (1570 500.114990234375) (1580 580.0458984375) (1590 515.580078125) (1600 505.858154296875) (1610 509.26708984375) (1620 615.552978515625) (1630 517.885009765625) (1640 522.494140625) (1650 517.106201171875) (1660 609.199951171875) (1670 522.85498046875) (1680 533.135009765625) (1690 533.52294921875) (1700 625.662841796875) (1710 541.173095703125) (1720 539.5380859375) (1730 552.364013671875) (1740 627.537109375) (1750 558.433837890625) (1760 552.902099609375) (1770 567.45703125) (1780 645.764892578125) (1790 570.55908203125) (1800 585.448974609375) (1810 572.296142578125) (1820 655.559814453125) (1830 627.0400390625) (1840 584.027099609375) (1850 676.014892578125) (1860 579.8369140625) (1870 599.761962890625) (1880 595.93408203125) (1890 685.703857421875) (1900 623.0439453125) (1910 606.50390625) (1920 684.994873046875) (1930 620.215087890625) (1940 611.363037109375) (1950 697.68310546875) (1960 627.141845703125) (1970 618.73388671875) (1980 628.455078125) (1990 717.84814453125))))

(define data-ukkonen-revised
  (map list->vector
       '((100 22.92919921875) (110 26.9140625) (120 28.18603515625) (130 29.859130859375) (140 32.52294921875) (150 34.885986328125) (160 36.672119140625) (170 52.1630859375) (180 41.76806640625) (190 43.760986328125) (200 45.74609375) (210 48.739013671875) (220 51.64599609375) (230 54.570068359375) (240 56.80908203125) (250 58.56201171875) (260 60.04296875) (270 64.1298828125) (280 64.89306640625) (290 67.64794921875) (300 119.453125) (310 72.938232421875) (320 74.89111328125) (330 88.22705078125) (340 86.845947265625) (350 82.4990234375) (360 86.041015625) (370 86.1240234375) (380 87.9638671875) (390 92.435791015625) (400 119.59912109375) (410 106.782958984375) (420 98.583984375) (430 100.016845703125) (440 115.77490234375) (450 105.70703125) (460 107.260009765625) (470 161.10595703125) (480 112.552001953125) (490 113.907958984375) (500 117.2138671875) (510 118.4140625) (520 133.797119140625) (530 130.49609375) (540 127.4130859375) (550 127.867919921875) (560 133.44580078125) (570 132.156982421875) (580 136.609130859375) (590 202.360107421875) (600 142.73583984375) (610 142.593994140625) (620 145.77685546875) (630 148.755859375) (640 150.965087890625) (650 154.833984375) (660 172.577880859375) (670 155.927001953125) (680 158.494140625) (690 212.150146484375) (700 163.4501953125) (710 168.0) (720 181.6318359375) (730 170.841064453125) (740 172.13818359375) (750 178.6650390625) (760 178.10986328125) (770 251.35302734375) (780 181.807861328125) (790 185.25) (800 188.80810546875) (810 189.886962890625) (820 203.955078125) (830 208.31201171875) (840 195.708984375) (850 252.27001953125) (860 204.427978515625) (870 222.364013671875) (880 205.1669921875) (890 209.764892578125) (900 212.302001953125) (910 214.98486328125) (920 279.6298828125) (930 218.77294921875) (940 222.126953125) (950 263.593017578125) (960 245.920166015625) (970 227.830078125) (980 234.3662109375) (990 288.609130859375) (1000 254.39892578125) (1010 245.221923828125) (1020 248.261962890625) (1030 247.989013671875) (1040 263.201171875) (1050 297.39697265625) (1060 250.2138671875) (1070 264.01904296875) (1080 253.991943359375) (1090 255.76904296875) (1100 261.4521484375) (1110 329.837158203125) (1120 262.860107421875) (1130 268.13916015625) (1140 268.493896484375) (1150 283.10302734375) (1160 325.736083984375) (1170 278.058837890625) (1180 297.532958984375) (1190 279.35791015625) (1200 283.741943359375) (1210 283.276123046875) (1220 352.02001953125) (1230 288.864013671875) (1240 292.006103515625) (1250 314.244140625) (1260 294.51220703125) (1270 352.380126953125) (1280 313.9541015625) (1290 301.76806640625) (1300 308.60400390625) (1310 325.096923828125) (1320 361.68603515625) (1330 314.046142578125) (1340 327.72705078125) (1350 317.941162109375) (1360 323.34912109375) (1370 391.14990234375) (1380 323.965087890625) (1390 328.926025390625) (1400 343.41796875) (1410 387.387939453125) (1420 339.278076171875) (1430 355.619140625) (1440 340.18505859375) (1450 344.171875) (1460 405.798095703125) (1470 346.71484375) (1480 358.575927734375) (1490 359.759033203125) (1500 407.822021484375) (1510 366.2939453125) (1520 356.900146484375) (1530 365.464111328125) (1540 442.88818359375) (1550 366.175048828125) (1560 380.863037109375) (1570 371.050048828125) (1580 437.570068359375) (1590 396.111083984375) (1600 378.02099609375) (1610 424.94091796875) (1620 446.201904296875) (1630 387.220947265625) (1640 405.587890625) (1650 391.788818359375) (1660 467.212890625) (1670 397.674072265625) (1680 397.733154296875) (1690 422.794921875) (1700 464.0791015625) (1710 416.60595703125) (1720 412.1279296875) (1730 425.336181640625) (1740 474.007080078125) (1750 423.74609375) (1760 416.400146484375) (1770 481.9580078125) (1780 440.341796875) (1790 423.98095703125) (1800 439.197021484375) (1810 491.2451171875) (1820 448.135009765625) (1830 432.807861328125) (1840 513.40087890625) (1850 438.255859375) (1860 443.666015625) (1870 474.450927734375) (1880 527.592041015625) (1890 457.549072265625) (1900 451.48095703125) (1910 535.5390625) (1920 453.73291015625) (1930 468.444091796875) (1940 461.010009765625) (1950 541.7568359375) (1960 461.7841796875) (1970 477.498046875) (1980 537.536865234375) (1990 484.6611328125))))

(plot (list (points data1 #:color 'red)
            (points data2 #:color 'blue)
            (points data3 #:color 'green)
            (points data-ukkonen #:color 'black)
            (points data-ukkonen-revised #:color 'gray)
            )
      #:x-min 100
      #:x-max 2000
      #:y-min 14
      #:y-max 600)