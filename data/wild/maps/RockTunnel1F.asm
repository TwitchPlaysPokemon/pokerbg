TunnelMonsB1:
	db 15 ; grass encounter rate
	db 16, ZUBAT
	db 17, ZUBAT
	db 17, GEODUDE
	db 15, MACHOP
	db 16, GEODUDE
IF DEF(_RED) || DEF(_BLUE)
	db 18, ZUBAT
ENDC
IF DEF(_GREEN)
	db 18, DITTO
ENDC
	db 15, ZUBAT
	db 17, MACHOP
	db 13, ONIX
	db 15, ONIX

	db 0 ; water encounter rate
