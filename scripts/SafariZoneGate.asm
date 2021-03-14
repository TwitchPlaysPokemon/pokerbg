SafariZoneGate_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SafariZoneGate_ScriptPointers
	ld a, [wSafariZoneGateCurScript]
	jp CallFunctionInTable

SafariZoneGate_ScriptPointers:
	dw .SafariZoneEntranceScript0
	dw .SafariZoneEntranceScript1
	dw .SafariZoneEntranceScript2
	dw .SafariZoneEntranceScript3
	dw .SafariZoneEntranceScript4
	dw .SafariZoneEntranceScript5
	dw .SafariZoneEntranceScript6

.SafariZoneEntranceScript0
	; Catch players trying to leave Safari Zone after reloading a save
	CheckEvent EVENT_IN_SAFARI_ZONE
	jr nz, .SafariZoneEntranceScript3

	ld hl, .CoordsData_75221
	call ArePlayerCoordsInArray
	ret nc
	ld a, $3
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $ff
	ld [wJoyIgnore], a
	xor a
	ldh [hJoyHeld], a
	ld a, SPRITE_FACING_RIGHT
	ld [wSpritePlayerStateData1FacingDirection], a
	ld a, [wCoordIndex]
	cp $1
	jr z, .asm_7520f
	ld a, $2
	ld [wSafariZoneGateCurScript], a
	ret
.asm_7520f
	ld a, D_RIGHT
	ld c, $1
	call SafariZoneEntranceAutoWalk
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $1
	ld [wSafariZoneGateCurScript], a
	ret

.CoordsData_75221:
	dbmapcoord  3,  2
	dbmapcoord  4,  2
	db -1 ; end

.SafariZoneEntranceScript1
	call SafariZoneEntranceScript_752b4
	ret nz
.SafariZoneEntranceScript2
	xor a
	ldh [hJoyHeld], a
	ld [wJoyIgnore], a
	call UpdateSprites
	ld a, $4
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $ff
	ld [wJoyIgnore], a
	ret

.SafariZoneEntranceScript3
	call SafariZoneEntranceScript_752b4
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $5
	ld [wSafariZoneGateCurScript], a
	ret

.SafariZoneEntranceScript5
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	CheckAndResetEvent EVENT_SAFARI_GAME_OVER
	jr z, .asm_7527f
	ResetEventReuseHL EVENT_IN_SAFARI_ZONE
	call UpdateSprites
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $6
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wNumSafariBalls], a
	ld a, D_DOWN
	ld c, $3
	call SafariZoneEntranceAutoWalk
	ld a, $4
	ld [wSafariZoneGateCurScript], a
	jr .asm_75286
.asm_7527f
	ld a, $5
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
.asm_75286
	ret

.SafariZoneEntranceScript4
	call SafariZoneEntranceScript_752b4
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [wSafariZoneGateCurScript], a
	ret

.SafariZoneEntranceScript6
	call SafariZoneEntranceScript_752b4
	ret nz
	call Delay3
	ld a, [wcf0d]
	ld [wSafariZoneGateCurScript], a
	ret

SafariZoneEntranceAutoWalk:
	push af
	ld b, 0
	ld a, c
	ld [wSimulatedJoypadStatesIndex], a
	ld hl, wSimulatedJoypadStatesEnd
	pop af
	call FillMemory
	jp StartSimulatingJoypadStates

SafariZoneEntranceScript_752b4:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret

SafariZoneGate_TextPointers:
	dw .SafariZoneEntranceText1
	dw .SafariZoneEntranceText2
	dw .SafariZoneEntranceText1
	dw .SafariZoneEntranceText4
	dw .SafariZoneEntranceText5
	dw .SafariZoneEntranceText6

.SafariZoneEntranceText1
	text_far _SafariZoneEntranceText1
	text_end

.SafariZoneEntranceText4
	text_far SafariZoneEntranceText_9e6e4
	text_asm
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .PleaseComeAgain

	ld hl, wPlayerMoney
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	jr nz, .HasPositiveBalance
	call SafariZoneEntranceGetLowCostAdmissionText
	jr c, .CantPayWalkDown
	jr .PoorMansDiscount

.HasPositiveBalance
	xor a
	ldh [hMoney], a
	ld a, $05
	ldh [hMoney + 1], a
	ld a, $00
	ldh [hMoney + 2], a
	call HasEnoughMoney
	jr nc, .success
	ld hl, .NotEnoughMoneyText
	call PrintText
	call SafariZoneEntranceCalculateLowCostAdmission
	jr c, .CantPayWalkDown
	jr .PoorMansDiscount

.success
	xor a
	ld [wPriceTemp], a
	ld a, $05
	ld [wPriceTemp + 1], a
	ld a, $00
	ld [wPriceTemp + 2], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, 3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, .MakePaymentText
	call PrintText
	ld a, 30
.PoorMansDiscount
	ld [wNumSafariBalls], a
	ld a, HIGH(SAFARI_ZONE_STEPS + 2)
	ld [wSafariSteps], a
	ld a, LOW(SAFARI_ZONE_STEPS + 2)
	ld [wSafariSteps + 1], a
	ld a, D_UP
	ld c, 3
	call SafariZoneEntranceAutoWalk
	SetEvent EVENT_IN_SAFARI_ZONE
	ResetEventReuseHL EVENT_SAFARI_GAME_OVER
	ld a, 3
	ld [wSafariZoneGateCurScript], a
	jr .done

