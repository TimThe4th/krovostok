/obj/item/clothing/accessory/cloak/boh
	desc = "A simple, yet fancy cloak."
	icon = 'maps/torch/icons/obj/obj_cloak_boh.dmi'
	icon_override = 'maps/torch/icons/mob/onmob_cloak_boh.dmi'
	accessory_icons = list(slot_tie_str = 'maps/torch/icons/mob/onmob_cloak_boh.dmi', slot_w_uniform_str = 'maps/torch/icons/mob/onmob_cloak_boh.dmi', slot_wear_suit_str = 'maps/torch/icons/mob/onmob_cloak_boh.dmi')

/obj/item/clothing/accessory/cloak/boh/dress
	name = "boatcloak"
	desc = "A fancy SGF boatcloak with silver ribbon."
	icon_state = "boatcloak"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/accessory/cloak/boh/dress/command
	name = "command boatcloak"
	desc = "A fancy SGF boatcloak with golden ribbon."
	icon_state = "boatcloak_com"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/accessory/cloak/boh/command
	name = "command cloak"
	desc = "A white SGF dress cloak with gold details."
	icon_state = "cloak_com"

/obj/item/clothing/accessory/cloak/boh/command/support
	name = "command support cloak"

/obj/item/clothing/accessory/cloak/boh/engineering
	name = "engineering cloak"
	desc = "A white SGF dress cloak with orange details."
	icon_state = "cloak_eng"

/obj/item/clothing/accessory/cloak/boh/explorer
	name = "explorer cloak"
	desc = "A white SGF dress cloak with purple details."
	icon_state = "cloak_exp"

/obj/item/clothing/accessory/cloak/boh/explorer/science
	name = "researcher cloak"

/obj/item/clothing/accessory/cloak/boh/medical
	name = "medical cloak"
	desc = "A white SGF dress cloak with light-blue details."
	icon_state = "cloak_med"

/obj/item/clothing/accessory/cloak/boh/security
	name = "security cloak"
	desc = "A white SGF dress cloak with red details."
	icon_state = "cloak_sec"

/obj/item/clothing/accessory/cloak/boh/service
	name = "service cloak"
	desc = "A white SGF dress cloak with green details."
	icon_state = "cloak_service"

/obj/item/clothing/accessory/cloak/boh/supply
	name = "supply cloak"
	desc = "A white SGF dress cloak with brown details."
	icon_state = "cloak_supply"

// Map-wise Modular Override to include ACCESSORY_SLOT_OVER
/obj/item/clothing/suit/storage/solgov/service
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND,ACCESSORY_SLOT_MEDAL,ACCESSORY_SLOT_INSIGNIA,ACCESSORY_SLOT_RANK,ACCESSORY_SLOT_DEPT)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMBAND)

/obj/item/clothing/suit/storage/solgov/dress
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL,ACCESSORY_SLOT_RANK, ACCESSORY_SLOT_INSIGNIA)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMBAND)

/obj/item/clothing/suit/dress/solgov
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL,ACCESSORY_SLOT_RANK)

/obj/item/clothing/suit/storage/hooded/wintercoat/solgov
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA,ACCESSORY_SLOT_RANK)

/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA,ACCESSORY_SLOT_RANK)

/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/fleet
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA,ACCESSORY_SLOT_RANK)

/obj/item/clothing/suit/dress/terran
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL,ACCESSORY_SLOT_RANK)

/obj/item/rig/military/infantry
	name = "heavy suit control module"
	desc = "A heavy, incredibly sleek suit of military grade armor. \
	The ablative coating and composite armor makes it seem incredibly sturdy."
//	req_access = list(access_marines)
	suit_type = "military hardsuit"
	icon_state = "military_rig"
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RIFLE,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
		)

	allowed = list(/obj/item/device/flashlight, /obj/item/tank,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/handcuffs,/obj/item/device/t_scanner, /obj/item/rcd, /obj/item/crowbar, \
	/obj/item/screwdriver, /obj/item/weldingtool, /obj/item/wirecutters, /obj/item/wrench, /obj/item/device/multitool, \
	/obj/item/device/radio, /obj/item/device/scanner/gas,/obj/item/storage/briefcase/inflatable, /obj/item/melee/baton, /obj/item/gun, \
	/obj/item/storage/firstaid, /obj/item/reagent_containers/hypospray, /obj/item/roller, /obj/item/device/suit_cooling_unit, /obj/item/storage/)

	initial_modules = list(
		/obj/item/rig_module/cooling_unit,
		/obj/item/rig_module/maneuvering_jets
	)

//Psionic Advisor

// /decl/hierarchy/outfit/job/torch/crew/command/psiadvisor
//	name = OUTFIT_JOB_NAME("Foundation Advisor")
//	uniform = /obj/item/clothing/under/det/grey
//	suit = /obj/item/clothing/suit/storage/toggle/labcoat/foundation
//	gloves = /obj/item/clothing/gloves/white
//	shoes = /obj/item/clothing/shoes/dress
//	pda_type = /obj/item/modular_computer/pda/heads
//	id_type = /obj/item/card/id/torch/crew/psiadvisor
//	l_hand =   /obj/item/storage/briefcase/foundation
//	holster =  /obj/item/clothing/accessory/storage/holster/waist

// /decl/hierarchy/outfit/job/torch/crew/command/psiadvisor/nt
//	name = OUTFIT_JOB_NAME("NTPC Agent")
//	glasses = /obj/item/clothing/glasses/sunglasses
//	suit = /obj/item/clothing/suit/storage/toggle/suit/black/agent
//	gloves = /obj/item/clothing/ring/material/nullglass
//	shoes = /obj/item/clothing/shoes/dutyboots
//	l_hand =   /obj/item/storage/briefcase/foundation/nt
//	holster =  /obj/item/clothing/accessory/storage/holster/armpit
