/////////
// Marine Sidearms
/////////

/obj/item/gun/projectile/pistol/military/alt/solar
	name = "Mk59"
	desc = "The Jhen Bothus, best known as the standard-issue sidearm for the Lordanian Marine Corps. It's known for severe issues with reliability when not maintained well or used by inexperienced shooters."
	magazine_type = /obj/item/ammo_magazine/pistol/double/pepperball
	fire_sound = 'sound/weapons/gunshot/pistol_mk59.ogg'
	jam_chance = 5 //Cheap firearm. Chance of jamming
	fire_delay = 2 // Fires faster than usual
	damage_mult = 0.9 // Damages a bit less than peers.
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_ESOTERIC = -1) //bandaid fix to prevent r&d from getting free esoterics

/obj/item/gun/projectile/pistol/military/alt/solar/cabinet
	starts_loaded = 0

/obj/item/gun/projectile/pistol/magnum_pistol/solar
	name = "high-powered handgun"
	desc = "The HelTek Magnus, a robust Terran handgun that uses high-caliber ammo."

/obj/item/gun/projectile/pistol/military/alt/solar/loadout
	magazine_type = /obj/item/ammo_magazine/pistol/double

/obj/item/gun/projectile/pistol/magnum_pistol/solar/loaded
	name = "high-powered handgun"
	desc = "The HelTek Magnus, a robust Terran handgun that uses high-caliber ammo. This one has 'To the Chief of Security Aboard the LRS Antares' engraved"
	magazine_type = /obj/item/ammo_magazine/magnum/rubber
	starts_loaded = 1

/obj/item/gun/projectile/pistol/sec/solar
	name = "Mk58"
	desc = "The NT Mk58 is a cheap, ubiquitous sidearm, produced by a NanoTrasen subsidiary. Found pretty much everywhere humans are. \
	'Executive Officer' is stenciled onto the grip."
	starts_loaded = 0

/obj/item/gun/projectile/pistol/holdout/cap
	name = "Lumoco P3"
	desc = "The Lumoco Arms P3 Whisper. A small, easily concealable gun. \
	On the grip is bold stamped lettering, 'SGV Dagon, Custom Order'."
	fire_delay = 2
	starts_loaded = 0

/obj/item/gun/projectile/pistol/sec/pf
	name = "Mk58"
	desc = "The NT Mk58 is a cheap, ubiquitous sidearm, produced by a NanoTrasen subsidiary. Found pretty much everywhere humans are. \
	'Pathfinder' is stenciled onto the grip."
	starts_loaded = 0

/obj/item/gun/projectile/revolver/medium/sec
	name = "Lumoco Mk12"
	icon_state = "medium"
	safety_icon = "medium_safety"
	caliber = CALIBER_PISTOL
	ammo_type = /obj/item/ammo_casing/pistol
	fire_sound = 'sound/weapons/gunshot/revolver_small.ogg'
	desc = "The Lumoco Arms' Mk12 is a rugged revolver for people who don't keep their guns well-maintained. Unlike its cousin, the Mk59 'Jhen Bothus', it has no issues with reliability."
	accuracy = 2
	bulk = 0
	fire_delay = 5.5
	penetration_mod = 10
	falloff_mod = -0.5

/obj/item/gun/projectile/revolver/medium/sec/pepper
	ammo_type = /obj/item/ammo_casing/pistol/rubber/pepperball


/////////
// display
/////////
//actual thing considering ammo can't be readily found, and much better options are present
/obj/item/gun/projectile/heavysniper/display
	name = "anti-material rifle"
	desc = "A portable anti-armour rifle fitted with a scope, the HI PTR-7 Rifle was originally designed to used against armoured exosuits. It is capable of punching through windows and non-reinforced walls with ease. Fires armor piercing 14.5mm shells. This is quite a decent replica, obviously purchased for a significant sum of thalers."
	starts_loaded = 0

