IslandMonsB4:
	db 10 ; grass encounter rate
IF DEF(_RED)
	db 31, HORSEA
	db 31, SHELLDER
	db 33, HORSEA
	db 33, SHELLDER
	db 29, SLOWPOKE
	db 31, SEEL
	db 31, SLOWPOKE
	db 29, SEEL
	db 39, SLOWBRO
	db 32, GOLBAT
ENDC
IF DEF(_GREEN)
	db 31, KRABBY
	db 31, STARYU
	db 33, KRABBY
	db 33, STARYU
	db 29, HORSEA
	db 31, SEEL
	db 31, HORSEA
	db 29, SEEL
	db 39, JYNX
	db 32, GOLBAT
ENDC
IF DEF(_BLUE)
	db 31, KRABBY
	db 31, STARYU
	db 33, KRABBY
	db 33, STARYU
	db 29, PSYDUCK
	db 31, SEEL
	db 31, PSYDUCK
	db 29, SEEL
	db 39, GOLDUCK
	db 32, GOLBAT
ENDC

	db 0 ; water encounter rate
