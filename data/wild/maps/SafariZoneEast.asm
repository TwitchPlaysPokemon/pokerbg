ZoneMons1:
	db 30 ; grass encounter rate
IF DEF(_RED)
	db 24, NIDORAN_M
	db 26, DODUO
	db 22, PARAS
	db 25, EXEGGCUTE
	db 33, NIDORINO
	db 23, EXEGGCUTE
	db 24, NIDORAN_F
	db 25, PARASECT
	db 25, KANGASKHAN
	db 28, SCYTHER
ENDC
IF DEF(_GREEN)
	db 24, NIDORAN_M
	db 26, DODUO
	db 22, PARAS
	db 25, EXEGGCUTE
	db 33, NIDORINO
	db 23, EXEGGCUTE
	db 24, NIDORAN_F
	db 25, PARASECT
	db 25, LICKITUNG
	db 28, SCYTHER
ENDC
IF DEF(_BLUE)
	db 24, NIDORAN_F
	db 26, DODUO
	db 22, PARAS
	db 25, EXEGGCUTE
	db 33, NIDORINA
	db 23, EXEGGCUTE
	db 24, NIDORAN_M
	db 25, PARASECT
	db 25, KANGASKHAN
	db 28, PINSIR
ENDC

	db 0 ; water encounter rate