/////////
// Deathsquad AT
/////////
/obj/item/gun/magnetic/railgun/automatic/deathsquad // Rather broken Deathsquad rifle. Admin/ERT only.
	name = "advanced railgun"
	desc = "The Jhen JT-78 Hydra. This appears to be of Terran design, though with significant modifications."
	icon = 'icons/obj/guns/railgun_adv.dmi'
	icon_state = "railgun-tcc"

	init_firemodes = list(
		list(mode_name="semiauto",    burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=2, burst_accuracy=null),
		list(mode_name="bump fire", burst=2, fire_delay=null, move_delay=2,    one_hand_penalty=8, burst_accuracy=list(0,-1,-1)),
		)

/////////
// Deathsquad Rifle
/////////
/obj/item/gun/energy/pulse_rifle/deathsquad
	name = "heavy pulse rifle"
	desc = "A bulky experimental squad support weapon. This pulls from a nullspace pocket to charge its capacitor, which in turn projects the pulse. \
	Or so you'd think, if you weren't probably dead already."
	cell_type = /obj/item/cell
	fire_delay = 25
	projectile_type=/obj/item/projectile/beam/pulse/heavy
	charge_cost= 80
	self_recharge = 1
	move_delay = 1

/////////
// Skrell Launcher
/////////
/obj/item/gun/energy/charge
	name = "Charge Rifle"
	desc = "The ZT-8B, is a modification of the railgun rarely seen by anyone other than those within Skrellian SDTF ranks. This modification flips the railgun on its head, and changes the projectile altogether to a lower velocity 'gas' charge. \
	The rotary magazine has been replaced with a 'hot' chamber, and the barrel has been shortened to accommodate for the new projectile."
	icon = 'icons/boh/items/launchers.dmi' //really shitty cut of the railgun until an actual sprite is slapped up.
	icon_state = "skrell_launcher"
	item_state = "skrell_launcher"
	slot_flags = SLOT_BACK|SLOT_BELT
	cell_type = /obj/item/cell
	self_recharge = 1
	move_delay = 4
	projectile_type=/obj/item/projectile/hotgas/skrell
	charge_cost=620
	wielded_item_state = "skrell_rifle-wielded"

/////////
// Recoilless Rifle
/////////
/obj/item/gun/projectile/rocket/recoilless
	name = "recoilless rifle"
	desc = "A TVP-2 anti-armor recoilless rifle. Truly an anachronism of another time. \
	This specific model was designed to fire incendiary charges. Said charges have a minor explosive charge, with an incredibly powerful, though small, incendiary powder of sorts. \
	Hopefully it's still working after all this time, because, by god, this looks like an old relic. \
	What doesn't look like a relic, however, is the rather large optic mounted atop the rifle."
	icon = 'icons/boh/obj/guns/launchers64.dmi'
	icon_state = "recoilless"
	item_state = "recoilless"
	wielded_item_state = "recoilless_wielded"
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5)
	ammo_type = /obj/item/ammo_casing/rocket/rcr
	starts_loaded = 0

/obj/item/gun/projectile/rocket/recoilless/on_update_icon()
	..()
	if(length(loaded))
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]-empty"
		item_state = "[initial(icon_state)]-empty"



/////////
// 'Broken' Carbine
/////////
/obj/item/gun/energy/laser/broken
	name = "broken laser carbine"
	desc = "An HI G40E, though this one appears to have a cracked projection lens."
	icon_state = "lasersec"
	projectile_type = /obj/item/projectile/beam/incendiary_laser

/////////
// Beanbag Launcher
/////////
/obj/item/gun/projectile/shotgun/pump/beanbag
	name = "beanbag shotgun"
	desc = "Built for close quarters combat, the Hephaestus Industries KS-40 is widely regarded as a weapon of choice for repelling boarders. \
	This one appears to be modified to fire nothing but beanbags, and has an orange paintjob on the slide. Trying to fire high pressure shells doesn't seem like a good idea."
	icon = 'icons/boh/items/shotguns.dmi'
	icon_state = "bshotgun"
	item_state = "bshotgun"
	wielded_item_state = "cshotgun-wielded"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	max_shells = 7
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	one_hand_penalty = 8
	var/explosion_chance = 100

