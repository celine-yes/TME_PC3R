# maxx 1
# maxx 2
wm title . "scenario"
wm geometry . 640x600+650+100
canvas .c -width 800 -height 800 \
	-scrollregion {0c -1c 30c 100c} \
	-xscrollcommand ".hscroll set" \
	-yscrollcommand ".vscroll set" \
	-bg white -relief raised -bd 2
scrollbar .vscroll -relief sunken  -command ".c yview"
scrollbar .hscroll -relief sunken -orient horiz  -command ".c xview"
pack append . \
	.vscroll {right filly} \
	.hscroll {bottom fillx} \
	.c {top expand fill}
.c yview moveto 0
# ProcLine[1] stays at 0 (Used 0 nobox 0)
.c create rectangle 104 0 180 20 -fill black
# ProcLine[1] stays at 0 (Used 0 nobox 0)
.c create rectangle 103 -2 177 18 -fill ivory
.c create text 140 8 -text "0::init:"
.c create text 70 32 -fill #eef -text "1"
.c create line 140 32 460 32 -fill #eef -dash {6 4}
.c create line 300 36 300 20 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 0 to 1 (Used 0 nobox 0)
.c create rectangle 278 24 326 44 -fill black
# ProcLine[2] stays at 1 (Used 0 nobox 0)
.c create rectangle 276 22 324 42 -fill ivory
.c create text 300 32 -text "1:feu"
.c create text 70 56 -fill #eef -text "3"
.c create line 140 56 460 56 -fill #eef -dash {6 4}
.c create line 460 36 460 44 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 0 to 3 (Used 0 nobox 0)
.c create rectangle 400 48 524 68 -fill black
# ProcLine[3] stays at 3 (Used 0 nobox 0)
.c create rectangle 399 46 521 66 -fill ivory
.c create text 460 56 -text "2:observateur"
.c create text 70 80 -fill #eef -text "5"
.c create line 140 80 460 80 -fill #eef -dash {6 4}
.c create line 300 48 300 68 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 1 to 5 (Used 1 nobox 0)
# ProcLine[2] stays at 5 (Used 1 nobox 1)
.c create rectangle 226 70 374 90 -fill white -width 0
.c create text 300 80 -text "observe!ORANGE,1"
.c create line 300 90 380 90 -fill darkred -tags mesg -width 2
.c create line 380 90 460 90 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 104 -fill #eef -text "7"
.c create line 140 104 460 104 -fill #eef -dash {6 4}
.c create line 460 72 460 92 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 3 to 7 (Used 1 nobox 1)
# ProcLine[3] stays at 7 (Used 1 nobox 1)
.c create rectangle 386 94 534 114 -fill white -width 0
.c create text 460 104 -text "observe?ORANGE,1"
.c create text 70 128 -fill #eef -text "9"
.c create line 140 128 460 128 -fill #eef -dash {6 4}
.c create line 300 96 300 116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 5 to 9 (Used 1 nobox 1)
# ProcLine[2] stays at 9 (Used 1 nobox 1)
.c create rectangle 226 118 374 138 -fill white -width 0
.c create text 300 128 -text "observe!ORANGE,1"
.c create line 300 138 380 138 -fill darkred -tags mesg -width 2
.c create line 380 138 460 138 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 152 -fill #eef -text "11"
.c create line 140 152 460 152 -fill #eef -dash {6 4}
.c create line 460 120 460 140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 7 to 11 (Used 1 nobox 1)
# ProcLine[3] stays at 11 (Used 1 nobox 1)
.c create rectangle 386 142 534 162 -fill white -width 0
.c create text 460 152 -text "observe?ORANGE,1"
.c create text 70 176 -fill #eef -text "13"
.c create line 140 176 460 176 -fill #eef -dash {6 4}
.c create line 300 144 300 164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 9 to 13 (Used 1 nobox 1)
# ProcLine[2] stays at 13 (Used 1 nobox 1)
.c create rectangle 228 166 372 186 -fill white -width 0
.c create text 300 176 -text "observe!ROUGE,0"
.c create line 300 186 380 186 -fill darkred -tags mesg -width 2
.c create line 380 186 460 186 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 200 -fill #eef -text "15"
.c create line 140 200 460 200 -fill #eef -dash {6 4}
.c create line 460 168 460 188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 11 to 15 (Used 1 nobox 1)
# ProcLine[3] stays at 15 (Used 1 nobox 1)
.c create rectangle 388 190 532 210 -fill white -width 0
.c create text 460 200 -text "observe?ROUGE,0"
.c create text 70 224 -fill #eef -text "17"
.c create line 140 224 460 224 -fill #eef -dash {6 4}
.c create line 300 192 300 212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 13 to 17 (Used 1 nobox 1)
# ProcLine[2] stays at 17 (Used 1 nobox 1)
.c create rectangle 234 214 366 234 -fill white -width 0
.c create text 300 224 -text "observe!VERT,0"
.c create line 300 234 380 234 -fill darkred -tags mesg -width 2
.c create line 380 234 460 234 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 248 -fill #eef -text "19"
.c create line 140 248 460 248 -fill #eef -dash {6 4}
.c create line 460 216 460 236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 15 to 19 (Used 1 nobox 1)
# ProcLine[3] stays at 19 (Used 1 nobox 1)
.c create rectangle 394 238 526 258 -fill white -width 0
.c create text 460 248 -text "observe?VERT,0"
.c create text 70 272 -fill #eef -text "21"
.c create line 140 272 460 272 -fill #eef -dash {6 4}
.c create line 300 240 300 260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 17 to 21 (Used 1 nobox 1)
# ProcLine[2] stays at 21 (Used 1 nobox 1)
.c create rectangle 226 262 374 282 -fill white -width 0
.c create text 300 272 -text "observe!ORANGE,0"
.c create line 300 282 380 282 -fill darkred -tags mesg -width 2
.c create line 380 282 460 282 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 296 -fill #eef -text "23"
.c create line 140 296 460 296 -fill #eef -dash {6 4}
.c create line 460 264 460 284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 19 to 23 (Used 1 nobox 1)
# ProcLine[3] stays at 23 (Used 1 nobox 1)
.c create rectangle 386 286 534 306 -fill white -width 0
.c create text 460 296 -text "observe?ORANGE,0"
.c create text 70 320 -fill #eef -text "25"
.c create line 140 320 460 320 -fill #eef -dash {6 4}
.c create line 300 288 300 308 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 21 to 25 (Used 1 nobox 1)
# ProcLine[2] stays at 25 (Used 1 nobox 1)
.c create rectangle 226 310 374 330 -fill white -width 0
.c create text 300 320 -text "observe!ORANGE,0"
.c create line 300 330 380 330 -fill darkred -tags mesg -width 2
.c create line 380 330 460 330 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 344 -fill #eef -text "27"
.c create line 140 344 460 344 -fill #eef -dash {6 4}
.c create line 460 312 460 332 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 23 to 27 (Used 1 nobox 1)
# ProcLine[3] stays at 27 (Used 1 nobox 1)
.c create rectangle 386 334 534 354 -fill white -width 0
.c create text 460 344 -text "observe?ORANGE,0"
.c create text 70 368 -fill #eef -text "29"
.c create line 140 368 460 368 -fill #eef -dash {6 4}
.c create line 300 336 300 356 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 25 to 29 (Used 1 nobox 1)
# ProcLine[2] stays at 29 (Used 1 nobox 1)
.c create rectangle 228 358 372 378 -fill white -width 0
.c create text 300 368 -text "observe!ROUGE,0"
.c create line 300 378 380 378 -fill darkred -tags mesg -width 2
.c create line 380 378 460 378 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 392 -fill #eef -text "31"
.c create line 140 392 460 392 -fill #eef -dash {6 4}
.c create line 460 360 460 380 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 27 to 31 (Used 1 nobox 1)
# ProcLine[3] stays at 31 (Used 1 nobox 1)
.c create rectangle 388 382 532 402 -fill white -width 0
.c create text 460 392 -text "observe?ROUGE,0"
.c create text 70 416 -fill #eef -text "33"
.c create line 140 416 460 416 -fill #eef -dash {6 4}
.c create line 300 384 300 404 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 29 to 33 (Used 1 nobox 1)
# ProcLine[2] stays at 33 (Used 1 nobox 1)
.c create rectangle 226 406 374 426 -fill white -width 0
.c create text 300 416 -text "observe!ORANGE,1"
.c create line 300 426 380 426 -fill darkred -tags mesg -width 2
.c create line 380 426 460 426 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 440 -fill #eef -text "35"
.c create line 140 440 460 440 -fill #eef -dash {6 4}
.c create line 460 408 460 428 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 31 to 35 (Used 1 nobox 1)
# ProcLine[3] stays at 35 (Used 1 nobox 1)
.c create rectangle 386 430 534 450 -fill white -width 0
.c create text 460 440 -text "observe?ORANGE,1"
.c create text 70 464 -fill #eef -text "37"
.c create line 140 464 460 464 -fill #eef -dash {6 4}
.c create line 300 432 300 452 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 33 to 37 (Used 1 nobox 1)
# ProcLine[2] stays at 37 (Used 1 nobox 1)
.c create rectangle 226 454 374 474 -fill white -width 0
.c create text 300 464 -text "observe!ORANGE,1"
.c create line 300 474 380 474 -fill darkred -tags mesg -width 2
.c create line 380 474 460 474 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 488 -fill #eef -text "39"
.c create line 140 488 460 488 -fill #eef -dash {6 4}
.c create line 460 456 460 476 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 35 to 39 (Used 1 nobox 1)
# ProcLine[3] stays at 39 (Used 1 nobox 1)
.c create rectangle 386 478 534 498 -fill white -width 0
.c create text 460 488 -text "observe?ORANGE,1"
.c create text 70 512 -fill #eef -text "41"
.c create line 140 512 460 512 -fill #eef -dash {6 4}
.c create line 300 480 300 500 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 37 to 41 (Used 1 nobox 1)
# ProcLine[2] stays at 41 (Used 1 nobox 1)
.c create rectangle 226 502 374 522 -fill white -width 0
.c create text 300 512 -text "observe!ORANGE,1"
.c create line 300 522 380 522 -fill darkred -tags mesg -width 2
.c create line 380 522 460 522 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 536 -fill #eef -text "43"
.c create line 140 536 460 536 -fill #eef -dash {6 4}
.c create line 460 504 460 524 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 39 to 43 (Used 1 nobox 1)
# ProcLine[3] stays at 43 (Used 1 nobox 1)
.c create rectangle 386 526 534 546 -fill white -width 0
.c create text 460 536 -text "observe?ORANGE,1"
.c create text 70 560 -fill #eef -text "45"
.c create line 140 560 460 560 -fill #eef -dash {6 4}
.c create line 300 528 300 548 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 41 to 45 (Used 1 nobox 1)
# ProcLine[2] stays at 45 (Used 1 nobox 1)
.c create rectangle 226 550 374 570 -fill white -width 0
.c create text 300 560 -text "observe!ORANGE,1"
.c create line 300 570 380 570 -fill darkred -tags mesg -width 2
.c create line 380 570 460 570 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 584 -fill #eef -text "47"
.c create line 140 584 460 584 -fill #eef -dash {6 4}
.c create line 460 552 460 572 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 43 to 47 (Used 1 nobox 1)
# ProcLine[3] stays at 47 (Used 1 nobox 1)
.c create rectangle 386 574 534 594 -fill white -width 0
.c create text 460 584 -text "observe?ORANGE,1"
.c create text 70 608 -fill #eef -text "49"
.c create line 140 608 460 608 -fill #eef -dash {6 4}
.c create line 300 576 300 596 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 45 to 49 (Used 1 nobox 1)
# ProcLine[2] stays at 49 (Used 1 nobox 1)
.c create rectangle 226 598 374 618 -fill white -width 0
.c create text 300 608 -text "observe!ORANGE,1"
.c create line 300 618 380 618 -fill darkred -tags mesg -width 2
.c create line 380 618 460 618 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 632 -fill #eef -text "51"
.c create line 140 632 460 632 -fill #eef -dash {6 4}
.c create line 460 600 460 620 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 47 to 51 (Used 1 nobox 1)
# ProcLine[3] stays at 51 (Used 1 nobox 1)
.c create rectangle 386 622 534 642 -fill white -width 0
.c create text 460 632 -text "observe?ORANGE,1"
.c create text 70 656 -fill #eef -text "53"
.c create line 140 656 460 656 -fill #eef -dash {6 4}
.c create line 300 624 300 644 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 49 to 53 (Used 1 nobox 1)
# ProcLine[2] stays at 53 (Used 1 nobox 1)
.c create rectangle 226 646 374 666 -fill white -width 0
.c create text 300 656 -text "observe!ORANGE,1"
.c create line 300 666 380 666 -fill darkred -tags mesg -width 2
.c create line 380 666 460 666 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 680 -fill #eef -text "55"
.c create line 140 680 460 680 -fill #eef -dash {6 4}
.c create line 460 648 460 668 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 51 to 55 (Used 1 nobox 1)
# ProcLine[3] stays at 55 (Used 1 nobox 1)
.c create rectangle 386 670 534 690 -fill white -width 0
.c create text 460 680 -text "observe?ORANGE,1"
.c create text 70 704 -fill #eef -text "57"
.c create line 140 704 460 704 -fill #eef -dash {6 4}
.c create line 300 672 300 692 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 53 to 57 (Used 1 nobox 1)
# ProcLine[2] stays at 57 (Used 1 nobox 1)
.c create rectangle 226 694 374 714 -fill white -width 0
.c create text 300 704 -text "observe!ORANGE,1"
.c create line 300 714 380 714 -fill darkred -tags mesg -width 2
.c create line 380 714 460 714 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 728 -fill #eef -text "59"
.c create line 140 728 460 728 -fill #eef -dash {6 4}
.c create line 460 696 460 716 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 55 to 59 (Used 1 nobox 1)
# ProcLine[3] stays at 59 (Used 1 nobox 1)
.c create rectangle 386 718 534 738 -fill white -width 0
.c create text 460 728 -text "observe?ORANGE,1"
.c create text 70 752 -fill #eef -text "61"
.c create line 140 752 460 752 -fill #eef -dash {6 4}
.c create line 300 720 300 740 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 57 to 61 (Used 1 nobox 1)
# ProcLine[2] stays at 61 (Used 1 nobox 1)
.c create rectangle 226 742 374 762 -fill white -width 0
.c create text 300 752 -text "observe!ORANGE,1"
.c create line 300 762 380 762 -fill darkred -tags mesg -width 2
.c create line 380 762 460 762 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 776 -fill #eef -text "63"
.c create line 140 776 460 776 -fill #eef -dash {6 4}
.c create line 460 744 460 764 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 59 to 63 (Used 1 nobox 1)
# ProcLine[3] stays at 63 (Used 1 nobox 1)
.c create rectangle 386 766 534 786 -fill white -width 0
.c create text 460 776 -text "observe?ORANGE,1"
.c create text 70 800 -fill #eef -text "65"
.c create line 140 800 460 800 -fill #eef -dash {6 4}
.c create line 300 768 300 788 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 61 to 65 (Used 1 nobox 1)
# ProcLine[2] stays at 65 (Used 1 nobox 1)
.c create rectangle 226 790 374 810 -fill white -width 0
.c create text 300 800 -text "observe!ORANGE,1"
.c create line 300 810 380 810 -fill darkred -tags mesg -width 2
.c create line 380 810 460 810 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 824 -fill #eef -text "67"
.c create line 140 824 460 824 -fill #eef -dash {6 4}
.c create line 460 792 460 812 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 63 to 67 (Used 1 nobox 1)
# ProcLine[3] stays at 67 (Used 1 nobox 1)
.c create rectangle 386 814 534 834 -fill white -width 0
.c create text 460 824 -text "observe?ORANGE,1"
.c create text 70 848 -fill #eef -text "69"
.c create line 140 848 460 848 -fill #eef -dash {6 4}
.c create line 300 816 300 836 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 65 to 69 (Used 1 nobox 1)
# ProcLine[2] stays at 69 (Used 1 nobox 1)
.c create rectangle 226 838 374 858 -fill white -width 0
.c create text 300 848 -text "observe!ORANGE,1"
.c create line 300 858 380 858 -fill darkred -tags mesg -width 2
.c create line 380 858 460 858 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 872 -fill #eef -text "71"
.c create line 140 872 460 872 -fill #eef -dash {6 4}
.c create line 460 840 460 860 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 67 to 71 (Used 1 nobox 1)
# ProcLine[3] stays at 71 (Used 1 nobox 1)
.c create rectangle 386 862 534 882 -fill white -width 0
.c create text 460 872 -text "observe?ORANGE,1"
.c create text 70 896 -fill #eef -text "73"
.c create line 140 896 460 896 -fill #eef -dash {6 4}
.c create line 300 864 300 884 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 69 to 73 (Used 1 nobox 1)
# ProcLine[2] stays at 73 (Used 1 nobox 1)
.c create rectangle 226 886 374 906 -fill white -width 0
.c create text 300 896 -text "observe!ORANGE,1"
.c create line 300 906 380 906 -fill darkred -tags mesg -width 2
.c create line 380 906 460 906 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 920 -fill #eef -text "75"
.c create line 140 920 460 920 -fill #eef -dash {6 4}
.c create line 460 888 460 908 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 71 to 75 (Used 1 nobox 1)
# ProcLine[3] stays at 75 (Used 1 nobox 1)
.c create rectangle 386 910 534 930 -fill white -width 0
.c create text 460 920 -text "observe?ORANGE,1"
.c create text 70 944 -fill #eef -text "77"
.c create line 140 944 460 944 -fill #eef -dash {6 4}
.c create line 300 912 300 932 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 73 to 77 (Used 1 nobox 1)
# ProcLine[2] stays at 77 (Used 1 nobox 1)
.c create rectangle 226 934 374 954 -fill white -width 0
.c create text 300 944 -text "observe!ORANGE,1"
.c create line 300 954 380 954 -fill darkred -tags mesg -width 2
.c create line 380 954 460 954 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 968 -fill #eef -text "79"
.c create line 140 968 460 968 -fill #eef -dash {6 4}
.c create line 460 936 460 956 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 75 to 79 (Used 1 nobox 1)
# ProcLine[3] stays at 79 (Used 1 nobox 1)
.c create rectangle 386 958 534 978 -fill white -width 0
.c create text 460 968 -text "observe?ORANGE,1"
.c create text 70 992 -fill #eef -text "81"
.c create line 140 992 460 992 -fill #eef -dash {6 4}
.c create line 300 960 300 980 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 77 to 81 (Used 1 nobox 1)
# ProcLine[2] stays at 81 (Used 1 nobox 1)
.c create rectangle 226 982 374 1002 -fill white -width 0
.c create text 300 992 -text "observe!ORANGE,1"
.c create line 300 1002 380 1002 -fill darkred -tags mesg -width 2
.c create line 380 1002 460 1002 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1016 -fill #eef -text "83"
.c create line 140 1016 460 1016 -fill #eef -dash {6 4}
.c create line 460 984 460 1004 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 79 to 83 (Used 1 nobox 1)
# ProcLine[3] stays at 83 (Used 1 nobox 1)
.c create rectangle 386 1006 534 1026 -fill white -width 0
.c create text 460 1016 -text "observe?ORANGE,1"
.c create text 70 1040 -fill #eef -text "85"
.c create line 140 1040 460 1040 -fill #eef -dash {6 4}
.c create line 300 1008 300 1028 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 81 to 85 (Used 1 nobox 1)
# ProcLine[2] stays at 85 (Used 1 nobox 1)
.c create rectangle 226 1030 374 1050 -fill white -width 0
.c create text 300 1040 -text "observe!ORANGE,1"
.c create line 300 1050 380 1050 -fill darkred -tags mesg -width 2
.c create line 380 1050 460 1050 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1064 -fill #eef -text "87"
.c create line 140 1064 460 1064 -fill #eef -dash {6 4}
.c create line 460 1032 460 1052 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 83 to 87 (Used 1 nobox 1)
# ProcLine[3] stays at 87 (Used 1 nobox 1)
.c create rectangle 386 1054 534 1074 -fill white -width 0
.c create text 460 1064 -text "observe?ORANGE,1"
.c create text 70 1088 -fill #eef -text "89"
.c create line 140 1088 460 1088 -fill #eef -dash {6 4}
.c create line 300 1056 300 1076 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 85 to 89 (Used 1 nobox 1)
# ProcLine[2] stays at 89 (Used 1 nobox 1)
.c create rectangle 226 1078 374 1098 -fill white -width 0
.c create text 300 1088 -text "observe!ORANGE,1"
.c create line 300 1098 380 1098 -fill darkred -tags mesg -width 2
.c create line 380 1098 460 1098 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1112 -fill #eef -text "91"
.c create line 140 1112 460 1112 -fill #eef -dash {6 4}
.c create line 460 1080 460 1100 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 87 to 91 (Used 1 nobox 1)
# ProcLine[3] stays at 91 (Used 1 nobox 1)
.c create rectangle 386 1102 534 1122 -fill white -width 0
.c create text 460 1112 -text "observe?ORANGE,1"
.c create text 70 1136 -fill #eef -text "93"
.c create line 140 1136 460 1136 -fill #eef -dash {6 4}
.c create line 300 1104 300 1124 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 89 to 93 (Used 1 nobox 1)
# ProcLine[2] stays at 93 (Used 1 nobox 1)
.c create rectangle 226 1126 374 1146 -fill white -width 0
.c create text 300 1136 -text "observe!ORANGE,1"
.c create line 300 1146 380 1146 -fill darkred -tags mesg -width 2
.c create line 380 1146 460 1146 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1160 -fill #eef -text "95"
.c create line 140 1160 460 1160 -fill #eef -dash {6 4}
.c create line 460 1128 460 1148 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 91 to 95 (Used 1 nobox 1)
# ProcLine[3] stays at 95 (Used 1 nobox 1)
.c create rectangle 386 1150 534 1170 -fill white -width 0
.c create text 460 1160 -text "observe?ORANGE,1"
.c create text 70 1184 -fill #eef -text "97"
.c create line 140 1184 460 1184 -fill #eef -dash {6 4}
.c create line 300 1152 300 1172 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 93 to 97 (Used 1 nobox 1)
# ProcLine[2] stays at 97 (Used 1 nobox 1)
.c create rectangle 226 1174 374 1194 -fill white -width 0
.c create text 300 1184 -text "observe!ORANGE,1"
.c create line 300 1194 380 1194 -fill darkred -tags mesg -width 2
.c create line 380 1194 460 1194 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1208 -fill #eef -text "99"
.c create line 140 1208 460 1208 -fill #eef -dash {6 4}
.c create line 460 1176 460 1196 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 95 to 99 (Used 1 nobox 1)
# ProcLine[3] stays at 99 (Used 1 nobox 1)
.c create rectangle 386 1198 534 1218 -fill white -width 0
.c create text 460 1208 -text "observe?ORANGE,1"
.c create text 70 1232 -fill #eef -text "101"
.c create line 140 1232 460 1232 -fill #eef -dash {6 4}
.c create line 300 1200 300 1220 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 97 to 101 (Used 1 nobox 1)
# ProcLine[2] stays at 101 (Used 1 nobox 1)
.c create rectangle 226 1222 374 1242 -fill white -width 0
.c create text 300 1232 -text "observe!ORANGE,1"
.c create line 300 1242 380 1242 -fill darkred -tags mesg -width 2
.c create line 380 1242 460 1242 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1256 -fill #eef -text "103"
.c create line 140 1256 460 1256 -fill #eef -dash {6 4}
.c create line 460 1224 460 1244 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 99 to 103 (Used 1 nobox 1)
# ProcLine[3] stays at 103 (Used 1 nobox 1)
.c create rectangle 386 1246 534 1266 -fill white -width 0
.c create text 460 1256 -text "observe?ORANGE,1"
.c create text 70 1280 -fill #eef -text "105"
.c create line 140 1280 460 1280 -fill #eef -dash {6 4}
.c create line 300 1248 300 1268 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 101 to 105 (Used 1 nobox 1)
# ProcLine[2] stays at 105 (Used 1 nobox 1)
.c create rectangle 226 1270 374 1290 -fill white -width 0
.c create text 300 1280 -text "observe!ORANGE,1"
.c create line 300 1290 380 1290 -fill darkred -tags mesg -width 2
.c create line 380 1290 460 1290 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1304 -fill #eef -text "107"
.c create line 140 1304 460 1304 -fill #eef -dash {6 4}
.c create line 460 1272 460 1292 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 103 to 107 (Used 1 nobox 1)
# ProcLine[3] stays at 107 (Used 1 nobox 1)
.c create rectangle 386 1294 534 1314 -fill white -width 0
.c create text 460 1304 -text "observe?ORANGE,1"
.c create text 70 1328 -fill #eef -text "109"
.c create line 140 1328 460 1328 -fill #eef -dash {6 4}
.c create line 300 1296 300 1316 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 105 to 109 (Used 1 nobox 1)
# ProcLine[2] stays at 109 (Used 1 nobox 1)
.c create rectangle 226 1318 374 1338 -fill white -width 0
.c create text 300 1328 -text "observe!ORANGE,1"
.c create line 300 1338 380 1338 -fill darkred -tags mesg -width 2
.c create line 380 1338 460 1338 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1352 -fill #eef -text "111"
.c create line 140 1352 460 1352 -fill #eef -dash {6 4}
.c create line 460 1320 460 1340 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 107 to 111 (Used 1 nobox 1)
# ProcLine[3] stays at 111 (Used 1 nobox 1)
.c create rectangle 386 1342 534 1362 -fill white -width 0
.c create text 460 1352 -text "observe?ORANGE,1"
.c create text 70 1376 -fill #eef -text "113"
.c create line 140 1376 460 1376 -fill #eef -dash {6 4}
.c create line 300 1344 300 1364 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 109 to 113 (Used 1 nobox 1)
# ProcLine[2] stays at 113 (Used 1 nobox 1)
.c create rectangle 226 1366 374 1386 -fill white -width 0
.c create text 300 1376 -text "observe!ORANGE,1"
.c create line 300 1386 380 1386 -fill darkred -tags mesg -width 2
.c create line 380 1386 460 1386 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1400 -fill #eef -text "115"
.c create line 140 1400 460 1400 -fill #eef -dash {6 4}
.c create line 460 1368 460 1388 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 111 to 115 (Used 1 nobox 1)
# ProcLine[3] stays at 115 (Used 1 nobox 1)
.c create rectangle 386 1390 534 1410 -fill white -width 0
.c create text 460 1400 -text "observe?ORANGE,1"
.c create text 70 1424 -fill #eef -text "117"
.c create line 140 1424 460 1424 -fill #eef -dash {6 4}
.c create line 300 1392 300 1412 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 113 to 117 (Used 1 nobox 1)
# ProcLine[2] stays at 117 (Used 1 nobox 1)
.c create rectangle 226 1414 374 1434 -fill white -width 0
.c create text 300 1424 -text "observe!ORANGE,1"
.c create line 300 1434 380 1434 -fill darkred -tags mesg -width 2
.c create line 380 1434 460 1434 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1448 -fill #eef -text "119"
.c create line 140 1448 460 1448 -fill #eef -dash {6 4}
.c create line 460 1416 460 1436 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 115 to 119 (Used 1 nobox 1)
# ProcLine[3] stays at 119 (Used 1 nobox 1)
.c create rectangle 386 1438 534 1458 -fill white -width 0
.c create text 460 1448 -text "observe?ORANGE,1"
.c create text 70 1472 -fill #eef -text "121"
.c create line 140 1472 460 1472 -fill #eef -dash {6 4}
.c create line 300 1440 300 1460 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 117 to 121 (Used 1 nobox 1)
# ProcLine[2] stays at 121 (Used 1 nobox 1)
.c create rectangle 226 1462 374 1482 -fill white -width 0
.c create text 300 1472 -text "observe!ORANGE,1"
.c create line 300 1482 380 1482 -fill darkred -tags mesg -width 2
.c create line 380 1482 460 1482 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1496 -fill #eef -text "123"
.c create line 140 1496 460 1496 -fill #eef -dash {6 4}
.c create line 460 1464 460 1484 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 119 to 123 (Used 1 nobox 1)
# ProcLine[3] stays at 123 (Used 1 nobox 1)
.c create rectangle 386 1486 534 1506 -fill white -width 0
.c create text 460 1496 -text "observe?ORANGE,1"
.c create text 70 1520 -fill #eef -text "125"
.c create line 140 1520 460 1520 -fill #eef -dash {6 4}
.c create line 300 1488 300 1508 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 121 to 125 (Used 1 nobox 1)
# ProcLine[2] stays at 125 (Used 1 nobox 1)
.c create rectangle 226 1510 374 1530 -fill white -width 0
.c create text 300 1520 -text "observe!ORANGE,1"
.c create line 300 1530 380 1530 -fill darkred -tags mesg -width 2
.c create line 380 1530 460 1530 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1544 -fill #eef -text "127"
.c create line 140 1544 460 1544 -fill #eef -dash {6 4}
.c create line 460 1512 460 1532 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 123 to 127 (Used 1 nobox 1)
# ProcLine[3] stays at 127 (Used 1 nobox 1)
.c create rectangle 386 1534 534 1554 -fill white -width 0
.c create text 460 1544 -text "observe?ORANGE,1"
.c create text 70 1568 -fill #eef -text "129"
.c create line 140 1568 460 1568 -fill #eef -dash {6 4}
.c create line 300 1536 300 1556 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 125 to 129 (Used 1 nobox 1)
# ProcLine[2] stays at 129 (Used 1 nobox 1)
.c create rectangle 226 1558 374 1578 -fill white -width 0
.c create text 300 1568 -text "observe!ORANGE,1"
.c create line 300 1578 380 1578 -fill darkred -tags mesg -width 2
.c create line 380 1578 460 1578 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1592 -fill #eef -text "131"
.c create line 140 1592 460 1592 -fill #eef -dash {6 4}
.c create line 460 1560 460 1580 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 127 to 131 (Used 1 nobox 1)
# ProcLine[3] stays at 131 (Used 1 nobox 1)
.c create rectangle 386 1582 534 1602 -fill white -width 0
.c create text 460 1592 -text "observe?ORANGE,1"
.c create text 70 1616 -fill #eef -text "133"
.c create line 140 1616 460 1616 -fill #eef -dash {6 4}
.c create line 300 1584 300 1604 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 129 to 133 (Used 1 nobox 1)
# ProcLine[2] stays at 133 (Used 1 nobox 1)
.c create rectangle 226 1606 374 1626 -fill white -width 0
.c create text 300 1616 -text "observe!ORANGE,1"
.c create line 300 1626 380 1626 -fill darkred -tags mesg -width 2
.c create line 380 1626 460 1626 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1640 -fill #eef -text "135"
.c create line 140 1640 460 1640 -fill #eef -dash {6 4}
.c create line 460 1608 460 1628 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 131 to 135 (Used 1 nobox 1)
# ProcLine[3] stays at 135 (Used 1 nobox 1)
.c create rectangle 386 1630 534 1650 -fill white -width 0
.c create text 460 1640 -text "observe?ORANGE,1"
.c create text 70 1664 -fill #eef -text "137"
.c create line 140 1664 460 1664 -fill #eef -dash {6 4}
.c create line 300 1632 300 1652 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 133 to 137 (Used 1 nobox 1)
# ProcLine[2] stays at 137 (Used 1 nobox 1)
.c create rectangle 226 1654 374 1674 -fill white -width 0
.c create text 300 1664 -text "observe!ORANGE,1"
.c create line 300 1674 380 1674 -fill darkred -tags mesg -width 2
.c create line 380 1674 460 1674 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1688 -fill #eef -text "139"
.c create line 140 1688 460 1688 -fill #eef -dash {6 4}
.c create line 460 1656 460 1676 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 135 to 139 (Used 1 nobox 1)
# ProcLine[3] stays at 139 (Used 1 nobox 1)
.c create rectangle 386 1678 534 1698 -fill white -width 0
.c create text 460 1688 -text "observe?ORANGE,1"
.c create text 70 1712 -fill #eef -text "141"
.c create line 140 1712 460 1712 -fill #eef -dash {6 4}
.c create line 300 1680 300 1700 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 137 to 141 (Used 1 nobox 1)
# ProcLine[2] stays at 141 (Used 1 nobox 1)
.c create rectangle 226 1702 374 1722 -fill white -width 0
.c create text 300 1712 -text "observe!ORANGE,1"
.c create line 300 1722 380 1722 -fill darkred -tags mesg -width 2
.c create line 380 1722 460 1722 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1736 -fill #eef -text "143"
.c create line 140 1736 460 1736 -fill #eef -dash {6 4}
.c create line 460 1704 460 1724 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 139 to 143 (Used 1 nobox 1)
# ProcLine[3] stays at 143 (Used 1 nobox 1)
.c create rectangle 386 1726 534 1746 -fill white -width 0
.c create text 460 1736 -text "observe?ORANGE,1"
.c create text 70 1760 -fill #eef -text "145"
.c create line 140 1760 460 1760 -fill #eef -dash {6 4}
.c create line 300 1728 300 1748 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 141 to 145 (Used 1 nobox 1)
# ProcLine[2] stays at 145 (Used 1 nobox 1)
.c create rectangle 226 1750 374 1770 -fill white -width 0
.c create text 300 1760 -text "observe!ORANGE,1"
.c create line 300 1770 380 1770 -fill darkred -tags mesg -width 2
.c create line 380 1770 460 1770 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1784 -fill #eef -text "147"
.c create line 140 1784 460 1784 -fill #eef -dash {6 4}
.c create line 460 1752 460 1772 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 143 to 147 (Used 1 nobox 1)
# ProcLine[3] stays at 147 (Used 1 nobox 1)
.c create rectangle 386 1774 534 1794 -fill white -width 0
.c create text 460 1784 -text "observe?ORANGE,1"
.c create text 70 1808 -fill #eef -text "149"
.c create line 140 1808 460 1808 -fill #eef -dash {6 4}
.c create line 300 1776 300 1796 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 145 to 149 (Used 1 nobox 1)
# ProcLine[2] stays at 149 (Used 1 nobox 1)
.c create rectangle 226 1798 374 1818 -fill white -width 0
.c create text 300 1808 -text "observe!ORANGE,1"
.c create line 300 1818 380 1818 -fill darkred -tags mesg -width 2
.c create line 380 1818 460 1818 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1832 -fill #eef -text "151"
.c create line 140 1832 460 1832 -fill #eef -dash {6 4}
.c create line 460 1800 460 1820 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 147 to 151 (Used 1 nobox 1)
# ProcLine[3] stays at 151 (Used 1 nobox 1)
.c create rectangle 386 1822 534 1842 -fill white -width 0
.c create text 460 1832 -text "observe?ORANGE,1"
.c create text 70 1856 -fill #eef -text "153"
.c create line 140 1856 460 1856 -fill #eef -dash {6 4}
.c create line 300 1824 300 1844 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 149 to 153 (Used 1 nobox 1)
# ProcLine[2] stays at 153 (Used 1 nobox 1)
.c create rectangle 226 1846 374 1866 -fill white -width 0
.c create text 300 1856 -text "observe!ORANGE,1"
.c create line 300 1866 380 1866 -fill darkred -tags mesg -width 2
.c create line 380 1866 460 1866 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1880 -fill #eef -text "155"
.c create line 140 1880 460 1880 -fill #eef -dash {6 4}
.c create line 460 1848 460 1868 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 151 to 155 (Used 1 nobox 1)
# ProcLine[3] stays at 155 (Used 1 nobox 1)
.c create rectangle 386 1870 534 1890 -fill white -width 0
.c create text 460 1880 -text "observe?ORANGE,1"
.c create text 70 1904 -fill #eef -text "157"
.c create line 140 1904 460 1904 -fill #eef -dash {6 4}
.c create line 300 1872 300 1892 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 153 to 157 (Used 1 nobox 1)
# ProcLine[2] stays at 157 (Used 1 nobox 1)
.c create rectangle 226 1894 374 1914 -fill white -width 0
.c create text 300 1904 -text "observe!ORANGE,1"
.c create line 300 1914 380 1914 -fill darkred -tags mesg -width 2
.c create line 380 1914 460 1914 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1928 -fill #eef -text "159"
.c create line 140 1928 460 1928 -fill #eef -dash {6 4}
.c create line 460 1896 460 1916 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 155 to 159 (Used 1 nobox 1)
# ProcLine[3] stays at 159 (Used 1 nobox 1)
.c create rectangle 386 1918 534 1938 -fill white -width 0
.c create text 460 1928 -text "observe?ORANGE,1"
.c create text 70 1952 -fill #eef -text "161"
.c create line 140 1952 460 1952 -fill #eef -dash {6 4}
.c create line 300 1920 300 1940 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 157 to 161 (Used 1 nobox 1)
# ProcLine[2] stays at 161 (Used 1 nobox 1)
.c create rectangle 226 1942 374 1962 -fill white -width 0
.c create text 300 1952 -text "observe!ORANGE,1"
.c create line 300 1962 380 1962 -fill darkred -tags mesg -width 2
.c create line 380 1962 460 1962 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1976 -fill #eef -text "163"
.c create line 140 1976 460 1976 -fill #eef -dash {6 4}
.c create line 460 1944 460 1964 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 159 to 163 (Used 1 nobox 1)
# ProcLine[3] stays at 163 (Used 1 nobox 1)
.c create rectangle 386 1966 534 1986 -fill white -width 0
.c create text 460 1976 -text "observe?ORANGE,1"
.c create text 70 2000 -fill #eef -text "165"
.c create line 140 2000 460 2000 -fill #eef -dash {6 4}
.c create line 300 1968 300 1988 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 161 to 165 (Used 1 nobox 1)
# ProcLine[2] stays at 165 (Used 1 nobox 1)
.c create rectangle 226 1990 374 2010 -fill white -width 0
.c create text 300 2000 -text "observe!ORANGE,1"
.c create line 300 2010 380 2010 -fill darkred -tags mesg -width 2
.c create line 380 2010 460 2010 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2024 -fill #eef -text "167"
.c create line 140 2024 460 2024 -fill #eef -dash {6 4}
.c create line 460 1992 460 2012 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 163 to 167 (Used 1 nobox 1)
# ProcLine[3] stays at 167 (Used 1 nobox 1)
.c create rectangle 386 2014 534 2034 -fill white -width 0
.c create text 460 2024 -text "observe?ORANGE,1"
.c create text 70 2048 -fill #eef -text "169"
.c create line 140 2048 460 2048 -fill #eef -dash {6 4}
.c create line 300 2016 300 2036 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 165 to 169 (Used 1 nobox 1)
# ProcLine[2] stays at 169 (Used 1 nobox 1)
.c create rectangle 226 2038 374 2058 -fill white -width 0
.c create text 300 2048 -text "observe!ORANGE,1"
.c create line 300 2058 380 2058 -fill darkred -tags mesg -width 2
.c create line 380 2058 460 2058 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2072 -fill #eef -text "171"
.c create line 140 2072 460 2072 -fill #eef -dash {6 4}
.c create line 460 2040 460 2060 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 167 to 171 (Used 1 nobox 1)
# ProcLine[3] stays at 171 (Used 1 nobox 1)
.c create rectangle 386 2062 534 2082 -fill white -width 0
.c create text 460 2072 -text "observe?ORANGE,1"
.c create text 70 2096 -fill #eef -text "173"
.c create line 140 2096 460 2096 -fill #eef -dash {6 4}
.c create line 300 2064 300 2084 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 169 to 173 (Used 1 nobox 1)
# ProcLine[2] stays at 173 (Used 1 nobox 1)
.c create rectangle 226 2086 374 2106 -fill white -width 0
.c create text 300 2096 -text "observe!ORANGE,1"
.c create line 300 2106 380 2106 -fill darkred -tags mesg -width 2
.c create line 380 2106 460 2106 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2120 -fill #eef -text "175"
.c create line 140 2120 460 2120 -fill #eef -dash {6 4}
.c create line 460 2088 460 2108 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 171 to 175 (Used 1 nobox 1)
# ProcLine[3] stays at 175 (Used 1 nobox 1)
.c create rectangle 386 2110 534 2130 -fill white -width 0
.c create text 460 2120 -text "observe?ORANGE,1"
.c create text 70 2144 -fill #eef -text "177"
.c create line 140 2144 460 2144 -fill #eef -dash {6 4}
.c create line 300 2112 300 2132 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 173 to 177 (Used 1 nobox 1)
# ProcLine[2] stays at 177 (Used 1 nobox 1)
.c create rectangle 226 2134 374 2154 -fill white -width 0
.c create text 300 2144 -text "observe!ORANGE,1"
.c create line 300 2154 380 2154 -fill darkred -tags mesg -width 2
.c create line 380 2154 460 2154 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2168 -fill #eef -text "179"
.c create line 140 2168 460 2168 -fill #eef -dash {6 4}
.c create line 460 2136 460 2156 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 175 to 179 (Used 1 nobox 1)
# ProcLine[3] stays at 179 (Used 1 nobox 1)
.c create rectangle 386 2158 534 2178 -fill white -width 0
.c create text 460 2168 -text "observe?ORANGE,1"
.c create text 70 2192 -fill #eef -text "181"
.c create line 140 2192 460 2192 -fill #eef -dash {6 4}
.c create line 300 2160 300 2180 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 177 to 181 (Used 1 nobox 1)
# ProcLine[2] stays at 181 (Used 1 nobox 1)
.c create rectangle 226 2182 374 2202 -fill white -width 0
.c create text 300 2192 -text "observe!ORANGE,1"
.c create line 300 2202 380 2202 -fill darkred -tags mesg -width 2
.c create line 380 2202 460 2202 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2216 -fill #eef -text "183"
.c create line 140 2216 460 2216 -fill #eef -dash {6 4}
.c create line 460 2184 460 2204 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 179 to 183 (Used 1 nobox 1)
# ProcLine[3] stays at 183 (Used 1 nobox 1)
.c create rectangle 386 2206 534 2226 -fill white -width 0
.c create text 460 2216 -text "observe?ORANGE,1"
.c create text 70 2240 -fill #eef -text "185"
.c create line 140 2240 460 2240 -fill #eef -dash {6 4}
.c create line 300 2208 300 2228 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 181 to 185 (Used 1 nobox 1)
# ProcLine[2] stays at 185 (Used 1 nobox 1)
.c create rectangle 226 2230 374 2250 -fill white -width 0
.c create text 300 2240 -text "observe!ORANGE,1"
.c create line 300 2250 380 2250 -fill darkred -tags mesg -width 2
.c create line 380 2250 460 2250 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2264 -fill #eef -text "187"
.c create line 140 2264 460 2264 -fill #eef -dash {6 4}
.c create line 460 2232 460 2252 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 183 to 187 (Used 1 nobox 1)
# ProcLine[3] stays at 187 (Used 1 nobox 1)
.c create rectangle 386 2254 534 2274 -fill white -width 0
.c create text 460 2264 -text "observe?ORANGE,1"
.c create text 70 2288 -fill #eef -text "189"
.c create line 140 2288 460 2288 -fill #eef -dash {6 4}
.c create line 300 2256 300 2276 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 185 to 189 (Used 1 nobox 1)
# ProcLine[2] stays at 189 (Used 1 nobox 1)
.c create rectangle 226 2278 374 2298 -fill white -width 0
.c create text 300 2288 -text "observe!ORANGE,1"
.c create line 300 2298 380 2298 -fill darkred -tags mesg -width 2
.c create line 380 2298 460 2298 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2312 -fill #eef -text "191"
.c create line 140 2312 460 2312 -fill #eef -dash {6 4}
.c create line 460 2280 460 2300 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 187 to 191 (Used 1 nobox 1)
# ProcLine[3] stays at 191 (Used 1 nobox 1)
.c create rectangle 386 2302 534 2322 -fill white -width 0
.c create text 460 2312 -text "observe?ORANGE,1"
.c create text 70 2336 -fill #eef -text "193"
.c create line 140 2336 460 2336 -fill #eef -dash {6 4}
.c create line 300 2304 300 2324 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 189 to 193 (Used 1 nobox 1)
# ProcLine[2] stays at 193 (Used 1 nobox 1)
.c create rectangle 226 2326 374 2346 -fill white -width 0
.c create text 300 2336 -text "observe!ORANGE,1"
.c create line 300 2346 380 2346 -fill darkred -tags mesg -width 2
.c create line 380 2346 460 2346 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2360 -fill #eef -text "195"
.c create line 140 2360 460 2360 -fill #eef -dash {6 4}
.c create line 460 2328 460 2348 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 191 to 195 (Used 1 nobox 1)
# ProcLine[3] stays at 195 (Used 1 nobox 1)
.c create rectangle 386 2350 534 2370 -fill white -width 0
.c create text 460 2360 -text "observe?ORANGE,1"
.c create text 70 2384 -fill #eef -text "197"
.c create line 140 2384 460 2384 -fill #eef -dash {6 4}
.c create line 300 2352 300 2372 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 193 to 197 (Used 1 nobox 1)
# ProcLine[2] stays at 197 (Used 1 nobox 1)
.c create rectangle 226 2374 374 2394 -fill white -width 0
.c create text 300 2384 -text "observe!ORANGE,1"
.c create line 300 2394 380 2394 -fill darkred -tags mesg -width 2
.c create line 380 2394 460 2394 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2408 -fill #eef -text "199"
.c create line 140 2408 460 2408 -fill #eef -dash {6 4}
.c create line 460 2376 460 2396 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 195 to 199 (Used 1 nobox 1)
# ProcLine[3] stays at 199 (Used 1 nobox 1)
.c create rectangle 386 2398 534 2418 -fill white -width 0
.c create text 460 2408 -text "observe?ORANGE,1"
.c create text 70 2432 -fill #eef -text "201"
.c create line 140 2432 460 2432 -fill #eef -dash {6 4}
.c create line 300 2400 300 2420 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 197 to 201 (Used 1 nobox 1)
# ProcLine[2] stays at 201 (Used 1 nobox 1)
.c create rectangle 226 2422 374 2442 -fill white -width 0
.c create text 300 2432 -text "observe!ORANGE,1"
.c create line 300 2442 380 2442 -fill darkred -tags mesg -width 2
.c create line 380 2442 460 2442 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2456 -fill #eef -text "203"
.c create line 140 2456 460 2456 -fill #eef -dash {6 4}
.c create line 460 2424 460 2444 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 199 to 203 (Used 1 nobox 1)
# ProcLine[3] stays at 203 (Used 1 nobox 1)
.c create rectangle 386 2446 534 2466 -fill white -width 0
.c create text 460 2456 -text "observe?ORANGE,1"
.c create text 70 2480 -fill #eef -text "205"
.c create line 140 2480 460 2480 -fill #eef -dash {6 4}
.c create line 300 2448 300 2468 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 201 to 205 (Used 1 nobox 1)
# ProcLine[2] stays at 205 (Used 1 nobox 1)
.c create rectangle 226 2470 374 2490 -fill white -width 0
.c create text 300 2480 -text "observe!ORANGE,1"
.c create line 300 2490 380 2490 -fill darkred -tags mesg -width 2
.c create line 380 2490 460 2490 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2504 -fill #eef -text "207"
.c create line 140 2504 460 2504 -fill #eef -dash {6 4}
.c create line 460 2472 460 2492 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 203 to 207 (Used 1 nobox 1)
# ProcLine[3] stays at 207 (Used 1 nobox 1)
.c create rectangle 386 2494 534 2514 -fill white -width 0
.c create text 460 2504 -text "observe?ORANGE,1"
.c create text 70 2528 -fill #eef -text "209"
.c create line 140 2528 460 2528 -fill #eef -dash {6 4}
.c create line 300 2496 300 2516 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 205 to 209 (Used 1 nobox 1)
# ProcLine[2] stays at 209 (Used 1 nobox 1)
.c create rectangle 226 2518 374 2538 -fill white -width 0
.c create text 300 2528 -text "observe!ORANGE,1"
.c create line 300 2538 380 2538 -fill darkred -tags mesg -width 2
.c create line 380 2538 460 2538 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2552 -fill #eef -text "211"
.c create line 140 2552 460 2552 -fill #eef -dash {6 4}
.c create line 460 2520 460 2540 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 207 to 211 (Used 1 nobox 1)
# ProcLine[3] stays at 211 (Used 1 nobox 1)
.c create rectangle 386 2542 534 2562 -fill white -width 0
.c create text 460 2552 -text "observe?ORANGE,1"
.c create text 70 2576 -fill #eef -text "213"
.c create line 140 2576 460 2576 -fill #eef -dash {6 4}
.c create line 300 2544 300 2564 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 209 to 213 (Used 1 nobox 1)
# ProcLine[2] stays at 213 (Used 1 nobox 1)
.c create rectangle 226 2566 374 2586 -fill white -width 0
.c create text 300 2576 -text "observe!ORANGE,1"
.c create line 300 2586 380 2586 -fill darkred -tags mesg -width 2
.c create line 380 2586 460 2586 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2600 -fill #eef -text "215"
.c create line 140 2600 460 2600 -fill #eef -dash {6 4}
.c create line 460 2568 460 2588 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 211 to 215 (Used 1 nobox 1)
# ProcLine[3] stays at 215 (Used 1 nobox 1)
.c create rectangle 386 2590 534 2610 -fill white -width 0
.c create text 460 2600 -text "observe?ORANGE,1"
.c create text 70 2624 -fill #eef -text "217"
.c create line 140 2624 460 2624 -fill #eef -dash {6 4}
.c create line 300 2592 300 2612 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 213 to 217 (Used 1 nobox 1)
# ProcLine[2] stays at 217 (Used 1 nobox 1)
.c create rectangle 226 2614 374 2634 -fill white -width 0
.c create text 300 2624 -text "observe!ORANGE,1"
.c create line 300 2634 380 2634 -fill darkred -tags mesg -width 2
.c create line 380 2634 460 2634 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2648 -fill #eef -text "219"
.c create line 140 2648 460 2648 -fill #eef -dash {6 4}
.c create line 460 2616 460 2636 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 215 to 219 (Used 1 nobox 1)
# ProcLine[3] stays at 219 (Used 1 nobox 1)
.c create rectangle 386 2638 534 2658 -fill white -width 0
.c create text 460 2648 -text "observe?ORANGE,1"
.c create text 70 2672 -fill #eef -text "221"
.c create line 140 2672 460 2672 -fill #eef -dash {6 4}
.c create line 300 2640 300 2660 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 217 to 221 (Used 1 nobox 1)
# ProcLine[2] stays at 221 (Used 1 nobox 1)
.c create rectangle 226 2662 374 2682 -fill white -width 0
.c create text 300 2672 -text "observe!ORANGE,1"
.c create line 300 2682 380 2682 -fill darkred -tags mesg -width 2
.c create line 380 2682 460 2682 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2696 -fill #eef -text "223"
.c create line 140 2696 460 2696 -fill #eef -dash {6 4}
.c create line 460 2664 460 2684 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 219 to 223 (Used 1 nobox 1)
# ProcLine[3] stays at 223 (Used 1 nobox 1)
.c create rectangle 386 2686 534 2706 -fill white -width 0
.c create text 460 2696 -text "observe?ORANGE,1"
.c create text 70 2720 -fill #eef -text "225"
.c create line 140 2720 460 2720 -fill #eef -dash {6 4}
.c create line 300 2688 300 2708 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 221 to 225 (Used 1 nobox 1)
# ProcLine[2] stays at 225 (Used 1 nobox 1)
.c create rectangle 226 2710 374 2730 -fill white -width 0
.c create text 300 2720 -text "observe!ORANGE,1"
.c create line 300 2730 380 2730 -fill darkred -tags mesg -width 2
.c create line 380 2730 460 2730 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2744 -fill #eef -text "227"
.c create line 140 2744 460 2744 -fill #eef -dash {6 4}
.c create line 460 2712 460 2732 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 223 to 227 (Used 1 nobox 1)
# ProcLine[3] stays at 227 (Used 1 nobox 1)
.c create rectangle 386 2734 534 2754 -fill white -width 0
.c create text 460 2744 -text "observe?ORANGE,1"
.c create text 70 2768 -fill #eef -text "229"
.c create line 140 2768 460 2768 -fill #eef -dash {6 4}
.c create line 300 2736 300 2756 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 225 to 229 (Used 1 nobox 1)
# ProcLine[2] stays at 229 (Used 1 nobox 1)
.c create rectangle 226 2758 374 2778 -fill white -width 0
.c create text 300 2768 -text "observe!ORANGE,1"
.c create line 300 2778 380 2778 -fill darkred -tags mesg -width 2
.c create line 380 2778 460 2778 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2792 -fill #eef -text "231"
.c create line 140 2792 460 2792 -fill #eef -dash {6 4}
.c create line 460 2760 460 2780 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 227 to 231 (Used 1 nobox 1)
# ProcLine[3] stays at 231 (Used 1 nobox 1)
.c create rectangle 386 2782 534 2802 -fill white -width 0
.c create text 460 2792 -text "observe?ORANGE,1"
.c create text 70 2816 -fill #eef -text "233"
.c create line 140 2816 460 2816 -fill #eef -dash {6 4}
.c create line 300 2784 300 2804 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 229 to 233 (Used 1 nobox 1)
# ProcLine[2] stays at 233 (Used 1 nobox 1)
.c create rectangle 226 2806 374 2826 -fill white -width 0
.c create text 300 2816 -text "observe!ORANGE,1"
.c create line 300 2826 380 2826 -fill darkred -tags mesg -width 2
.c create line 380 2826 460 2826 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2840 -fill #eef -text "235"
.c create line 140 2840 460 2840 -fill #eef -dash {6 4}
.c create line 460 2808 460 2828 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 231 to 235 (Used 1 nobox 1)
# ProcLine[3] stays at 235 (Used 1 nobox 1)
.c create rectangle 386 2830 534 2850 -fill white -width 0
.c create text 460 2840 -text "observe?ORANGE,1"
.c create text 70 2864 -fill #eef -text "237"
.c create line 140 2864 460 2864 -fill #eef -dash {6 4}
.c create line 300 2832 300 2852 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 233 to 237 (Used 1 nobox 1)
# ProcLine[2] stays at 237 (Used 1 nobox 1)
.c create rectangle 226 2854 374 2874 -fill white -width 0
.c create text 300 2864 -text "observe!ORANGE,1"
.c create line 300 2874 380 2874 -fill darkred -tags mesg -width 2
.c create line 380 2874 460 2874 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2888 -fill #eef -text "239"
.c create line 140 2888 460 2888 -fill #eef -dash {6 4}
.c create line 460 2856 460 2876 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 235 to 239 (Used 1 nobox 1)
# ProcLine[3] stays at 239 (Used 1 nobox 1)
.c create rectangle 386 2878 534 2898 -fill white -width 0
.c create text 460 2888 -text "observe?ORANGE,1"
.c create text 70 2912 -fill #eef -text "241"
.c create line 140 2912 460 2912 -fill #eef -dash {6 4}
.c create line 300 2880 300 2900 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 237 to 241 (Used 1 nobox 1)
# ProcLine[2] stays at 241 (Used 1 nobox 1)
.c create rectangle 226 2902 374 2922 -fill white -width 0
.c create text 300 2912 -text "observe!ORANGE,1"
.c create line 300 2922 380 2922 -fill darkred -tags mesg -width 2
.c create line 380 2922 460 2922 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2936 -fill #eef -text "243"
.c create line 140 2936 460 2936 -fill #eef -dash {6 4}
.c create line 460 2904 460 2924 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 239 to 243 (Used 1 nobox 1)
# ProcLine[3] stays at 243 (Used 1 nobox 1)
.c create rectangle 386 2926 534 2946 -fill white -width 0
.c create text 460 2936 -text "observe?ORANGE,1"
.c create text 70 2960 -fill #eef -text "245"
.c create line 140 2960 460 2960 -fill #eef -dash {6 4}
.c create line 300 2928 300 2948 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 241 to 245 (Used 1 nobox 1)
# ProcLine[2] stays at 245 (Used 1 nobox 1)
.c create rectangle 226 2950 374 2970 -fill white -width 0
.c create text 300 2960 -text "observe!ORANGE,1"
.c create line 300 2970 380 2970 -fill darkred -tags mesg -width 2
.c create line 380 2970 460 2970 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2984 -fill #eef -text "247"
.c create line 140 2984 460 2984 -fill #eef -dash {6 4}
.c create line 460 2952 460 2972 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 243 to 247 (Used 1 nobox 1)
# ProcLine[3] stays at 247 (Used 1 nobox 1)
.c create rectangle 386 2974 534 2994 -fill white -width 0
.c create text 460 2984 -text "observe?ORANGE,1"
.c create text 70 3008 -fill #eef -text "249"
.c create line 140 3008 460 3008 -fill #eef -dash {6 4}
.c create line 300 2976 300 2996 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 245 to 249 (Used 1 nobox 1)
# ProcLine[2] stays at 249 (Used 1 nobox 1)
.c create rectangle 226 2998 374 3018 -fill white -width 0
.c create text 300 3008 -text "observe!ORANGE,1"
.c create line 300 3018 380 3018 -fill darkred -tags mesg -width 2
.c create line 380 3018 460 3018 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3032 -fill #eef -text "251"
.c create line 140 3032 460 3032 -fill #eef -dash {6 4}
.c create line 460 3000 460 3020 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 247 to 251 (Used 1 nobox 1)
# ProcLine[3] stays at 251 (Used 1 nobox 1)
.c create rectangle 386 3022 534 3042 -fill white -width 0
.c create text 460 3032 -text "observe?ORANGE,1"
.c create text 70 3056 -fill #eef -text "253"
.c create line 140 3056 460 3056 -fill #eef -dash {6 4}
.c create line 300 3024 300 3044 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 249 to 253 (Used 1 nobox 1)
# ProcLine[2] stays at 253 (Used 1 nobox 1)
.c create rectangle 226 3046 374 3066 -fill white -width 0
.c create text 300 3056 -text "observe!ORANGE,1"
.c create line 300 3066 380 3066 -fill darkred -tags mesg -width 2
.c create line 380 3066 460 3066 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3080 -fill #eef -text "255"
.c create line 140 3080 460 3080 -fill #eef -dash {6 4}
.c create line 460 3048 460 3068 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 251 to 255 (Used 1 nobox 1)
# ProcLine[3] stays at 255 (Used 1 nobox 1)
.c create rectangle 386 3070 534 3090 -fill white -width 0
.c create text 460 3080 -text "observe?ORANGE,1"
.c create text 70 3104 -fill #eef -text "257"
.c create line 140 3104 460 3104 -fill #eef -dash {6 4}
.c create line 300 3072 300 3092 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 253 to 257 (Used 1 nobox 1)
# ProcLine[2] stays at 257 (Used 1 nobox 1)
.c create rectangle 226 3094 374 3114 -fill white -width 0
.c create text 300 3104 -text "observe!ORANGE,1"
.c create line 300 3114 380 3114 -fill darkred -tags mesg -width 2
.c create line 380 3114 460 3114 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3128 -fill #eef -text "259"
.c create line 140 3128 460 3128 -fill #eef -dash {6 4}
.c create line 460 3096 460 3116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 255 to 259 (Used 1 nobox 1)
# ProcLine[3] stays at 259 (Used 1 nobox 1)
.c create rectangle 386 3118 534 3138 -fill white -width 0
.c create text 460 3128 -text "observe?ORANGE,1"
.c create text 70 3152 -fill #eef -text "261"
.c create line 140 3152 460 3152 -fill #eef -dash {6 4}
.c create line 300 3120 300 3140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 257 to 261 (Used 1 nobox 1)
# ProcLine[2] stays at 261 (Used 1 nobox 1)
.c create rectangle 226 3142 374 3162 -fill white -width 0
.c create text 300 3152 -text "observe!ORANGE,1"
.c create line 300 3162 380 3162 -fill darkred -tags mesg -width 2
.c create line 380 3162 460 3162 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3176 -fill #eef -text "263"
.c create line 140 3176 460 3176 -fill #eef -dash {6 4}
.c create line 460 3144 460 3164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 259 to 263 (Used 1 nobox 1)
# ProcLine[3] stays at 263 (Used 1 nobox 1)
.c create rectangle 386 3166 534 3186 -fill white -width 0
.c create text 460 3176 -text "observe?ORANGE,1"
.c create text 70 3200 -fill #eef -text "265"
.c create line 140 3200 460 3200 -fill #eef -dash {6 4}
.c create line 300 3168 300 3188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 261 to 265 (Used 1 nobox 1)
# ProcLine[2] stays at 265 (Used 1 nobox 1)
.c create rectangle 226 3190 374 3210 -fill white -width 0
.c create text 300 3200 -text "observe!ORANGE,1"
.c create line 300 3210 380 3210 -fill darkred -tags mesg -width 2
.c create line 380 3210 460 3210 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3224 -fill #eef -text "267"
.c create line 140 3224 460 3224 -fill #eef -dash {6 4}
.c create line 460 3192 460 3212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 263 to 267 (Used 1 nobox 1)
# ProcLine[3] stays at 267 (Used 1 nobox 1)
.c create rectangle 386 3214 534 3234 -fill white -width 0
.c create text 460 3224 -text "observe?ORANGE,1"
.c create text 70 3248 -fill #eef -text "269"
.c create line 140 3248 460 3248 -fill #eef -dash {6 4}
.c create line 300 3216 300 3236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 265 to 269 (Used 1 nobox 1)
# ProcLine[2] stays at 269 (Used 1 nobox 1)
.c create rectangle 226 3238 374 3258 -fill white -width 0
.c create text 300 3248 -text "observe!ORANGE,1"
.c create line 300 3258 380 3258 -fill darkred -tags mesg -width 2
.c create line 380 3258 460 3258 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3272 -fill #eef -text "271"
.c create line 140 3272 460 3272 -fill #eef -dash {6 4}
.c create line 460 3240 460 3260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 267 to 271 (Used 1 nobox 1)
# ProcLine[3] stays at 271 (Used 1 nobox 1)
.c create rectangle 386 3262 534 3282 -fill white -width 0
.c create text 460 3272 -text "observe?ORANGE,1"
.c create text 70 3296 -fill #eef -text "273"
.c create line 140 3296 460 3296 -fill #eef -dash {6 4}
.c create line 300 3264 300 3284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 269 to 273 (Used 1 nobox 1)
# ProcLine[2] stays at 273 (Used 1 nobox 1)
.c create rectangle 226 3286 374 3306 -fill white -width 0
.c create text 300 3296 -text "observe!ORANGE,1"
.c create line 300 3306 380 3306 -fill darkred -tags mesg -width 2
.c create line 380 3306 460 3306 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3320 -fill #eef -text "275"
.c create line 140 3320 460 3320 -fill #eef -dash {6 4}
.c create line 460 3288 460 3308 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 271 to 275 (Used 1 nobox 1)
# ProcLine[3] stays at 275 (Used 1 nobox 1)
.c create rectangle 386 3310 534 3330 -fill white -width 0
.c create text 460 3320 -text "observe?ORANGE,1"
.c create text 70 3344 -fill #eef -text "277"
.c create line 140 3344 460 3344 -fill #eef -dash {6 4}
.c create line 300 3312 300 3332 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 273 to 277 (Used 1 nobox 1)
# ProcLine[2] stays at 277 (Used 1 nobox 1)
.c create rectangle 226 3334 374 3354 -fill white -width 0
.c create text 300 3344 -text "observe!ORANGE,1"
.c create line 300 3354 380 3354 -fill darkred -tags mesg -width 2
.c create line 380 3354 460 3354 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3368 -fill #eef -text "279"
.c create line 140 3368 460 3368 -fill #eef -dash {6 4}
.c create line 460 3336 460 3356 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 275 to 279 (Used 1 nobox 1)
# ProcLine[3] stays at 279 (Used 1 nobox 1)
.c create rectangle 386 3358 534 3378 -fill white -width 0
.c create text 460 3368 -text "observe?ORANGE,1"
.c create text 70 3392 -fill #eef -text "281"
.c create line 140 3392 460 3392 -fill #eef -dash {6 4}
.c create line 300 3360 300 3380 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 277 to 281 (Used 1 nobox 1)
# ProcLine[2] stays at 281 (Used 1 nobox 1)
.c create rectangle 226 3382 374 3402 -fill white -width 0
.c create text 300 3392 -text "observe!ORANGE,1"
.c create line 300 3402 380 3402 -fill darkred -tags mesg -width 2
.c create line 380 3402 460 3402 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3416 -fill #eef -text "283"
.c create line 140 3416 460 3416 -fill #eef -dash {6 4}
.c create line 460 3384 460 3404 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 279 to 283 (Used 1 nobox 1)
# ProcLine[3] stays at 283 (Used 1 nobox 1)
.c create rectangle 386 3406 534 3426 -fill white -width 0
.c create text 460 3416 -text "observe?ORANGE,1"
.c create text 70 3440 -fill #eef -text "285"
.c create line 140 3440 460 3440 -fill #eef -dash {6 4}
.c create line 300 3408 300 3428 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 281 to 285 (Used 1 nobox 1)
# ProcLine[2] stays at 285 (Used 1 nobox 1)
.c create rectangle 226 3430 374 3450 -fill white -width 0
.c create text 300 3440 -text "observe!ORANGE,1"
.c create line 300 3450 380 3450 -fill darkred -tags mesg -width 2
.c create line 380 3450 460 3450 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3464 -fill #eef -text "287"
.c create line 140 3464 460 3464 -fill #eef -dash {6 4}
.c create line 460 3432 460 3452 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 283 to 287 (Used 1 nobox 1)
# ProcLine[3] stays at 287 (Used 1 nobox 1)
.c create rectangle 386 3454 534 3474 -fill white -width 0
.c create text 460 3464 -text "observe?ORANGE,1"
.c create text 70 3488 -fill #eef -text "289"
.c create line 140 3488 460 3488 -fill #eef -dash {6 4}
.c create line 300 3456 300 3476 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 285 to 289 (Used 1 nobox 1)
# ProcLine[2] stays at 289 (Used 1 nobox 1)
.c create rectangle 226 3478 374 3498 -fill white -width 0
.c create text 300 3488 -text "observe!ORANGE,1"
.c create line 300 3498 380 3498 -fill darkred -tags mesg -width 2
.c create line 380 3498 460 3498 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3512 -fill #eef -text "291"
.c create line 140 3512 460 3512 -fill #eef -dash {6 4}
.c create line 460 3480 460 3500 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 287 to 291 (Used 1 nobox 1)
# ProcLine[3] stays at 291 (Used 1 nobox 1)
.c create rectangle 386 3502 534 3522 -fill white -width 0
.c create text 460 3512 -text "observe?ORANGE,1"
.c create text 70 3536 -fill #eef -text "293"
.c create line 140 3536 460 3536 -fill #eef -dash {6 4}
.c create line 300 3504 300 3524 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 289 to 293 (Used 1 nobox 1)
# ProcLine[2] stays at 293 (Used 1 nobox 1)
.c create rectangle 226 3526 374 3546 -fill white -width 0
.c create text 300 3536 -text "observe!ORANGE,1"
.c create line 300 3546 380 3546 -fill darkred -tags mesg -width 2
.c create line 380 3546 460 3546 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3560 -fill #eef -text "295"
.c create line 140 3560 460 3560 -fill #eef -dash {6 4}
.c create line 460 3528 460 3548 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 291 to 295 (Used 1 nobox 1)
# ProcLine[3] stays at 295 (Used 1 nobox 1)
.c create rectangle 386 3550 534 3570 -fill white -width 0
.c create text 460 3560 -text "observe?ORANGE,1"
.c create text 70 3584 -fill #eef -text "297"
.c create line 140 3584 460 3584 -fill #eef -dash {6 4}
.c create line 300 3552 300 3572 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 293 to 297 (Used 1 nobox 1)
# ProcLine[2] stays at 297 (Used 1 nobox 1)
.c create rectangle 226 3574 374 3594 -fill white -width 0
.c create text 300 3584 -text "observe!ORANGE,1"
.c create line 300 3594 380 3594 -fill darkred -tags mesg -width 2
.c create line 380 3594 460 3594 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3608 -fill #eef -text "299"
.c create line 140 3608 460 3608 -fill #eef -dash {6 4}
.c create line 460 3576 460 3596 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 295 to 299 (Used 1 nobox 1)
# ProcLine[3] stays at 299 (Used 1 nobox 1)
.c create rectangle 386 3598 534 3618 -fill white -width 0
.c create text 460 3608 -text "observe?ORANGE,1"
.c create text 70 3632 -fill #eef -text "301"
.c create line 140 3632 460 3632 -fill #eef -dash {6 4}
.c create line 300 3600 300 3620 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 297 to 301 (Used 1 nobox 1)
# ProcLine[2] stays at 301 (Used 1 nobox 1)
.c create rectangle 226 3622 374 3642 -fill white -width 0
.c create text 300 3632 -text "observe!ORANGE,1"
.c create line 300 3642 380 3642 -fill darkred -tags mesg -width 2
.c create line 380 3642 460 3642 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3656 -fill #eef -text "303"
.c create line 140 3656 460 3656 -fill #eef -dash {6 4}
.c create line 460 3624 460 3644 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 299 to 303 (Used 1 nobox 1)
# ProcLine[3] stays at 303 (Used 1 nobox 1)
.c create rectangle 386 3646 534 3666 -fill white -width 0
.c create text 460 3656 -text "observe?ORANGE,1"
.c create text 70 3680 -fill #eef -text "305"
.c create line 140 3680 460 3680 -fill #eef -dash {6 4}
.c create line 300 3648 300 3668 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 301 to 305 (Used 1 nobox 1)
# ProcLine[2] stays at 305 (Used 1 nobox 1)
.c create rectangle 226 3670 374 3690 -fill white -width 0
.c create text 300 3680 -text "observe!ORANGE,1"
.c create line 300 3690 380 3690 -fill darkred -tags mesg -width 2
.c create line 380 3690 460 3690 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3704 -fill #eef -text "307"
.c create line 140 3704 460 3704 -fill #eef -dash {6 4}
.c create line 460 3672 460 3692 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 303 to 307 (Used 1 nobox 1)
# ProcLine[3] stays at 307 (Used 1 nobox 1)
.c create rectangle 386 3694 534 3714 -fill white -width 0
.c create text 460 3704 -text "observe?ORANGE,1"
.c create text 70 3728 -fill #eef -text "309"
.c create line 140 3728 460 3728 -fill #eef -dash {6 4}
.c create line 300 3696 300 3716 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 305 to 309 (Used 1 nobox 1)
# ProcLine[2] stays at 309 (Used 1 nobox 1)
.c create rectangle 226 3718 374 3738 -fill white -width 0
.c create text 300 3728 -text "observe!ORANGE,1"
.c create line 300 3738 380 3738 -fill darkred -tags mesg -width 2
.c create line 380 3738 460 3738 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3752 -fill #eef -text "311"
.c create line 140 3752 460 3752 -fill #eef -dash {6 4}
.c create line 460 3720 460 3740 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 307 to 311 (Used 1 nobox 1)
# ProcLine[3] stays at 311 (Used 1 nobox 1)
.c create rectangle 386 3742 534 3762 -fill white -width 0
.c create text 460 3752 -text "observe?ORANGE,1"
.c create text 70 3776 -fill #eef -text "313"
.c create line 140 3776 460 3776 -fill #eef -dash {6 4}
.c create line 300 3744 300 3764 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 309 to 313 (Used 1 nobox 1)
# ProcLine[2] stays at 313 (Used 1 nobox 1)
.c create rectangle 226 3766 374 3786 -fill white -width 0
.c create text 300 3776 -text "observe!ORANGE,1"
.c create line 300 3786 380 3786 -fill darkred -tags mesg -width 2
.c create line 380 3786 460 3786 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3800 -fill #eef -text "315"
.c create line 140 3800 460 3800 -fill #eef -dash {6 4}
.c create line 460 3768 460 3788 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 311 to 315 (Used 1 nobox 1)
# ProcLine[3] stays at 315 (Used 1 nobox 1)
.c create rectangle 386 3790 534 3810 -fill white -width 0
.c create text 460 3800 -text "observe?ORANGE,1"
.c create text 70 3824 -fill #eef -text "317"
.c create line 140 3824 460 3824 -fill #eef -dash {6 4}
.c create line 300 3792 300 3812 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 313 to 317 (Used 1 nobox 1)
# ProcLine[2] stays at 317 (Used 1 nobox 1)
.c create rectangle 226 3814 374 3834 -fill white -width 0
.c create text 300 3824 -text "observe!ORANGE,1"
.c create line 300 3834 380 3834 -fill darkred -tags mesg -width 2
.c create line 380 3834 460 3834 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3848 -fill #eef -text "319"
.c create line 140 3848 460 3848 -fill #eef -dash {6 4}
.c create line 460 3816 460 3836 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 315 to 319 (Used 1 nobox 1)
# ProcLine[3] stays at 319 (Used 1 nobox 1)
.c create rectangle 386 3838 534 3858 -fill white -width 0
.c create text 460 3848 -text "observe?ORANGE,1"
.c create text 70 3872 -fill #eef -text "321"
.c create line 140 3872 460 3872 -fill #eef -dash {6 4}
.c create line 300 3840 300 3860 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 317 to 321 (Used 1 nobox 1)
# ProcLine[2] stays at 321 (Used 1 nobox 1)
.c create rectangle 226 3862 374 3882 -fill white -width 0
.c create text 300 3872 -text "observe!ORANGE,1"
.c create line 300 3882 380 3882 -fill darkred -tags mesg -width 2
.c create line 380 3882 460 3882 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3896 -fill #eef -text "323"
.c create line 140 3896 460 3896 -fill #eef -dash {6 4}
.c create line 460 3864 460 3884 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 319 to 323 (Used 1 nobox 1)
# ProcLine[3] stays at 323 (Used 1 nobox 1)
.c create rectangle 386 3886 534 3906 -fill white -width 0
.c create text 460 3896 -text "observe?ORANGE,1"
.c create text 70 3920 -fill #eef -text "325"
.c create line 140 3920 460 3920 -fill #eef -dash {6 4}
.c create line 300 3888 300 3908 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 321 to 325 (Used 1 nobox 1)
# ProcLine[2] stays at 325 (Used 1 nobox 1)
.c create rectangle 226 3910 374 3930 -fill white -width 0
.c create text 300 3920 -text "observe!ORANGE,1"
.c create line 300 3930 380 3930 -fill darkred -tags mesg -width 2
.c create line 380 3930 460 3930 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3944 -fill #eef -text "327"
.c create line 140 3944 460 3944 -fill #eef -dash {6 4}
.c create line 460 3912 460 3932 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 323 to 327 (Used 1 nobox 1)
# ProcLine[3] stays at 327 (Used 1 nobox 1)
.c create rectangle 386 3934 534 3954 -fill white -width 0
.c create text 460 3944 -text "observe?ORANGE,1"
.c create text 70 3968 -fill #eef -text "329"
.c create line 140 3968 460 3968 -fill #eef -dash {6 4}
.c create line 300 3936 300 3956 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 325 to 329 (Used 1 nobox 1)
# ProcLine[2] stays at 329 (Used 1 nobox 1)
.c create rectangle 226 3958 374 3978 -fill white -width 0
.c create text 300 3968 -text "observe!ORANGE,1"
.c create line 300 3978 380 3978 -fill darkred -tags mesg -width 2
.c create line 380 3978 460 3978 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3992 -fill #eef -text "331"
.c create line 140 3992 460 3992 -fill #eef -dash {6 4}
.c create line 460 3960 460 3980 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 327 to 331 (Used 1 nobox 1)
# ProcLine[3] stays at 331 (Used 1 nobox 1)
.c create rectangle 386 3982 534 4002 -fill white -width 0
.c create text 460 3992 -text "observe?ORANGE,1"
.c create text 70 4016 -fill #eef -text "333"
.c create line 140 4016 460 4016 -fill #eef -dash {6 4}
.c create line 300 3984 300 4004 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 329 to 333 (Used 1 nobox 1)
# ProcLine[2] stays at 333 (Used 1 nobox 1)
.c create rectangle 226 4006 374 4026 -fill white -width 0
.c create text 300 4016 -text "observe!ORANGE,1"
.c create line 300 4026 380 4026 -fill darkred -tags mesg -width 2
.c create line 380 4026 460 4026 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4040 -fill #eef -text "335"
.c create line 140 4040 460 4040 -fill #eef -dash {6 4}
.c create line 460 4008 460 4028 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 331 to 335 (Used 1 nobox 1)
# ProcLine[3] stays at 335 (Used 1 nobox 1)
.c create rectangle 386 4030 534 4050 -fill white -width 0
.c create text 460 4040 -text "observe?ORANGE,1"
.c create text 70 4064 -fill #eef -text "337"
.c create line 140 4064 460 4064 -fill #eef -dash {6 4}
.c create line 300 4032 300 4052 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 333 to 337 (Used 1 nobox 1)
# ProcLine[2] stays at 337 (Used 1 nobox 1)
.c create rectangle 226 4054 374 4074 -fill white -width 0
.c create text 300 4064 -text "observe!ORANGE,1"
.c create line 300 4074 380 4074 -fill darkred -tags mesg -width 2
.c create line 380 4074 460 4074 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4088 -fill #eef -text "339"
.c create line 140 4088 460 4088 -fill #eef -dash {6 4}
.c create line 460 4056 460 4076 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 335 to 339 (Used 1 nobox 1)
# ProcLine[3] stays at 339 (Used 1 nobox 1)
.c create rectangle 386 4078 534 4098 -fill white -width 0
.c create text 460 4088 -text "observe?ORANGE,1"
.c create text 70 4112 -fill #eef -text "341"
.c create line 140 4112 460 4112 -fill #eef -dash {6 4}
.c create line 300 4080 300 4100 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 337 to 341 (Used 1 nobox 1)
# ProcLine[2] stays at 341 (Used 1 nobox 1)
.c create rectangle 226 4102 374 4122 -fill white -width 0
.c create text 300 4112 -text "observe!ORANGE,1"
.c create line 300 4122 380 4122 -fill darkred -tags mesg -width 2
.c create line 380 4122 460 4122 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4136 -fill #eef -text "343"
.c create line 140 4136 460 4136 -fill #eef -dash {6 4}
.c create line 460 4104 460 4124 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 339 to 343 (Used 1 nobox 1)
# ProcLine[3] stays at 343 (Used 1 nobox 1)
.c create rectangle 386 4126 534 4146 -fill white -width 0
.c create text 460 4136 -text "observe?ORANGE,1"
.c create text 70 4160 -fill #eef -text "345"
.c create line 140 4160 460 4160 -fill #eef -dash {6 4}
.c create line 300 4128 300 4148 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 341 to 345 (Used 1 nobox 1)
# ProcLine[2] stays at 345 (Used 1 nobox 1)
.c create rectangle 226 4150 374 4170 -fill white -width 0
.c create text 300 4160 -text "observe!ORANGE,1"
.c create line 300 4170 380 4170 -fill darkred -tags mesg -width 2
.c create line 380 4170 460 4170 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4184 -fill #eef -text "347"
.c create line 140 4184 460 4184 -fill #eef -dash {6 4}
.c create line 460 4152 460 4172 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 343 to 347 (Used 1 nobox 1)
# ProcLine[3] stays at 347 (Used 1 nobox 1)
.c create rectangle 386 4174 534 4194 -fill white -width 0
.c create text 460 4184 -text "observe?ORANGE,1"
.c create text 70 4208 -fill #eef -text "349"
.c create line 140 4208 460 4208 -fill #eef -dash {6 4}
.c create line 300 4176 300 4196 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 345 to 349 (Used 1 nobox 1)
# ProcLine[2] stays at 349 (Used 1 nobox 1)
.c create rectangle 226 4198 374 4218 -fill white -width 0
.c create text 300 4208 -text "observe!ORANGE,1"
.c create line 300 4218 380 4218 -fill darkred -tags mesg -width 2
.c create line 380 4218 460 4218 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4232 -fill #eef -text "351"
.c create line 140 4232 460 4232 -fill #eef -dash {6 4}
.c create line 460 4200 460 4220 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 347 to 351 (Used 1 nobox 1)
# ProcLine[3] stays at 351 (Used 1 nobox 1)
.c create rectangle 386 4222 534 4242 -fill white -width 0
.c create text 460 4232 -text "observe?ORANGE,1"
.c create text 70 4256 -fill #eef -text "353"
.c create line 140 4256 460 4256 -fill #eef -dash {6 4}
.c create line 300 4224 300 4244 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 349 to 353 (Used 1 nobox 1)
# ProcLine[2] stays at 353 (Used 1 nobox 1)
.c create rectangle 226 4246 374 4266 -fill white -width 0
.c create text 300 4256 -text "observe!ORANGE,1"
.c create line 300 4266 380 4266 -fill darkred -tags mesg -width 2
.c create line 380 4266 460 4266 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4280 -fill #eef -text "355"
.c create line 140 4280 460 4280 -fill #eef -dash {6 4}
.c create line 460 4248 460 4268 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 351 to 355 (Used 1 nobox 1)
# ProcLine[3] stays at 355 (Used 1 nobox 1)
.c create rectangle 386 4270 534 4290 -fill white -width 0
.c create text 460 4280 -text "observe?ORANGE,1"
.c create text 70 4304 -fill #eef -text "357"
.c create line 140 4304 460 4304 -fill #eef -dash {6 4}
.c create line 300 4272 300 4292 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 353 to 357 (Used 1 nobox 1)
# ProcLine[2] stays at 357 (Used 1 nobox 1)
.c create rectangle 226 4294 374 4314 -fill white -width 0
.c create text 300 4304 -text "observe!ORANGE,1"
.c create line 300 4314 380 4314 -fill darkred -tags mesg -width 2
.c create line 380 4314 460 4314 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4328 -fill #eef -text "359"
.c create line 140 4328 460 4328 -fill #eef -dash {6 4}
.c create line 460 4296 460 4316 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 355 to 359 (Used 1 nobox 1)
# ProcLine[3] stays at 359 (Used 1 nobox 1)
.c create rectangle 386 4318 534 4338 -fill white -width 0
.c create text 460 4328 -text "observe?ORANGE,1"
.c create text 70 4352 -fill #eef -text "361"
.c create line 140 4352 460 4352 -fill #eef -dash {6 4}
.c create line 300 4320 300 4340 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 357 to 361 (Used 1 nobox 1)
# ProcLine[2] stays at 361 (Used 1 nobox 1)
.c create rectangle 226 4342 374 4362 -fill white -width 0
.c create text 300 4352 -text "observe!ORANGE,1"
.c create line 300 4362 380 4362 -fill darkred -tags mesg -width 2
.c create line 380 4362 460 4362 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4376 -fill #eef -text "363"
.c create line 140 4376 460 4376 -fill #eef -dash {6 4}
.c create line 460 4344 460 4364 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 359 to 363 (Used 1 nobox 1)
# ProcLine[3] stays at 363 (Used 1 nobox 1)
.c create rectangle 386 4366 534 4386 -fill white -width 0
.c create text 460 4376 -text "observe?ORANGE,1"
.c create text 70 4400 -fill #eef -text "365"
.c create line 140 4400 460 4400 -fill #eef -dash {6 4}
.c create line 300 4368 300 4388 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 361 to 365 (Used 1 nobox 1)
# ProcLine[2] stays at 365 (Used 1 nobox 1)
.c create rectangle 226 4390 374 4410 -fill white -width 0
.c create text 300 4400 -text "observe!ORANGE,1"
.c create line 300 4410 380 4410 -fill darkred -tags mesg -width 2
.c create line 380 4410 460 4410 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4424 -fill #eef -text "367"
.c create line 140 4424 460 4424 -fill #eef -dash {6 4}
.c create line 460 4392 460 4412 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 363 to 367 (Used 1 nobox 1)
# ProcLine[3] stays at 367 (Used 1 nobox 1)
.c create rectangle 386 4414 534 4434 -fill white -width 0
.c create text 460 4424 -text "observe?ORANGE,1"
.c create text 70 4448 -fill #eef -text "369"
.c create line 140 4448 460 4448 -fill #eef -dash {6 4}
.c create line 300 4416 300 4436 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 365 to 369 (Used 1 nobox 1)
# ProcLine[2] stays at 369 (Used 1 nobox 1)
.c create rectangle 226 4438 374 4458 -fill white -width 0
.c create text 300 4448 -text "observe!ORANGE,1"
.c create line 300 4458 380 4458 -fill darkred -tags mesg -width 2
.c create line 380 4458 460 4458 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4472 -fill #eef -text "371"
.c create line 140 4472 460 4472 -fill #eef -dash {6 4}
.c create line 460 4440 460 4460 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 367 to 371 (Used 1 nobox 1)
# ProcLine[3] stays at 371 (Used 1 nobox 1)
.c create rectangle 386 4462 534 4482 -fill white -width 0
.c create text 460 4472 -text "observe?ORANGE,1"
.c create text 70 4496 -fill #eef -text "373"
.c create line 140 4496 460 4496 -fill #eef -dash {6 4}
.c create line 300 4464 300 4484 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 369 to 373 (Used 1 nobox 1)
# ProcLine[2] stays at 373 (Used 1 nobox 1)
.c create rectangle 226 4486 374 4506 -fill white -width 0
.c create text 300 4496 -text "observe!ORANGE,1"
.c create line 300 4506 380 4506 -fill darkred -tags mesg -width 2
.c create line 380 4506 460 4506 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4520 -fill #eef -text "375"
.c create line 140 4520 460 4520 -fill #eef -dash {6 4}
.c create line 460 4488 460 4508 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 371 to 375 (Used 1 nobox 1)
# ProcLine[3] stays at 375 (Used 1 nobox 1)
.c create rectangle 386 4510 534 4530 -fill white -width 0
.c create text 460 4520 -text "observe?ORANGE,1"
.c create text 70 4544 -fill #eef -text "377"
.c create line 140 4544 460 4544 -fill #eef -dash {6 4}
.c create line 300 4512 300 4532 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 373 to 377 (Used 1 nobox 1)
# ProcLine[2] stays at 377 (Used 1 nobox 1)
.c create rectangle 226 4534 374 4554 -fill white -width 0
.c create text 300 4544 -text "observe!ORANGE,1"
.c create line 300 4554 380 4554 -fill darkred -tags mesg -width 2
.c create line 380 4554 460 4554 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4568 -fill #eef -text "379"
.c create line 140 4568 460 4568 -fill #eef -dash {6 4}
.c create line 460 4536 460 4556 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 375 to 379 (Used 1 nobox 1)
# ProcLine[3] stays at 379 (Used 1 nobox 1)
.c create rectangle 386 4558 534 4578 -fill white -width 0
.c create text 460 4568 -text "observe?ORANGE,1"
.c create text 70 4592 -fill #eef -text "381"
.c create line 140 4592 460 4592 -fill #eef -dash {6 4}
.c create line 300 4560 300 4580 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 377 to 381 (Used 1 nobox 1)
# ProcLine[2] stays at 381 (Used 1 nobox 1)
.c create rectangle 226 4582 374 4602 -fill white -width 0
.c create text 300 4592 -text "observe!ORANGE,1"
.c create line 300 4602 380 4602 -fill darkred -tags mesg -width 2
.c create line 380 4602 460 4602 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4616 -fill #eef -text "383"
.c create line 140 4616 460 4616 -fill #eef -dash {6 4}
.c create line 460 4584 460 4604 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 379 to 383 (Used 1 nobox 1)
# ProcLine[3] stays at 383 (Used 1 nobox 1)
.c create rectangle 386 4606 534 4626 -fill white -width 0
.c create text 460 4616 -text "observe?ORANGE,1"
.c create text 70 4640 -fill #eef -text "385"
.c create line 140 4640 460 4640 -fill #eef -dash {6 4}
.c create line 300 4608 300 4628 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 381 to 385 (Used 1 nobox 1)
# ProcLine[2] stays at 385 (Used 1 nobox 1)
.c create rectangle 226 4630 374 4650 -fill white -width 0
.c create text 300 4640 -text "observe!ORANGE,1"
.c create line 300 4650 380 4650 -fill darkred -tags mesg -width 2
.c create line 380 4650 460 4650 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4664 -fill #eef -text "387"
.c create line 140 4664 460 4664 -fill #eef -dash {6 4}
.c create line 460 4632 460 4652 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 383 to 387 (Used 1 nobox 1)
# ProcLine[3] stays at 387 (Used 1 nobox 1)
.c create rectangle 386 4654 534 4674 -fill white -width 0
.c create text 460 4664 -text "observe?ORANGE,1"
.c create text 70 4688 -fill #eef -text "389"
.c create line 140 4688 460 4688 -fill #eef -dash {6 4}
.c create line 300 4656 300 4676 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 385 to 389 (Used 1 nobox 1)
# ProcLine[2] stays at 389 (Used 1 nobox 1)
.c create rectangle 226 4678 374 4698 -fill white -width 0
.c create text 300 4688 -text "observe!ORANGE,1"
.c create line 300 4698 380 4698 -fill darkred -tags mesg -width 2
.c create line 380 4698 460 4698 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4712 -fill #eef -text "391"
.c create line 140 4712 460 4712 -fill #eef -dash {6 4}
.c create line 460 4680 460 4700 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 387 to 391 (Used 1 nobox 1)
# ProcLine[3] stays at 391 (Used 1 nobox 1)
.c create rectangle 386 4702 534 4722 -fill white -width 0
.c create text 460 4712 -text "observe?ORANGE,1"
.c create text 70 4736 -fill #eef -text "393"
.c create line 140 4736 460 4736 -fill #eef -dash {6 4}
.c create line 300 4704 300 4724 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 389 to 393 (Used 1 nobox 1)
# ProcLine[2] stays at 393 (Used 1 nobox 1)
.c create rectangle 226 4726 374 4746 -fill white -width 0
.c create text 300 4736 -text "observe!ORANGE,1"
.c create line 300 4746 380 4746 -fill darkred -tags mesg -width 2
.c create line 380 4746 460 4746 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4760 -fill #eef -text "395"
.c create line 140 4760 460 4760 -fill #eef -dash {6 4}
.c create line 460 4728 460 4748 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 391 to 395 (Used 1 nobox 1)
# ProcLine[3] stays at 395 (Used 1 nobox 1)
.c create rectangle 386 4750 534 4770 -fill white -width 0
.c create text 460 4760 -text "observe?ORANGE,1"
.c create text 70 4784 -fill #eef -text "397"
.c create line 140 4784 460 4784 -fill #eef -dash {6 4}
.c create line 300 4752 300 4772 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 393 to 397 (Used 1 nobox 1)
# ProcLine[2] stays at 397 (Used 1 nobox 1)
.c create rectangle 226 4774 374 4794 -fill white -width 0
.c create text 300 4784 -text "observe!ORANGE,1"
.c create line 300 4794 380 4794 -fill darkred -tags mesg -width 2
.c create line 380 4794 460 4794 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4808 -fill #eef -text "399"
.c create line 140 4808 460 4808 -fill #eef -dash {6 4}
.c create line 460 4776 460 4796 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 395 to 399 (Used 1 nobox 1)
# ProcLine[3] stays at 399 (Used 1 nobox 1)
.c create rectangle 386 4798 534 4818 -fill white -width 0
.c create text 460 4808 -text "observe?ORANGE,1"
.c create text 70 4832 -fill #eef -text "401"
.c create line 140 4832 460 4832 -fill #eef -dash {6 4}
.c create line 300 4800 300 4820 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 397 to 401 (Used 1 nobox 1)
# ProcLine[2] stays at 401 (Used 1 nobox 1)
.c create rectangle 226 4822 374 4842 -fill white -width 0
.c create text 300 4832 -text "observe!ORANGE,1"
.c create line 300 4842 380 4842 -fill darkred -tags mesg -width 2
.c create line 380 4842 460 4842 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4856 -fill #eef -text "403"
.c create line 140 4856 460 4856 -fill #eef -dash {6 4}
.c create line 460 4824 460 4844 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 399 to 403 (Used 1 nobox 1)
# ProcLine[3] stays at 403 (Used 1 nobox 1)
.c create rectangle 386 4846 534 4866 -fill white -width 0
.c create text 460 4856 -text "observe?ORANGE,1"
.c create text 70 4880 -fill #eef -text "405"
.c create line 140 4880 460 4880 -fill #eef -dash {6 4}
.c create line 300 4848 300 4868 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 401 to 405 (Used 1 nobox 1)
# ProcLine[2] stays at 405 (Used 1 nobox 1)
.c create rectangle 226 4870 374 4890 -fill white -width 0
.c create text 300 4880 -text "observe!ORANGE,1"
.c create line 300 4890 380 4890 -fill darkred -tags mesg -width 2
.c create line 380 4890 460 4890 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4904 -fill #eef -text "407"
.c create line 140 4904 460 4904 -fill #eef -dash {6 4}
.c create line 460 4872 460 4892 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 403 to 407 (Used 1 nobox 1)
# ProcLine[3] stays at 407 (Used 1 nobox 1)
.c create rectangle 386 4894 534 4914 -fill white -width 0
.c create text 460 4904 -text "observe?ORANGE,1"
.c create text 70 4928 -fill #eef -text "409"
.c create line 140 4928 460 4928 -fill #eef -dash {6 4}
.c create line 300 4896 300 4916 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 405 to 409 (Used 1 nobox 1)
# ProcLine[2] stays at 409 (Used 1 nobox 1)
.c create rectangle 226 4918 374 4938 -fill white -width 0
.c create text 300 4928 -text "observe!ORANGE,1"
.c create line 300 4938 380 4938 -fill darkred -tags mesg -width 2
.c create line 380 4938 460 4938 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4952 -fill #eef -text "411"
.c create line 140 4952 460 4952 -fill #eef -dash {6 4}
.c create line 460 4920 460 4940 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 407 to 411 (Used 1 nobox 1)
# ProcLine[3] stays at 411 (Used 1 nobox 1)
.c create rectangle 386 4942 534 4962 -fill white -width 0
.c create text 460 4952 -text "observe?ORANGE,1"
.c create text 70 4976 -fill #eef -text "413"
.c create line 140 4976 460 4976 -fill #eef -dash {6 4}
.c create line 300 4944 300 4964 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 409 to 413 (Used 1 nobox 1)
# ProcLine[2] stays at 413 (Used 1 nobox 1)
.c create rectangle 226 4966 374 4986 -fill white -width 0
.c create text 300 4976 -text "observe!ORANGE,1"
.c create line 300 4986 380 4986 -fill darkred -tags mesg -width 2
.c create line 380 4986 460 4986 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5000 -fill #eef -text "415"
.c create line 140 5000 460 5000 -fill #eef -dash {6 4}
.c create line 460 4968 460 4988 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 411 to 415 (Used 1 nobox 1)
# ProcLine[3] stays at 415 (Used 1 nobox 1)
.c create rectangle 386 4990 534 5010 -fill white -width 0
.c create text 460 5000 -text "observe?ORANGE,1"
.c create text 70 5024 -fill #eef -text "417"
.c create line 140 5024 460 5024 -fill #eef -dash {6 4}
.c create line 300 4992 300 5012 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 413 to 417 (Used 1 nobox 1)
# ProcLine[2] stays at 417 (Used 1 nobox 1)
.c create rectangle 226 5014 374 5034 -fill white -width 0
.c create text 300 5024 -text "observe!ORANGE,1"
.c create line 300 5034 380 5034 -fill darkred -tags mesg -width 2
.c create line 380 5034 460 5034 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5048 -fill #eef -text "419"
.c create line 140 5048 460 5048 -fill #eef -dash {6 4}
.c create line 460 5016 460 5036 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 415 to 419 (Used 1 nobox 1)
# ProcLine[3] stays at 419 (Used 1 nobox 1)
.c create rectangle 386 5038 534 5058 -fill white -width 0
.c create text 460 5048 -text "observe?ORANGE,1"
.c create text 70 5072 -fill #eef -text "421"
.c create line 140 5072 460 5072 -fill #eef -dash {6 4}
.c create line 300 5040 300 5060 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 417 to 421 (Used 1 nobox 1)
# ProcLine[2] stays at 421 (Used 1 nobox 1)
.c create rectangle 226 5062 374 5082 -fill white -width 0
.c create text 300 5072 -text "observe!ORANGE,1"
.c create line 300 5082 380 5082 -fill darkred -tags mesg -width 2
.c create line 380 5082 460 5082 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5096 -fill #eef -text "423"
.c create line 140 5096 460 5096 -fill #eef -dash {6 4}
.c create line 460 5064 460 5084 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 419 to 423 (Used 1 nobox 1)
# ProcLine[3] stays at 423 (Used 1 nobox 1)
.c create rectangle 386 5086 534 5106 -fill white -width 0
.c create text 460 5096 -text "observe?ORANGE,1"
.c create text 70 5120 -fill #eef -text "425"
.c create line 140 5120 460 5120 -fill #eef -dash {6 4}
.c create line 300 5088 300 5108 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 421 to 425 (Used 1 nobox 1)
# ProcLine[2] stays at 425 (Used 1 nobox 1)
.c create rectangle 226 5110 374 5130 -fill white -width 0
.c create text 300 5120 -text "observe!ORANGE,1"
.c create line 300 5130 380 5130 -fill darkred -tags mesg -width 2
.c create line 380 5130 460 5130 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5144 -fill #eef -text "427"
.c create line 140 5144 460 5144 -fill #eef -dash {6 4}
.c create line 460 5112 460 5132 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 423 to 427 (Used 1 nobox 1)
# ProcLine[3] stays at 427 (Used 1 nobox 1)
.c create rectangle 386 5134 534 5154 -fill white -width 0
.c create text 460 5144 -text "observe?ORANGE,1"
.c create text 70 5168 -fill #eef -text "429"
.c create line 140 5168 460 5168 -fill #eef -dash {6 4}
.c create line 300 5136 300 5156 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 425 to 429 (Used 1 nobox 1)
# ProcLine[2] stays at 429 (Used 1 nobox 1)
.c create rectangle 226 5158 374 5178 -fill white -width 0
.c create text 300 5168 -text "observe!ORANGE,1"
.c create line 300 5178 380 5178 -fill darkred -tags mesg -width 2
.c create line 380 5178 460 5178 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5192 -fill #eef -text "431"
.c create line 140 5192 460 5192 -fill #eef -dash {6 4}
.c create line 460 5160 460 5180 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 427 to 431 (Used 1 nobox 1)
# ProcLine[3] stays at 431 (Used 1 nobox 1)
.c create rectangle 386 5182 534 5202 -fill white -width 0
.c create text 460 5192 -text "observe?ORANGE,1"
.c create text 70 5216 -fill #eef -text "433"
.c create line 140 5216 460 5216 -fill #eef -dash {6 4}
.c create line 300 5184 300 5204 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 429 to 433 (Used 1 nobox 1)
# ProcLine[2] stays at 433 (Used 1 nobox 1)
.c create rectangle 226 5206 374 5226 -fill white -width 0
.c create text 300 5216 -text "observe!ORANGE,1"
.c create line 300 5226 380 5226 -fill darkred -tags mesg -width 2
.c create line 380 5226 460 5226 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5240 -fill #eef -text "435"
.c create line 140 5240 460 5240 -fill #eef -dash {6 4}
.c create line 460 5208 460 5228 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 431 to 435 (Used 1 nobox 1)
# ProcLine[3] stays at 435 (Used 1 nobox 1)
.c create rectangle 386 5230 534 5250 -fill white -width 0
.c create text 460 5240 -text "observe?ORANGE,1"
.c create text 70 5264 -fill #eef -text "437"
.c create line 140 5264 460 5264 -fill #eef -dash {6 4}
.c create line 300 5232 300 5252 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 433 to 437 (Used 1 nobox 1)
# ProcLine[2] stays at 437 (Used 1 nobox 1)
.c create rectangle 226 5254 374 5274 -fill white -width 0
.c create text 300 5264 -text "observe!ORANGE,1"
.c create line 300 5274 380 5274 -fill darkred -tags mesg -width 2
.c create line 380 5274 460 5274 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5288 -fill #eef -text "439"
.c create line 140 5288 460 5288 -fill #eef -dash {6 4}
.c create line 460 5256 460 5276 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 435 to 439 (Used 1 nobox 1)
# ProcLine[3] stays at 439 (Used 1 nobox 1)
.c create rectangle 386 5278 534 5298 -fill white -width 0
.c create text 460 5288 -text "observe?ORANGE,1"
.c create text 70 5312 -fill #eef -text "441"
.c create line 140 5312 460 5312 -fill #eef -dash {6 4}
.c create line 300 5280 300 5300 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 437 to 441 (Used 1 nobox 1)
# ProcLine[2] stays at 441 (Used 1 nobox 1)
.c create rectangle 226 5302 374 5322 -fill white -width 0
.c create text 300 5312 -text "observe!ORANGE,1"
.c create line 300 5322 380 5322 -fill darkred -tags mesg -width 2
.c create line 380 5322 460 5322 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5336 -fill #eef -text "443"
.c create line 140 5336 460 5336 -fill #eef -dash {6 4}
.c create line 460 5304 460 5324 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 439 to 443 (Used 1 nobox 1)
# ProcLine[3] stays at 443 (Used 1 nobox 1)
.c create rectangle 386 5326 534 5346 -fill white -width 0
.c create text 460 5336 -text "observe?ORANGE,1"
.c create text 70 5360 -fill #eef -text "445"
.c create line 140 5360 460 5360 -fill #eef -dash {6 4}
.c create line 300 5328 300 5348 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 441 to 445 (Used 1 nobox 1)
# ProcLine[2] stays at 445 (Used 1 nobox 1)
.c create rectangle 226 5350 374 5370 -fill white -width 0
.c create text 300 5360 -text "observe!ORANGE,1"
.c create line 300 5370 380 5370 -fill darkred -tags mesg -width 2
.c create line 380 5370 460 5370 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5384 -fill #eef -text "447"
.c create line 140 5384 460 5384 -fill #eef -dash {6 4}
.c create line 460 5352 460 5372 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 443 to 447 (Used 1 nobox 1)
# ProcLine[3] stays at 447 (Used 1 nobox 1)
.c create rectangle 386 5374 534 5394 -fill white -width 0
.c create text 460 5384 -text "observe?ORANGE,1"
.c create text 70 5408 -fill #eef -text "449"
.c create line 140 5408 460 5408 -fill #eef -dash {6 4}
.c create line 300 5376 300 5396 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 445 to 449 (Used 1 nobox 1)
# ProcLine[2] stays at 449 (Used 1 nobox 1)
.c create rectangle 226 5398 374 5418 -fill white -width 0
.c create text 300 5408 -text "observe!ORANGE,1"
.c create line 300 5418 380 5418 -fill darkred -tags mesg -width 2
.c create line 380 5418 460 5418 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5432 -fill #eef -text "451"
.c create line 140 5432 460 5432 -fill #eef -dash {6 4}
.c create line 460 5400 460 5420 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 447 to 451 (Used 1 nobox 1)
# ProcLine[3] stays at 451 (Used 1 nobox 1)
.c create rectangle 386 5422 534 5442 -fill white -width 0
.c create text 460 5432 -text "observe?ORANGE,1"
.c create text 70 5456 -fill #eef -text "453"
.c create line 140 5456 460 5456 -fill #eef -dash {6 4}
.c create line 300 5424 300 5444 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 449 to 453 (Used 1 nobox 1)
# ProcLine[2] stays at 453 (Used 1 nobox 1)
.c create rectangle 226 5446 374 5466 -fill white -width 0
.c create text 300 5456 -text "observe!ORANGE,1"
.c create line 300 5466 380 5466 -fill darkred -tags mesg -width 2
.c create line 380 5466 460 5466 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5480 -fill #eef -text "455"
.c create line 140 5480 460 5480 -fill #eef -dash {6 4}
.c create line 460 5448 460 5468 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 451 to 455 (Used 1 nobox 1)
# ProcLine[3] stays at 455 (Used 1 nobox 1)
.c create rectangle 386 5470 534 5490 -fill white -width 0
.c create text 460 5480 -text "observe?ORANGE,1"
.c create text 70 5504 -fill #eef -text "457"
.c create line 140 5504 460 5504 -fill #eef -dash {6 4}
.c create line 300 5472 300 5492 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 453 to 457 (Used 1 nobox 1)
# ProcLine[2] stays at 457 (Used 1 nobox 1)
.c create rectangle 226 5494 374 5514 -fill white -width 0
.c create text 300 5504 -text "observe!ORANGE,1"
.c create line 300 5514 380 5514 -fill darkred -tags mesg -width 2
.c create line 380 5514 460 5514 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5528 -fill #eef -text "459"
.c create line 140 5528 460 5528 -fill #eef -dash {6 4}
.c create line 460 5496 460 5516 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 455 to 459 (Used 1 nobox 1)
# ProcLine[3] stays at 459 (Used 1 nobox 1)
.c create rectangle 386 5518 534 5538 -fill white -width 0
.c create text 460 5528 -text "observe?ORANGE,1"
.c create text 70 5552 -fill #eef -text "461"
.c create line 140 5552 460 5552 -fill #eef -dash {6 4}
.c create line 300 5520 300 5540 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 457 to 461 (Used 1 nobox 1)
# ProcLine[2] stays at 461 (Used 1 nobox 1)
.c create rectangle 226 5542 374 5562 -fill white -width 0
.c create text 300 5552 -text "observe!ORANGE,1"
.c create line 300 5562 380 5562 -fill darkred -tags mesg -width 2
.c create line 380 5562 460 5562 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5576 -fill #eef -text "463"
.c create line 140 5576 460 5576 -fill #eef -dash {6 4}
.c create line 460 5544 460 5564 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 459 to 463 (Used 1 nobox 1)
# ProcLine[3] stays at 463 (Used 1 nobox 1)
.c create rectangle 386 5566 534 5586 -fill white -width 0
.c create text 460 5576 -text "observe?ORANGE,1"
.c create text 70 5600 -fill #eef -text "465"
.c create line 140 5600 460 5600 -fill #eef -dash {6 4}
.c create line 300 5568 300 5588 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 461 to 465 (Used 1 nobox 1)
# ProcLine[2] stays at 465 (Used 1 nobox 1)
.c create rectangle 226 5590 374 5610 -fill white -width 0
.c create text 300 5600 -text "observe!ORANGE,1"
.c create line 300 5610 380 5610 -fill darkred -tags mesg -width 2
.c create line 380 5610 460 5610 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5624 -fill #eef -text "467"
.c create line 140 5624 460 5624 -fill #eef -dash {6 4}
.c create line 460 5592 460 5612 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 463 to 467 (Used 1 nobox 1)
# ProcLine[3] stays at 467 (Used 1 nobox 1)
.c create rectangle 386 5614 534 5634 -fill white -width 0
.c create text 460 5624 -text "observe?ORANGE,1"
.c create text 70 5648 -fill #eef -text "469"
.c create line 140 5648 460 5648 -fill #eef -dash {6 4}
.c create line 300 5616 300 5636 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 465 to 469 (Used 1 nobox 1)
# ProcLine[2] stays at 469 (Used 1 nobox 1)
.c create rectangle 226 5638 374 5658 -fill white -width 0
.c create text 300 5648 -text "observe!ORANGE,1"
.c create line 300 5658 380 5658 -fill darkred -tags mesg -width 2
.c create line 380 5658 460 5658 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5672 -fill #eef -text "471"
.c create line 140 5672 460 5672 -fill #eef -dash {6 4}
.c create line 460 5640 460 5660 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 467 to 471 (Used 1 nobox 1)
# ProcLine[3] stays at 471 (Used 1 nobox 1)
.c create rectangle 386 5662 534 5682 -fill white -width 0
.c create text 460 5672 -text "observe?ORANGE,1"
.c create text 70 5696 -fill #eef -text "473"
.c create line 140 5696 460 5696 -fill #eef -dash {6 4}
.c create line 300 5664 300 5684 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 469 to 473 (Used 1 nobox 1)
# ProcLine[2] stays at 473 (Used 1 nobox 1)
.c create rectangle 226 5686 374 5706 -fill white -width 0
.c create text 300 5696 -text "observe!ORANGE,1"
.c create line 300 5706 380 5706 -fill darkred -tags mesg -width 2
.c create line 380 5706 460 5706 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5720 -fill #eef -text "475"
.c create line 140 5720 460 5720 -fill #eef -dash {6 4}
.c create line 460 5688 460 5708 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 471 to 475 (Used 1 nobox 1)
# ProcLine[3] stays at 475 (Used 1 nobox 1)
.c create rectangle 386 5710 534 5730 -fill white -width 0
.c create text 460 5720 -text "observe?ORANGE,1"
.c create text 70 5744 -fill #eef -text "477"
.c create line 140 5744 460 5744 -fill #eef -dash {6 4}
.c create line 300 5712 300 5732 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 473 to 477 (Used 1 nobox 1)
# ProcLine[2] stays at 477 (Used 1 nobox 1)
.c create rectangle 226 5734 374 5754 -fill white -width 0
.c create text 300 5744 -text "observe!ORANGE,1"
.c create line 300 5754 380 5754 -fill darkred -tags mesg -width 2
.c create line 380 5754 460 5754 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5768 -fill #eef -text "479"
.c create line 140 5768 460 5768 -fill #eef -dash {6 4}
.c create line 460 5736 460 5756 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 475 to 479 (Used 1 nobox 1)
# ProcLine[3] stays at 479 (Used 1 nobox 1)
.c create rectangle 386 5758 534 5778 -fill white -width 0
.c create text 460 5768 -text "observe?ORANGE,1"
.c lower grid
.c raise mesg
