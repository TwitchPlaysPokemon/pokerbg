Route11Mons:
	db 15 ; grass encounter rate
IF DEF(_RED)
	db 14, EKANS
	db 15, SPEAROW
	db 12, EKANS
	db  9, DROWZEE
	db 13, SPEAROW
	db 13, DROWZEE
	db 15, EKANS
	db 17, SPEAROW
	db 11, DROWZEE
	db 15, DROWZEE
ENDC
IF DEF(_GREEN) || DEF(_BLUE)
	db 14, SANDSHREW
	db 15, SPEAROW
	db 12, SANDSHREW
	db  9, DROWZEE
	db 13, SPEAROW
	db 13, DROWZEE
	db 15, SANDSHREW
	db 17, SPEAROW
	db 11, DROWZEE
	db 15, DROWZEE
ENDC

	db 0 ; water encounter rate