/obj/item/gun/projectile/shotgun/pump/beanbag/on_update_icon()
	..()
	if(length(loaded) > 3)
		for(var/i = 0 to length(loaded) - 4)
			var/image/I = image(icon, "bshell")
			I.pixel_x = i * 2
			overlays += I

/obj/item/gun/projectile/shotgun/pump/beanbag/special_check()
	if(chambered && chambered.BB && prob(explosion_chance))
		var/damage = chambered.BB.get_structure_damage()
		if(istype(chambered.BB, /obj/item/projectile/bullet/pellet))
			var/obj/item/projectile/bullet/pellet/PP = chambered.BB
			damage = PP.damage*PP.pellets
		if(damage > 30)
			var/mob/living/carbon/C = loc
			if(istype(loc))
				C.visible_message("<span class='danger'>[src] explodes in [C]'s hands!</span>", "<span class='danger'>[src] explodes in your face!</span>")
				C.drop_from_inventory(src)
				for(var/zone in list(BP_L_HAND, BP_R_HAND, BP_HEAD))
					C.apply_damage(rand(10,20), def_zone=zone)
			else
				visible_message("<span class='danger'>[src] explodes!</span>")
			explosion(get_turf(src), -1, -1, 1)
			qdel(src)
			return FALSE
	return ..()

/////////
// EPP
/////////
/obj/item/gun/energy/pulse_rifle/pistol/epp
	name = "experimental pulse pistol"
	desc = "A weapon that uses advanced pulse-based beam generation technology to emit powerful laser blasts. It's fitted with an incredibly tiny self-contained reactor. \
	This provides the weapon, in theory, an infinite power source, but a horrible munition count in practice. Additionally, due to its modification not only does it suffer from a horrific lack of shots per recharge; but due to the unique lense modification, causes more pain than harm."
	projectile_type = /obj/item/projectile/beam/pulse/epp
	max_shots = 6
	self_recharge = 1
	burst = 2

/////////
// Casull
/////////
/obj/item/gun/projectile/revolver/medium/captain/large
	name = "Ultimate Argument"
	desc = "A shiny al-Maliki & Mosley Autococker automatic revolver, with black accents. Up-chambered for a .454 calibre round. This one has 'To the Captain of the LRS Antares' engraved on the grip."
	ammo_type = /obj/item/ammo_casing/pistol/magnum/large
	caliber = CALIBER_PISTOL_MAGNUM_LARGE
	has_firing_pin = TRUE
	firing_pin_type = /obj/item/firing_pin/id_locked/commanding_officer

/////////
// XO Revolver
/////////
/obj/item/gun/projectile/revolver/medium/captain/xo
	name = "Final Argument"
	desc = "A shiny al-Maliki & Mosley Autococker automatic revolver, with black accents. Marketed as the 'Revolver for the Modern Era'. This one has 'To the Executive of the LRS Antares' engraved on the grip."
	ammo_type = /obj/item/ammo_casing/pistol/magnum
	caliber = CALIBER_PISTOL_MAGNUM

/////////
// ID locked Mk58
/////////

/obj/item/gun/projectile/pistol/command
	name = "pistol"
	desc = "The NT Mk58 is a cheap, ubiquitous sidearm, produced by a NanoTrasen subsidiary. Found pretty much everywhere humans are. This one appears to be ID locked."
	icon = 'icons/obj/guns/pistol.dmi'
	icon_state = "secguncomp"
	safety_icon = "safety"
	magazine_type = /obj/item/ammo_magazine/pistol/rubber
	fire_delay = 6
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	has_firing_pin = TRUE
	firing_pin_type = /obj/item/firing_pin/id_locked/commanding_officer

