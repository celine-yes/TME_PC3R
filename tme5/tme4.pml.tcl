# maxx 1
# maxx 2
# maxx 3
# maxx 4
# maxx 5
# maxx 6
# maxx 7
# maxx 8
# Scaler 0.351562, MH 1706
wm title . "scenario"
wm geometry . 1600x600+650+100
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
.c create line 140 32 1420 32 -fill #eef -dash {6 4}
.c create line 300 36 300 20 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 0 to 1 (Used 0 nobox 0)
.c create rectangle 240 24 364 44 -fill black
# ProcLine[2] stays at 1 (Used 0 nobox 0)
.c create rectangle 239 22 361 42 -fill ivory
.c create text 300 32 -text "1:observateur"
.c create text 70 56 -fill #eef -text "3"
.c create line 140 56 1420 56 -fill #eef -dash {6 4}
.c create line 460 36 460 44 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 0 to 3 (Used 0 nobox 0)
.c create rectangle 395 48 529 68 -fill black
# ProcLine[3] stays at 3 (Used 0 nobox 0)
.c create rectangle 394 46 526 66 -fill ivory
.c create text 460 56 -text "2:gestionnaire"
.c create text 70 80 -fill #eef -text "5"
.c create line 140 80 1420 80 -fill #eef -dash {6 4}
.c create line 620 36 620 68 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 0 to 5 (Used 0 nobox 0)
.c create rectangle 555 72 689 92 -fill black
# ProcLine[4] stays at 5 (Used 0 nobox 0)
.c create rectangle 554 70 686 90 -fill ivory
.c create text 620 80 -text "3:gestionnaire"
.c create text 70 104 -fill #eef -text "7"
.c create line 140 104 1420 104 -fill #eef -dash {6 4}
.c create line 780 36 780 92 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 0 to 7 (Used 0 nobox 0)
.c create rectangle 726 96 838 116 -fill black
# ProcLine[5] stays at 7 (Used 0 nobox 0)
.c create rectangle 724 94 836 114 -fill ivory
.c create text 780 104 -text "4:producteur"
.c create text 70 128 -fill #eef -text "9"
.c create line 140 128 1420 128 -fill #eef -dash {6 4}
.c create line 780 120 780 116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 7 to 9 (Used 1 nobox 0)
# ProcLine[5] stays at 9 (Used 1 nobox 1)
.c create rectangle 551 118 1009 138 -fill white -width 0
.c create text 780 128 -text "Producteur 1 envoie un paquet aux gestionnaires"
.c create text 70 152 -fill #eef -text "11"
.c create line 140 152 1420 152 -fill #eef -dash {6 4}
.c create line 940 36 940 140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[6] from 0 to 11 (Used 0 nobox 1)
# ProcLine[6] stays at 11 (Used 0 nobox 0)
.c create rectangle 884 142 996 162 -fill ivory
.c create text 940 152 -text "5:producteur"
.c create line 780 186 620 186 -fill darkblue -tags mesg -width 2
.c create line 620 186 460 186 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 176 -fill #eef -text "13"
.c create line 140 176 1420 176 -fill #eef -dash {6 4}
.c create line 780 144 780 164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 9 to 13 (Used 1 nobox 0)
# ProcLine[5] stays at 13 (Used 1 nobox 1)
.c create rectangle 642 166 918 186 -fill white -width 0
.c create text 780 176 -text "producteurGestion!VIDE,paquet"
.c create text 70 200 -fill #eef -text "15"
.c create line 140 200 1420 200 -fill #eef -dash {6 4}
.c create line 460 72 460 188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 3 to 15 (Used 1 nobox 1)
# ProcLine[3] stays at 15 (Used 1 nobox 1)
.c create rectangle 322 190 598 210 -fill white -width 0
.c create text 460 200 -text "producteurGestion?VIDE,paquet"
.c create text 70 224 -fill #eef -text "17"
.c create line 140 224 1420 224 -fill #eef -dash {6 4}
.c create line 460 216 460 212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 15 to 17 (Used 1 nobox 1)
# ProcLine[3] stays at 17 (Used 1 nobox 1)
.c create rectangle 178 214 742 234 -fill white -width 0
.c create text 460 224 -text "Gestionnaire 1 a recu un paquet de la part des producteurs"
.c create line 780 258 540 258 -fill darkblue -tags mesg -width 2
.c create line 540 258 300 258 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 248 -fill #eef -text "19"
.c create line 140 248 1420 248 -fill #eef -dash {6 4}
.c create line 780 192 780 236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 13 to 19 (Used 1 nobox 1)
# ProcLine[5] stays at 19 (Used 1 nobox 1)
.c create rectangle 756 238 804 258 -fill white -width 0
.c create text 780 248 -text "obs!p"
.c create text 70 272 -fill #eef -text "21"
.c create line 140 272 1420 272 -fill #eef -dash {6 4}
.c create line 300 48 300 260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 1 to 21 (Used 1 nobox 1)
# ProcLine[2] stays at 21 (Used 1 nobox 1)
.c create rectangle 276 262 324 282 -fill white -width 0
.c create text 300 272 -text "obs?p"
.c create line 460 306 380 306 -fill darkblue -tags mesg -width 2
.c create line 380 306 380 550 -fill darkblue -tags mesg -width 2
.c create line 380 550 300 550 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 296 -fill #eef -text "23"
.c create line 140 296 1420 296 -fill #eef -dash {6 4}
.c create line 460 240 460 284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 17 to 23 (Used 1 nobox 1)
# ProcLine[3] stays at 23 (Used 1 nobox 1)
.c create rectangle 434 286 486 306 -fill white -width 0
.c create text 460 296 -text "obs!rp"
.c create text 70 320 -fill #eef -text "25"
.c create line 140 320 1420 320 -fill #eef -dash {6 4}
.c create line 940 168 940 308 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[6] from 11 to 25 (Used 1 nobox 1)
# ProcLine[6] stays at 25 (Used 1 nobox 1)
.c create rectangle 711 310 1169 330 -fill white -width 0
.c create text 940 320 -text "Producteur 2 envoie un paquet aux gestionnaires"
.c create line 940 354 780 354 -fill darkblue -tags mesg -width 2
.c create line 780 354 620 354 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 344 -fill #eef -text "27"
.c create line 140 344 1420 344 -fill #eef -dash {6 4}
.c create line 940 336 940 332 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[6] from 25 to 27 (Used 1 nobox 1)
# ProcLine[6] stays at 27 (Used 1 nobox 1)
.c create rectangle 802 334 1078 354 -fill white -width 0
.c create text 940 344 -text "producteurGestion!VIDE,paquet"
.c create text 70 368 -fill #eef -text "29"
.c create line 140 368 1420 368 -fill #eef -dash {6 4}
.c create line 620 96 620 356 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 5 to 29 (Used 1 nobox 1)
# ProcLine[4] stays at 29 (Used 1 nobox 1)
.c create rectangle 482 358 758 378 -fill white -width 0
.c create text 620 368 -text "producteurGestion?VIDE,paquet"
.c create text 70 392 -fill #eef -text "31"
.c create line 140 392 1420 392 -fill #eef -dash {6 4}
.c create line 620 384 620 380 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 29 to 31 (Used 1 nobox 1)
# ProcLine[4] stays at 31 (Used 1 nobox 1)
.c create rectangle 338 382 902 402 -fill white -width 0
.c create text 620 392 -text "Gestionnaire 2 a recu un paquet de la part des producteurs"
.c create text 70 416 -fill #eef -text "33"
.c create line 140 416 1420 416 -fill #eef -dash {6 4}
.c create line 300 288 300 404 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 21 to 33 (Used 1 nobox 1)
# ProcLine[2] stays at 33 (Used 1 nobox 1)
.c create rectangle -86 406 686 426 -fill white -width 0
.c create text 300 416 -text "Observateur: produit 1; ouvGest 0; ouvColl 0; prodGest 0; ouvGest 0; collectes 0"
.c create text 70 440 -fill #eef -text "35"
.c create line 140 440 1420 440 -fill #eef -dash {6 4}
.c create line 1100 36 1100 428 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 0 to 35 (Used 0 nobox 1)
# ProcLine[7] stays at 35 (Used 0 nobox 0)
.c create rectangle 1058 430 1142 450 -fill ivory
.c create text 1100 440 -text "6:ouvrier"
.c create text 70 464 -fill #eef -text "37"
.c create line 140 464 1420 464 -fill #eef -dash {6 4}
.c create line 460 312 460 452 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 23 to 37 (Used 1 nobox 0)
# ProcLine[3] stays at 37 (Used 1 nobox 1)
.c create rectangle 244 454 676 474 -fill white -width 0
.c create text 460 464 -text "Gestionnaire 1 envoie un paquet aux ouvriers"
.c create text 70 488 -fill #eef -text "39"
.c create line 140 488 1420 488 -fill #eef -dash {6 4}
.c create line 460 480 460 476 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 37 to 39 (Used 1 nobox 1)
# ProcLine[3] stays at 39 (Used 1 nobox 1)
.c create rectangle 346 478 574 498 -fill white -width 0
.c create text 460 488 -text "gestionOuvrier!paquet,10"
.c create text 70 512 -fill #eef -text "41"
.c create line 140 512 1420 512 -fill #eef -dash {6 4}
.c create line 780 264 780 500 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 19 to 41 (Used 1 nobox 1)
# ProcLine[5] stays at 41 (Used 1 nobox 1)
.c create rectangle 551 502 1009 522 -fill white -width 0
.c create text 780 512 -text "Producteur 1 envoie un paquet aux gestionnaires"
.c create line 780 546 620 546 -fill darkblue -tags mesg -width 2
.c create line 620 546 620 718 -fill darkblue -tags mesg -width 2
.c create line 620 718 460 718 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 536 -fill #eef -text "43"
.c create line 140 536 1420 536 -fill #eef -dash {6 4}
.c create line 780 528 780 524 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 41 to 43 (Used 1 nobox 1)
# ProcLine[5] stays at 43 (Used 1 nobox 1)
.c create rectangle 642 526 918 546 -fill white -width 0
.c create text 780 536 -text "producteurGestion!VIDE,paquet"
.c create text 70 560 -fill #eef -text "45"
.c create line 140 560 1420 560 -fill #eef -dash {6 4}
.c create line 300 432 300 548 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 33 to 45 (Used 1 nobox 1)
# ProcLine[2] stays at 45 (Used 1 nobox 1)
.c create rectangle 274 550 326 570 -fill white -width 0
.c create text 300 560 -text "obs?rp"
.c create line 620 594 460 594 -fill darkblue -tags mesg -width 2
.c create line 460 594 460 694 -fill darkblue -tags mesg -width 2
.c create line 460 694 300 694 -fill darkblue -width 2 -arrow last -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 584 -fill #eef -text "47"
.c create line 140 584 1420 584 -fill #eef -dash {6 4}
.c create line 620 408 620 572 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 31 to 47 (Used 1 nobox 1)
# ProcLine[4] stays at 47 (Used 1 nobox 1)
.c create rectangle 594 574 646 594 -fill white -width 0
.c create text 620 584 -text "obs!rp"
.c create text 70 608 -fill #eef -text "49"
.c create line 140 608 1420 608 -fill #eef -dash {6 4}
.c create line 1260 36 1260 596 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[8] from 0 to 49 (Used 0 nobox 1)
# ProcLine[8] stays at 49 (Used 0 nobox 0)
.c create rectangle 1218 598 1302 618 -fill ivory
.c create text 1260 608 -text "7:ouvrier"
.c create text 70 632 -fill #eef -text "51"
.c create line 140 632 1420 632 -fill #eef -dash {6 4}
.c create line 620 600 620 620 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 47 to 51 (Used 1 nobox 0)
# ProcLine[4] stays at 51 (Used 1 nobox 1)
.c create rectangle 404 622 836 642 -fill white -width 0
.c create text 620 632 -text "Gestionnaire 2 envoie un paquet aux ouvriers"
.c create text 70 656 -fill #eef -text "53"
.c create line 140 656 1420 656 -fill #eef -dash {6 4}
.c create line 300 576 300 644 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 45 to 53 (Used 1 nobox 1)
# ProcLine[2] stays at 53 (Used 1 nobox 1)
.c create rectangle -86 646 686 666 -fill white -width 0
.c create text 300 656 -text "Observateur: produit 1; ouvGest 0; ouvColl 0; prodGest 1; ouvGest 0; collectes 0"
.c create text 70 680 -fill #eef -text "55"
.c create line 140 680 1420 680 -fill #eef -dash {6 4}
.c create line 1420 36 1420 668 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[9] from 0 to 55 (Used 0 nobox 1)
# ProcLine[9] stays at 55 (Used 0 nobox 0)
.c create rectangle 1364 670 1476 690 -fill ivory
.c create text 1420 680 -text "8:collecteur"
.c create text 70 704 -fill #eef -text "57"
.c create line 140 704 1420 704 -fill #eef -dash {6 4}
.c create line 300 672 300 692 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 53 to 57 (Used 1 nobox 0)
# ProcLine[2] stays at 57 (Used 1 nobox 1)
.c create rectangle 274 694 326 714 -fill white -width 0
.c create text 300 704 -text "obs?rp"
.c create text 70 728 -fill #eef -text "59"
.c create line 140 728 1420 728 -fill #eef -dash {6 4}
.c create line 460 504 460 716 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 39 to 59 (Used 1 nobox 1)
# ProcLine[3] stays at 59 (Used 1 nobox 1)
.c create rectangle 322 718 598 738 -fill white -width 0
.c create text 460 728 -text "producteurGestion?VIDE,paquet"
.c create text 70 752 -fill #eef -text "61"
.c create line 140 752 1420 752 -fill #eef -dash {6 4}
.c create line 940 360 940 740 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[6] from 27 to 61 (Used 1 nobox 1)
# ProcLine[6] stays at 61 (Used 1 nobox 1)
.c create rectangle 916 742 964 762 -fill white -width 0
.c create text 940 752 -text "obs!p"
.c create text 70 776 -fill #eef -text "63"
.c create line 140 776 1420 776 -fill #eef -dash {6 4}
.c create line 460 744 460 764 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 59 to 63 (Used 1 nobox 1)
# ProcLine[3] stays at 63 (Used 1 nobox 1)
.c create rectangle 178 766 742 786 -fill white -width 0
.c create text 460 776 -text "Gestionnaire 1 a recu un paquet de la part des producteurs"
.c create text 70 800 -fill #eef -text "65"
.c create line 140 800 1420 800 -fill #eef -dash {6 4}
.c create line 300 720 300 788 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 57 to 65 (Used 1 nobox 1)
# ProcLine[2] stays at 65 (Used 1 nobox 1)
.c create rectangle -86 790 686 810 -fill white -width 0
.c create text 300 800 -text "Observateur: produit 1; ouvGest 0; ouvColl 0; prodGest 2; ouvGest 0; collectes 0"
.c lower grid
.c raise mesg