.PleaseComeAgain
	ld hl, .PleaseComeAgainText
	call PrintText
.CantPayWalkDown
	ld a, D_DOWN
	ld c, 1
	call SafariZoneEntranceAutoWalk
	ld a, 4
	ld [wSafariZoneGateCurScript], a
	; Clear Safari Zone events in case players try to escape
	ResetEvents EVENT_SAFARI_GAME_OVER, EVENT_IN_SAFARI_ZONE
.done
	jp TextScriptEnd

.MakePaymentText
	text_far SafariZoneEntranceText_9e747
	sound_get_item_1
	text_far _SafariZoneEntranceText_75360
	text_end

.PleaseComeAgainText
	text_far _SafariZoneEntranceText_75365
	text_end

.NotEnoughMoneyText
	text_far _SafariZoneEntranceText_7536a
	text_end

.SafariZoneEntranceText5
	text_far SafariZoneEntranceText_9e814
	text_asm
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_7539c
	ld hl, .SafariZoneEntranceText_753bb
	call PrintText
	xor a
	ld [wSpritePlayerStateData1FacingDirection], a
	ld a, D_DOWN
	ld c, $3
	call SafariZoneEntranceAutoWalk
	ResetEvents EVENT_SAFARI_GAME_OVER, EVENT_IN_SAFARI_ZONE
	ld a, $0
	ld [wcf0d], a
	jr .asm_753b3
.asm_7539c
	ld hl, .SafariZoneEntranceText_753c0
	call PrintText
	ld a, SPRITE_FACING_UP
	ld [wSpritePlayerStateData1FacingDirection], a
	ld a, D_UP
	ld c, $1
	call SafariZoneEntranceAutoWalk
	ld a, $5
	ld [wcf0d], a
.asm_753b3
	ld a, $6
	ld [wSafariZoneGateCurScript], a
	jp TextScriptEnd

.SafariZoneEntranceText_753bb
	text_far _SafariZoneEntranceText_753bb
	text_end

.SafariZoneEntranceText_753c0
	text_far _SafariZoneEntranceText_753c0
	text_end

.SafariZoneEntranceText6
	text_far _SafariZoneEntranceText_753c5
	text_end

.SafariZoneEntranceText2
	text_asm
	ld hl, .FirstTimeQuestionText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .RegularText
	jr nz, .Explanation
	ld hl, .ExplanationText
.Explanation
	call PrintText
	jp TextScriptEnd

.FirstTimeQuestionText
	text_far _SafariZoneEntranceText_753e6
	text_end

.ExplanationText
	text_far _SafariZoneEntranceText_753eb
	text_end

.RegularText
	text_far _SafariZoneEntranceText_753f0
	text_end

SafariZoneEntranceCalculateLowCostAdmission:
	ld hl, wPlayerMoney
	ld de, hMoney
	ld bc, $3
	call CopyData
	xor a
	ldh [hDivideBCDDivisor], a
	ldh [hDivideBCDDivisor + 1], a
	ld a, $17
	ldh [hDivideBCDDivisor + 2], a
	predef DivideBCDPredef3
	ldh a, [hDivideBCDQuotient + 2]
	call SafariZoneEntranceConvertBCDtoNumber
	push af
	ld hl, wPlayerMoney
	xor a
	ld bc, $3
	call FillMemory
	ld hl, SafariZoneEntranceText_f20c4
	call PrintText_NoCreatingTextBox
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, SafariZoneEntranceText_f20c9
	call PrintText
	pop af
	inc a
	jr z, .max_balls
	cp 29
	jr c, .load_balls
.max_balls
	ld a, 29
.load_balls
	ld hl, 502
	and a
	ret

SafariZoneEntranceText_f20c4:
	text_far _SafariZoneLowCostText1
	text_end

SafariZoneEntranceText_f20c9:
	text_far _SafariZoneLowCostText2
	text_end

SafariZoneEntranceGetLowCostAdmissionText:
	ld hl, wSafariSteps
	ld a, [hl]
	push af
	inc [hl]
	ld e, a
	ld d, $0
	ld hl, BegForEntry
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	pop af
	cp $3
	jr z, .give_one_ball
	scf
	ret

.give_one_ball
	ld hl, SafariZoneEntranceText_f20f6
	call PrintText_NoCreatingTextBox
	ld a, $1
	ld hl, 502
	and a
	ret

SafariZoneEntranceText_f20f6:
	text_far _SafariZoneLowCostText3
	sound_get_item_1
	text_far _SafariZoneLowCostText4
	text_end


BegForEntry:
	dw SafariZoneEntranceText_f210a
	dw SafariZoneEntranceText_f210f
	dw SafariZoneEntranceText_f2114
	dw SafariZoneEntranceText_f2119
	dw SafariZoneEntranceText_f2119

SafariZoneEntranceText_f210a:
	text_far _SafariZoneLowCostText5
	text_end

SafariZoneEntranceText_f210f:
	text_far _SafariZoneLowCostText6
	text_end

SafariZoneEntranceText_f2114:
	text_far _SafariZoneLowCostText7
	text_end

SafariZoneEntranceText_f2119:
	text_far _SafariZoneLowCostText8
	text_end

SafariZoneEntranceConvertBCDtoNumber:
	push hl
	ld c, a
	and $f
	ld l, a
	ld h, $0
	ld a, c
	and $f0
	swap a
	ld bc, 10
	call AddNTimes
	ld a, l
	pop hl
	ret
