DungeonMonsB1:
	db 25 ; grass encounter rate
IF DEF(_RED)
	db 55, RHYDON
	db 55, MAROWAK
	db 55, ELECTRODE
	db 64, CHANSEY
	db 64, PARASECT
	db 64, RAICHU
	db 57, ARBOK
	db 65, DITTO
	db 63, DITTO
	db 67, DITTO
ENDC
IF DEF(_GREEN)
	db 55, RHYDON
	db 55, MAROWAK
	db 55, ELECTRODE
	db 64, CLEFAIRY ; ???
	db 64, PARASECT
	db 64, RAICHU
	db 57, SANDSLASH
	db 65, DITTO
	db 63, DITTO
	db 67, DITTO
ENDC
IF DEF(_BLUE)
	db 55, RHYDON
	db 55, MAROWAK
	db 55, ELECTRODE
	db 64, CHANSEY
	db 64, PARASECT
	db 64, RAICHU
	db 57, SANDSLASH
	db 65, DITTO
	db 63, DITTO
	db 67, DITTO
ENDC

	db 0 ; water encounter rate
