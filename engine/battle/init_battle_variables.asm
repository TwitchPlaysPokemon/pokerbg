InitBattleVariables:
	ldh a, [hTileAnimations]
	ld [wSavedTileAnimations], a
	xor a
	ld [wActionResultOrTookBattleTurn], a
	ld hl, wPartyAndBillsPCSavedMenuItem
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wListScrollOffset], a
	ld [wCriticalHitOrOHKO], a
	ld [wBattleMonSpecies], a
	ld [wPartyGainExpFlags], a
	ld [wPlayerMonNumber], a
	ld [wEscapedFromBattle], a
	ld [wMapPalOffset], a
	ld hl, wPlayerHPBarColor
	ld [hli], a ; wPlayerHPBarColor
	ld [hl], a ; wEnemyHPBarColor
	ld hl, wCanEvolveFlags
	ld b, $3c
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	inc a ; POUND
	ld [wTestBattlePlayerSelectedMove], a
	ld a, [wCurMap]
	cp SAFARI_ZONE_EAST
	jr c, .notSafariBattle
	cp SAFARI_ZONE_CENTER_REST_HOUSE
	jr nc, .notSafariBattle
	ld a, BATTLE_TYPE_SAFARI
	ld [wBattleType], a
.notSafariBattle
	; init wBattleResult to 2 (draw) instead of 0 (win)
	; this prevents PokeDolls from bypassing ghosts
	ld a, 2
	ld [wBattleResult], a
	jpfar PlayBattleMusic
