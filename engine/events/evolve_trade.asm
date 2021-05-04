EvolveTradeMon:
; Verify the TradeMon's species name before
; attempting to initiate a trade evolution.

; The names of the trade evolutions in Blue (JP)
; are checked. In that version, TradeMons that
; can evolve are Graveler and Haunter.

; This is a puzzling way of doing it, especially
; since wInGameTradeReceiveMonSpecies exists.

; Yellow checks wInGameTradeReceiveMonSpecies against
; the species ids for Graveler, Haunter, Kadabra, and Machoke,
; a far better solution.

	ld a, [wInGameTradeReceiveMonName]

	; GRAVELER
	cp "G"
	jr z, .ok

	; HAUNTER
	cp "H"
	ret nz
	ld a, [wInGameTradeReceiveMonName + 1]
	cp "A" ; This is unnecessary, as HAUNTER is the only H trade mon
	ret nz ; but the original check was for SP to exclude SEEL and SLOWPOKE

.ok
	ld a, [wPartyCount]
	dec a
	ld [wWhichPokemon], a
	ld a, $1
	ld [wForceEvolution], a
	ld a, LINK_STATE_TRADING
	ld [wLinkState], a
	callfar TryEvolvingMon
	xor a ; LINK_STATE_NONE
	ld [wLinkState], a
	jp PlayDefaultMusic
