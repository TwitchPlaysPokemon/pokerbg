GetQuantityOfItemInBag:
; In: b = item ID
; Out: b = how many of that item are in the bag
	call GetPredefRegisters
	ld hl, wNumBagItems
	jr GetQuantityOfItem

GetQuantityOfItemInBox:
	; In: b = item ID
	; Out: b = how many of that item are in the PC
		call GetPredefRegisters
		ld hl, wNumBoxItems
	;fallthrough

GetQuantityOfItem:
		inc hl
		ld a, [hli]
		cp $ff
		jr z, .notFound
		cp b
		jr nz, GetQuantityOfItem
		ld a, [hl]
		ld b, a
		ret
	.notFound
		ld b, 0
		ret