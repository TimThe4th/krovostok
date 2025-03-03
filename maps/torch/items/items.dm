/*******************
Random item spawning
*******************/

/obj/random/solgov
	name = "random solgov equipment"
	desc = "This is a random piece of solgov equipment or clothing."
	icon = 'maps/torch/icons/obj/obj_head_solgov.dmi'
	icon_state = "solsoft"

/obj/random/solgov/spawn_choices()
	return list(/obj/item/clothing/head/solgov/utility/fleet = 4,
				/obj/item/clothing/head/soft/solgov/expedition = 2,
				/obj/item/clothing/head/soft/solgov/fleet = 4,
				/obj/item/clothing/head/helmet/solgov = 1,
				/obj/item/clothing/suit/storage/vest/solgov = 2,
				/obj/item/clothing/under/solgov/utility = 5,
				/obj/item/clothing/under/solgov/utility/fleet = 3,
				/obj/item/clothing/under/solgov/pt/expeditionary = 4,
				/obj/item/clothing/under/solgov/pt/fleet = 4
				)

/obj/random/maintenance/solgov
	name = "random maintenance item"
	desc = "This is a random maintenance item."
	icon = 'icons/obj/items.dmi'
	icon_state = "gift1"

	spawn_nothing_percentage = 20

/obj/random/maintenance/solgov/spawn_choices()
	return list(/obj/random/junk = 4,
				/obj/random/trash = 4,
				/obj/random/maintenance/solgov/clean = 5)

/obj/random/maintenance/solgov/clean
	name = "random maintenance item"
	desc = "This is a random maintenance item."
	icon = 'icons/obj/items.dmi'
	icon_state = "gift2"

/obj/random/maintenance/solgov/clean/spawn_choices()
	return list(/obj/random/solgov = 3,
				/obj/random/maintenance/clean = 800)

/*******************
Torch specific items
*******************/

/obj/item/modular_computer/pda/explorer
	icon_state = "pda-exp"
	icon_state_unpowered = "pda-exp"

/obj/item/modular_computer/pda/heads/hop
	stored_pen = /obj/item/pen/multi/cmd/xo

/obj/item/modular_computer/pda/captain
	stored_pen = /obj/item/pen/multi/cmd/co

/obj/item/storage/backpack/explorer
	name = "explorer backpack"
	desc = "A rugged backpack."
	icon_state = "exppack"

/obj/item/storage/backpack/satchel/explorer
	name = "explorer satchel"
	desc = "A rugged satchel for field work."
	icon_state = "satchel-exp"

/obj/item/storage/backpack/messenger/explorer
	name = "explorer messenger bag"
	desc = "A rugged backpack worn over one shoulder."
	icon_state = "courierbagexp"

/***********
Unique items
***********/

/obj/item/pen/multi/cmd/xo
	name = "first officer's pen"
	icon = 'maps/torch/icons/obj/uniques.dmi'
	icon_state = "pen_xo"
	desc = "A slightly bulky pen with a silvery case. Twisting the top allows you to switch the nib for different colors."

/obj/item/pen/multi/cmd/co
	name = "commanding officer's pen"
	icon = 'maps/torch/icons/obj/uniques.dmi'
	icon_state = "pen_co"
	desc = "A slightly bulky pen with a golden case. Twisting the top allows you to switch the nib for different colors."

/obj/item/pen/multi/cmd/attack_self(mob/user)
	if(++selectedColor > 3)
		selectedColor = 1
	colour = colors[selectedColor]
	to_chat(user, "<span class='notice'>Changed color to '[colour].'</span>")

/obj/item/storage/fakebook
	name = "Workplace Crisis Management"
	desc = "Also known as 'I fucked up, what do?'. A very popular book amongst corporate management."
	icon = 'icons/obj/library.dmi'
	icon_state = "booknanoregs"
	attack_verb = list("bashed", "whacked", "educated")
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = 4
	startswith = list(
			/obj/item/reagent_containers/pill/cyanide,
			/obj/item/paper/liason_note,
			/obj/item/gun/projectile/pistol/holdout/liaison
	)

/******
Weapons
******/

/obj/item/gun/energy/gun/secure/corporate
	desc = "An access-locked EXO-branded LAEP90-S. It's designed to please paranoid corporate liaisons. Body cam not included."
	req_access = list(access_liaison)

/obj/item/gun/projectile/revolver/medium/captain
	name = "\improper Final Argument"
	icon = 'maps/torch/icons/obj/uniques.dmi'
	icon_state = "mosley"
	desc = "A shiny al-Maliki & Mosley Autococker automatic revolver, with black accents. Marketed as the 'Revolver for the Modern Era'. This one has 'To the Captain of the LRS Antares' engraved."
	fire_delay = 5.7 //Autorevolver. Also synced with the animation
	fire_anim = "mosley_fire"
	fire_sound = 'sound/weapons/gunshot/revolver_strong.ogg'
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2)
	starts_loaded = 0 //Nobody keeps ballistic weapons loaded

/obj/item/gun/energy/stunrevolver/secure/nanotrasen
	name = "corporate stun revolver"
	desc = "This A&M X6 is fitted with an NT1019 chip which allows remote authorization of weapon functionality. It has a NanoTrasen logo on the grip."
	req_access = list(list(access_brig, access_heads, access_rd, access_petrov_security))

/obj/item/gun/projectile/pistol/holdout/liaison
	magazine_type = /obj/item/ammo_magazine/pistol/small/oneway

/obj/item/ammo_magazine/pistol/small/oneway
	initial_ammo = 1

/obj/effect/paint/expeditionary
	color = "#68099e"

//batong
/obj/item/melee/darkrp_baton
	name = "magical stunbaton"
	desc = "Citizens aren't supposed to have guns."
	icon_state = "stunbaton"
	item_state = "baton"
	color = COLOR_RED
	slot_flags = SLOT_BELT
	force = 1
	sharp = 0
	edge = 0
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("arrested")
	base_parry_chance = 100


/obj/item/melee/darkrp_baton/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)

	if(target == user)
		return FALSE

	if(!istype(target)) //Not sure if needed? Just in case.
		return ..()

	var/list/valid_areas = list()
	var/list/possible_areas = get_area_turfs(/area/security/processing)
	for(var/turf/simulated/floor/F in possible_areas)
		if(!F.is_floor())
			continue
		valid_areas += F

	if(length(valid_areas))
		do_teleport(target,pick(valid_areas))
		playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
		msg_admin_attack("[key_name(user)] arrested [key_name(target)] with the [src].")
		to_world("<span><font face='Arial Black, Arial, sans-serif'>\The [target.name] has been arrested for 120 seconds!</font></span>")
		return TRUE

	return FALSE
