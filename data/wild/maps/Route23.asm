Route23Mons:
	db 10 ; grass encounter rate
IF DEF(_RED)
	db 26, EKANS
	db 33, DITTO
	db 26, SPEAROW
	db 38, FEAROW
	db 38, DITTO
	db 38, FEAROW
	db 41, ARBOK
	db 43, DITTO
	db 41, FEAROW
	db 43, FEAROW
ENDC
IF DEF(_GREEN) || DEF(_BLUE)
	db 26, SANDSHREW
	db 33, DITTO
	db 26, SPEAROW
	db 38, FEAROW
	db 38, DITTO
	db 38, FEAROW
	db 41, SANDSLASH
	db 43, DITTO
	db 41, FEAROW
	db 43, FEAROW
ENDC

	db 0 ; water encounter rate
