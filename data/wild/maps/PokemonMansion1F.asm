MansionMons1:
	db 10 ; grass encounter rate
IF DEF(_RED)
	db 32, KOFFING
	db 30, KOFFING
	db 34, PONYTA
	db 30, PONYTA
	db 34, GROWLITHE
	db 32, PONYTA
	db 30, GRIMER
	db 28, PONYTA
	db 37, WEEZING
	db 39, MUK
ENDC
IF DEF(_GREEN)
	db 32, GRIMER
	db 30, GRIMER
	db 34, PONYTA
	db 30, PONYTA
	db 34, GROWLITHE
	db 32, PONYTA
	db 30, KOFFING
	db 28, PONYTA
	db 37, MUK
	db 39, WEEZING
ENDC
IF DEF(_BLUE)
	db 32, GRIMER
	db 30, GRIMER
	db 34, PONYTA
	db 30, PONYTA
	db 34, VULPIX
	db 32, PONYTA
	db 30, KOFFING
	db 28, PONYTA
	db 37, MUK
	db 39, WEEZING
ENDC

	db 0 ; water encounter rate