/obj/item/gun/projectile/pistol/sec/lethal
	magazine_type = /obj/item/ammo_magazine/pistol

/////////
// Exp Carbine
/////////

/obj/item/gun/energy/laser/exploration
	name = "G40EP carbine"
	desc = "A Hephaestus Industries G40EP carbine, designed to kill with concentrated energy blasts.\
	Fitted with safety chips to make sure discharge aboard a 'safe zone' is impossible. \
	Additionally, it features a higher capacity. \
	It appears this one is painted in Exploration colors. Neat."
	icon_state = "laserr"
	charge_cost = 10
	max_shots = 20
	req_access = list(access_hop)
	authorized_modes = list(UNAUTHORIZED)

/////////
// SMG Primary
/////////

/obj/item/gun/projectile/automatic/sec_smg/less_lethal
	name = "MA-Pariah"
	desc = "A modernised design based off of the older MA-Sword, featuring a pressure-based safety. \
	This safety assures the weapon can only handle specialised low pressure cartridges being chambered, alongside a special magazine feed. \
	The new magazine feed permits the weapon to chamber cartridges at an incredibly fast rate."
	icon = 'icons/boh/items/smg.dmi'
	icon_state = "smg"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	magazine_type = /obj/item/ammo_magazine/smg_top/frangible
	allowed_magazines = /obj/item/ammo_magazine/smg_top/frangible
	caliber = CALIBER_PISTOL_FRANGIBLE

	init_firemodes = list(
		list(mode_name="semi auto",  automatic = FALSE, burst=1, fire_delay=null,    move_delay=null, one_hand_penalty=3, burst_accuracy=null),
		list(mode_name="3-round bursts",  automatic = FALSE, burst=3, fire_delay=null, move_delay=4,    one_hand_penalty=4, burst_accuracy=list(0,-1,-1)),
		list(mode_name="automatic",  automatic = TRUE, burst=1, fire_delay = 2, move_delay=4,    one_hand_penalty=5, burst_accuracy=list(0,-1,-1,-1,-2)),
		)

/////////
// Energy "Primary"
/////////

/obj/item/gun/energy/gun/small/secure/sec
	name = "Beagle Mk-4"
	desc = "Inspired by the SCG's desire to save money, This modified Lawson arms Design gives forces the benefits of weak lasers and command overreach, without expensive ideas such as automatic recharge."
	max_shots = 5
	self_recharge = 0

/////////
// Commissar's Dartgun
/////////

/obj/item/gun/projectile/dartgun/pol
	name = "Z-H Ghoul"
	desc = "A dartgun in service during the Corporate Wars, utilised against Solarian forces. \
	Known as the 'ghoul' for the darts it came preloaded with, and their effects. \
	The mix is something unique and unable to be replicated outside of Zeng-Hu Pharmaceutical's labs."
	starting_chems = list(/datum/reagent/enfluroprobine)

/////////
// Armistice
/////////

/obj/item/gun/projectile/shotgun/doublebarrel/sawn/armistice
	name = "Armistice"
	desc = "A small sidearm, likely one of a kind. It is fitted with two barrels. Wonder what it loads?"
	icon = 'icons/boh/items/shotguns.dmi'
	icon_state = "armis"//yes, this is just a sawnoff sprite but even more cut off. Temp.
	item_state = "armis"
	wielded_item_state = null//override
	slot_flags = SLOT_HOLSTER
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	w_class = ITEM_SIZE_SMALL
	force = 5
	one_hand_penalty = 0//override
	bulk = 0//override

/////////
// Old Pulse Carbine
/////////

/obj/item/gun/energy/pulse_rifle/carbine/old
	name = "NT PR12A Carbine"
	desc = "An older carbine model, having not been in production for many years at this point. What's this doing here?"
	max_shots = 12
