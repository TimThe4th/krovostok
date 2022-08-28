/obj/item/clothing/accessory/arm_guards/sarov
	name = "arm guards"
	desc = "A pair of arm pads reinforced with armor plating. Attaches to a plate carrier."
	icon_override = 'customs/icons/mob/custom_items_mob.dmi'
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	accessory_icons = list(
		slot_tie_str = 'customs/icons/mob/custom_items_mob.dmi',
		slot_wear_suit_str = 'customs/icons/mob/custom_items_mob.dmi'
	)
	icon_state = "torcharms"


/obj/item/clothing/accessory/leg_guards/sarov
	name = "leg guards"
	desc = "A pair of armored leg pads. Attaches to a plate carrier."
	icon_override = 'customs/icons/mob/custom_items_mob.dmi'
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	accessory_icons = list(
		slot_tie_str = 'customs/icons/mob/custom_items_mob.dmi',
		slot_wear_suit_str = 'customs/icons/mob/custom_items_mob.dmi'
	)
	icon_state = "torchlegs"

/obj/item/clothing/head/helmet/sarov
	name = "corporate helmet"
	desc = "An old tactical helmet. The symbolism of a Red Snake is depicted on the back of the head, and the color of the helmet itself is white."
	icon_state = "torchhelmet"
	item_state = "torchhelmet"
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	item_icons = list(slot_head_str = 'customs/icons/mob/custom_items_mob.dmi')

/obj/item/clothing/suit/armor/pcarrier/sarov
	name = "corporate carapace armor"
	desc = "An old set of armor used multiple plates at the same time. On the right shoulder, you can see the symbolism of a Red Snake, and the color of the armor itself is white."
	icon = 'customs/icons/obj/custom_items_obj.dmi'
	item_icons = list(slot_wear_suit_str = 'customs/icons/mob/custom_items_mob.dmi')
	icon_state = "torcharmor"
	accessories = list(/obj/item/clothing/accessory/arm_guards/sarov, /obj/item/clothing/accessory/leg_guards/sarov)

/obj/item/storage/mre/menu11/deluxe //what
	name = "crayon MRE Deluxe"
	meal_desc = " A vacuum-sealed bag containing a day's worth of nutrients for an adult in strenuous situations. There is Donk Co. sign on main picture."