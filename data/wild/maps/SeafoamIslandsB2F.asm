IslandMonsB2:
	db 10 ; grass encounter rate
IF DEF(_RED)
	db 30, SEEL
	db 30, SLOWPOKE
	db 32, SEEL
	db 32, SLOWPOKE
	db 28, HORSEA
	db 30, STARYU
	db 30, HORSEA
	db 28, SHELLDER
	db 30, GOLBAT
	db 37, SLOWBRO
ENDC
IF DEF(_GREEN)
	db 30, SEEL
	db 30, HORSEA
	db 32, SEEL
	db 32, HORSEA
	db 28, KRABBY
	db 30, SHELLDER
	db 30, KRABBY
	db 28, STARYU
	db 30, GOLBAT
	db 37, JYNX
ENDC
IF DEF(_BLUE)
	db 30, SEEL
	db 30, PSYDUCK
	db 32, SEEL
	db 32, PSYDUCK
	db 28, KRABBY
	db 30, SHELLDER
	db 30, KRABBY
	db 28, STARYU
	db 30, GOLBAT
	db 37, GOLDUCK
ENDC

	db 0 ; water encounter rate
