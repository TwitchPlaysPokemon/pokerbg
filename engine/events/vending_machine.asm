VendingMachineMenu::
	call VendingMachine_CheckForSoftlock
	jp nz, .freebie
	ld hl, VendingMachineText1
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, 3
	ld [wMaxMenuItem], a
	ld a, 5
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
	ld hl, wd730
	set 6, [hl]
	hlcoord 0, 3
	ld b, 8
	ld c, 12
	call TextBoxBorder
	call UpdateSprites
	hlcoord 2, 5
	ld de, DrinkText
	call PlaceString
	hlcoord 9, 6
	ld de, DrinkPriceText
	call PlaceString
	ld hl, wd730
	res 6, [hl]
	call HandleMenuInput
	bit 1, a ; pressed B?
	jr nz, .notThirsty
	ld a, [wCurrentMenuItem]
	cp 3 ; chose Cancel?
	jr z, .notThirsty
	xor a
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $2
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, VendingMachineText4
	jp PrintText
.enoughMoney
	call LoadVendingMachineItem
	ldh a, [hVendingMachineItem]
	ld b, a
	ld c, 1
	call GiveItem
	jr nc, .BagFull

	ld b, 60 ; number of times to play the "brrrrr" sound
.playDeliverySound
	ld c, 2
	call DelayFrames
	push bc
	ld a, SFX_PUSH_BOULDER
	call PlaySound
	pop bc
	dec b
	jr nz, .playDeliverySound

	ld hl, VendingMachineText5
	call PrintText
	ld hl, hVendingMachinePrice + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	jp DisplayTextBoxID
.BagFull
	ld hl, VendingMachineText6
	jp PrintText
.notThirsty
	ld hl, VendingMachineText7
	jp PrintText
.freebie
	ld hl, VendingMachineText8
	call PrintText
	ld c, -1
	xor a
	ld [wCurrentMenuItem], a
	jp .enoughMoney

VendingMachineText1:
	text_far _VendingMachineText1
	text_end

DrinkText:
	db   "FRESH WATER"
	next "SODA POP"
	next "LEMONADE"
	next "CANCEL@"

DrinkPriceText:
	db   "¥200"
	next "¥300"
	next "¥350"
	next "@"

VendingMachineText4:
	text_far _VendingMachineText4
	text_end

VendingMachineText5:
	text_far _VendingMachineText5
	text_end

VendingMachineText6:
	text_far _VendingMachineText6
	text_end

VendingMachineText7:
	text_far _VendingMachineText7
	text_end

VendingMachineText8:
	text_far _VendingMachineText8
	text_end

LoadVendingMachineItem:
	ld hl, VendingPrices
	ld a, [wCurrentMenuItem]
	add a
	add a
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]
	ldh [hVendingMachineItem], a
	inc c ; if c was -1, it's free
	jr z, .free
	ld a, [hli]
	ldh [hVendingMachinePrice], a
	ld a, [hli]
	ldh [hVendingMachinePrice + 1], a
	ld a, [hl]
	ldh [hVendingMachinePrice + 2], a
	ret
.free
	xor a
	ldh [hVendingMachinePrice], a
	ldh [hVendingMachinePrice + 1], a
	ldh [hVendingMachinePrice + 2], a
	ret

INCLUDE "data/items/vending_prices.asm"
	db 0

VendingMachine_CheckForSoftlock:
	; z: no softlock
	; nz: probable softlock

	ld hl, wd728
	bit 6, [hl] ; gave guards a drink already
	jr nz, .noSoftlock
	ld hl, wObtainedBadges
	bit BIT_CASCADEBADGE, [hl]
	ret z  ; no softlock
	bit BIT_THUNDERBADGE, [hl]
	ret z  ; no softlock
	bit BIT_RAINBOWBADGE, [hl]
	ret z  ; no softlock
	bit BIT_SOULBADGE, [hl]
	ret z  ; no softlock
	bit BIT_VOLCANOBADGE, [hl]
	ret z  ; no softlock
	call VendingMachines_HasDrinkInBag
	jr nz, .noSoftlock ; has a drink in the bag
	call VendingMachines_HasDrinkInBox
	jr nz, .noSoftlock ; has a drink in the PC
	xor a
	ldh [hMoney], a
	ld a, $02
	ldh [hMoney + 1], a
	ld a, $00
	ldh [hMoney + 2], a
	call HasEnoughMoney
	jr nc, .noSoftlock
	ld a, 1
	and a
	ret
.noSoftlock
	xor a
	ret

VendingMachines_HasDrinkInBag:
	ld hl, VendingPrices
.loop
	ld a, [hli]
	and a
	ret z ; out of drinks to look for
	inc hl ; skip price
	inc hl ; skip price
	inc hl ; skip price
	push hl
	ld [wd11e], a
	ld b, a
	predef GetQuantityOfItemInBag
	pop hl
	ld a, b
	and a
	jr z, .loop ; if the item isn't in the bag
	ret

VendingMachines_HasDrinkInBox:
	ld hl, VendingPrices
.loop
	ld a, [hli]
	and a
	ret z ; out of drinks to look for
	inc hl ; skip price
	inc hl ; skip price
	inc hl ; skip price
	push hl
	ld [wd11e], a
	ld b, a
	predef GetQuantityOfItemInBox
	pop hl
	ld a, b
	and a
	jr z, .loop ; if the item isn't in the box
	ret