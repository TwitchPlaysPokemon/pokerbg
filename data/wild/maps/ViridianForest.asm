ForestMons:
	db 8 ; grass encounter rate
IF DEF(_RED)
	db  4, WEEDLE
	db  5, KAKUNA
	db  3, WEEDLE
	db  5, WEEDLE
	db  4, KAKUNA
	db  6, KAKUNA
	db  4, METAPOD
	db  3, CATERPIE
	db  3, PIKACHU
	db  5, PIKACHU
ENDC
IF DEF(_GREEN) || DEF(_BLUE)
	db  4, CATERPIE
	db  5, METAPOD
	db  3, CATERPIE
	db  5, CATERPIE
	db  4, METAPOD
	db  6, METAPOD
	db  4, KAKUNA
	db  3, WEEDLE
	db  3, PIKACHU
	db  5, PIKACHU
ENDC

	db 0 ; water encounter rate
