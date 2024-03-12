# maxx 1
# maxx 2
# maxx 3
# maxx 4
# maxx 5
# maxx 6
# maxx 7
# Scaler 0.401786, MH 1493
wm title . "scenario"
wm geometry . 1440x600+650+100
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
.c create line 140 32 1260 32 -fill #eef -dash {6 4}
.c create line 300 36 300 20 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 0 to 1 (Used 0 nobox 0)
.c create rectangle 240 24 364 44 -fill black
# ProcLine[2] stays at 1 (Used 0 nobox 0)
.c create rectangle 239 22 361 42 -fill ivory
.c create text 300 32 -text "1:observateur"
.c create text 70 56 -fill #eef -text "3"
.c create line 140 56 1260 56 -fill #eef -dash {6 4}
.c create line 460 36 460 44 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 0 to 3 (Used 0 nobox 0)
.c create rectangle 395 48 529 68 -fill black
# ProcLine[3] stays at 3 (Used 0 nobox 0)
.c create rectangle 394 46 526 66 -fill ivory
.c create text 460 56 -text "2:gestionnaire"
.c create text 70 80 -fill #eef -text "5"
.c create line 140 80 1260 80 -fill #eef -dash {6 4}
.c create line 620 36 620 68 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 0 to 5 (Used 0 nobox 0)
.c create rectangle 566 72 678 92 -fill black
# ProcLine[4] stays at 5 (Used 0 nobox 0)
.c create rectangle 564 70 676 90 -fill ivory
.c create text 620 80 -text "3:producteur"
.c create text 70 104 -fill #eef -text "7"
.c create line 140 104 1260 104 -fill #eef -dash {6 4}
.c create line 620 96 620 92 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 5 to 7 (Used 1 nobox 0)
# ProcLine[4] stays at 7 (Used 1 nobox 1)
.c create rectangle 596 94 644 114 -fill white -width 0
.c create text 620 104 -text "obs!p"
.c create line 620 114 460 114 -fill darkred -tags mesg -width 2
.c create line 460 114 300 114 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 128 -fill #eef -text "9"
.c create line 140 128 1260 128 -fill #eef -dash {6 4}
.c create line 300 48 300 116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 1 to 9 (Used 1 nobox 1)
# ProcLine[2] stays at 9 (Used 1 nobox 1)
.c create rectangle 276 118 324 138 -fill white -width 0
.c create text 300 128 -text "obs?p"
.c create text 70 152 -fill #eef -text "11"
.c create line 140 152 1260 152 -fill #eef -dash {6 4}
.c create line 620 120 620 140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 7 to 11 (Used 1 nobox 1)
# ProcLine[4] stays at 11 (Used 1 nobox 1)
.c create rectangle 482 142 758 162 -fill white -width 0
.c create text 620 152 -text "producteurGestion!VIDE,paquet"
.c create line 620 162 540 162 -fill darkred -tags mesg -width 2
.c create line 540 162 460 162 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 176 -fill #eef -text "13"
.c create line 140 176 1260 176 -fill #eef -dash {6 4}
.c create line 460 72 460 164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 3 to 13 (Used 1 nobox 1)
# ProcLine[3] stays at 13 (Used 1 nobox 1)
.c create rectangle 322 166 598 186 -fill white -width 0
.c create text 460 176 -text "producteurGestion?VIDE,paquet"
.c create text 70 200 -fill #eef -text "15"
.c create line 140 200 1260 200 -fill #eef -dash {6 4}
.c create line 620 168 620 188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 11 to 15 (Used 1 nobox 1)
# ProcLine[4] stays at 15 (Used 1 nobox 1)
.c create rectangle 391 190 849 210 -fill white -width 0
.c create text 620 200 -text "Producteur 1 envoie un paquet aux gestionnaires"
.c create text 70 224 -fill #eef -text "17"
.c create line 140 224 1260 224 -fill #eef -dash {6 4}
.c create line 780 36 780 212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 0 to 17 (Used 0 nobox 1)
# ProcLine[5] stays at 17 (Used 0 nobox 0)
.c create rectangle 724 214 836 234 -fill ivory
.c create text 780 224 -text "4:producteur"
.c create text 70 248 -fill #eef -text "19"
.c create line 140 248 1260 248 -fill #eef -dash {6 4}
.c create line 300 144 300 236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 9 to 19 (Used 1 nobox 0)
# ProcLine[2] stays at 19 (Used 1 nobox 1)
.c create rectangle -36 238 636 258 -fill white -width 0
.c create text 300 248 -text "Observateur: produit 1; ouvGest 0; ouvColl 0; prodGest 0; collectes 0"
.c create text 70 272 -fill #eef -text "21"
.c create line 140 272 1260 272 -fill #eef -dash {6 4}
.c create line 460 192 460 260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 13 to 21 (Used 1 nobox 1)
# ProcLine[3] stays at 21 (Used 1 nobox 1)
.c create rectangle 434 262 486 282 -fill white -width 0
.c create text 460 272 -text "obs!rp"
.c create line 460 282 380 282 -fill darkred -tags mesg -width 2
.c create line 380 282 300 282 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 296 -fill #eef -text "23"
.c create line 140 296 1260 296 -fill #eef -dash {6 4}
.c create line 300 264 300 284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 19 to 23 (Used 1 nobox 1)
# ProcLine[2] stays at 23 (Used 1 nobox 1)
.c create rectangle 274 286 326 306 -fill white -width 0
.c create text 300 296 -text "obs?rp"
.c create text 70 320 -fill #eef -text "25"
.c create line 140 320 1260 320 -fill #eef -dash {6 4}
.c create line 460 288 460 308 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 21 to 25 (Used 1 nobox 1)
# ProcLine[3] stays at 25 (Used 1 nobox 1)
.c create rectangle 178 310 742 330 -fill white -width 0
.c create text 460 320 -text "Gestionnaire 1 a recu un paquet de la part des producteurs"
.c create text 70 344 -fill #eef -text "27"
.c create line 140 344 1260 344 -fill #eef -dash {6 4}
.c create line 940 36 940 332 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[6] from 0 to 27 (Used 0 nobox 1)
# ProcLine[6] stays at 27 (Used 0 nobox 0)
.c create rectangle 898 334 982 354 -fill ivory
.c create text 940 344 -text "5:ouvrier"
.c create text 70 368 -fill #eef -text "29"
.c create line 140 368 1260 368 -fill #eef -dash {6 4}
.c create line 300 312 300 356 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 23 to 29 (Used 1 nobox 0)
# ProcLine[2] stays at 29 (Used 1 nobox 1)
.c create rectangle -36 358 636 378 -fill white -width 0
.c create text 300 368 -text "Observateur: produit 1; ouvGest 0; ouvColl 0; prodGest 1; collectes 0"
.c create text 70 392 -fill #eef -text "31"
.c create line 140 392 1260 392 -fill #eef -dash {6 4}
.c create line 1100 36 1100 380 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[7] from 0 to 31 (Used 0 nobox 1)
# ProcLine[7] stays at 31 (Used 0 nobox 0)
.c create rectangle 1058 382 1142 402 -fill ivory
.c create text 1100 392 -text "6:ouvrier"
.c create text 70 416 -fill #eef -text "33"
.c create line 140 416 1260 416 -fill #eef -dash {6 4}
.c create line 780 240 780 404 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[5] from 17 to 33 (Used 1 nobox 0)
# ProcLine[5] stays at 33 (Used 1 nobox 1)
.c create rectangle 756 406 804 426 -fill white -width 0
.c create text 780 416 -text "obs!p"
.c create line 780 426 540 426 -fill darkred -tags mesg -width 2
.c create line 540 426 300 426 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 440 -fill #eef -text "35"
.c create line 140 440 1260 440 -fill #eef -dash {6 4}
.c create line 300 384 300 428 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 29 to 35 (Used 1 nobox 1)
# ProcLine[2] stays at 35 (Used 1 nobox 1)
.c create rectangle 276 430 324 450 -fill white -width 0
.c create text 300 440 -text "obs?p"
.c create text 70 464 -fill #eef -text "37"
.c create line 140 464 1260 464 -fill #eef -dash {6 4}
.c create line 460 336 460 452 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[3] from 25 to 37 (Used 1 nobox 1)
# ProcLine[3] stays at 37 (Used 1 nobox 1)
.c create rectangle 386 454 534 474 -fill white -width 0
.c create text 460 464 -text "filecounter = 1"
.c create text 70 488 -fill #eef -text "39"
.c create line 140 488 1260 488 -fill #eef -dash {6 4}
.c create line 300 456 300 476 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 35 to 39 (Used 1 nobox 1)
# ProcLine[2] stays at 39 (Used 1 nobox 1)
.c create rectangle -36 478 636 498 -fill white -width 0
.c create text 300 488 -text "Observateur: produit 2; ouvGest 0; ouvColl 0; prodGest 1; collectes 0"
.c create text 70 512 -fill #eef -text "41"
.c create line 140 512 1260 512 -fill #eef -dash {6 4}
.c create line 1260 36 1260 500 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[8] from 0 to 41 (Used 0 nobox 1)
# ProcLine[8] stays at 41 (Used 0 nobox 0)
.c create rectangle 1204 502 1316 522 -fill ivory
.c create text 1260 512 -text "7:collecteur"
.c create text 70 536 -fill #eef -text "43"
.c create line 140 536 1260 536 -fill #eef -dash {6 4}
.c create line 620 216 620 524 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[4] from 15 to 43 (Used 1 nobox 0)
# ProcLine[4] stays at 43 (Used 1 nobox 1)
.c create rectangle 596 526 644 546 -fill white -width 0
.c create text 620 536 -text "obs!p"
.c create line 620 546 460 546 -fill darkred -tags mesg -width 2
.c create line 460 546 300 546 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 560 -fill #eef -text "45"
.c create line 140 560 1260 560 -fill #eef -dash {6 4}
.c create line 300 504 300 548 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 39 to 45 (Used 1 nobox 1)
# ProcLine[2] stays at 45 (Used 1 nobox 1)
.c create rectangle 276 550 324 570 -fill white -width 0
.c create text 300 560 -text "obs?p"
.c create text 70 584 -fill #eef -text "47"
.c create line 140 584 1260 584 -fill #eef -dash {6 4}
.c create line 300 576 300 572 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 45 to 47 (Used 1 nobox 1)
# ProcLine[2] stays at 47 (Used 1 nobox 1)
.c create rectangle -36 574 636 594 -fill white -width 0
.c create text 300 584 -text "Observateur: produit 3; ouvGest 0; ouvColl 0; prodGest 1; collectes 0"
.c create text 70 608 -fill #eef -text "49"
.c create line 140 608 1260 608 -fill #eef -dash {6 4}
.c create line 140 36 140 596 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 0 to 49 (Used 1 nobox 1)
# ProcLine[1] stays at 49 (Used 1 nobox 1)
.c create rectangle 103 598 177 618 -fill white -width 0
.c create text 140 608 -text "timeout"
.c lower grid
.c raise mesg
