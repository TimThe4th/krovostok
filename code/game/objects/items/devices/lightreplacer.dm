
// Light Replacer (LR)
//
// ABOUT THE DEVICE
//
// This is a device supposedly to be used by Janitors and Janitor Cyborgs which will
// allow them to easily replace lights. This was mostly designed for Janitor Cyborgs since
// they don't have hands or a way to replace lightbulbs.
//
// HOW IT WORKS
//
// You attack a light fixture with it, if the light fixture is broken it will replace the
// light fixture with a working light; the broken light is then placed on the floor for the
// user to then pickup with a trash bag. If it's empty then it will just place a light in the fixture.
//
// HOW TO REFILL THE DEVICE
//
// It can be manually refilled or by clicking on a storage item containing lights.
// If it's part of a robot module, it will charge when the Robot is inside a Recharge Station.
//
// EMAGGED FEATURES
//
// NOTICE: The Cyborg cannot use the emagged Light Replacer and the light's explosion was nerfed. It cannot create holes in the station anymore.
//
// I'm not sure everyone will react the emag's features so please say what your opinions are of it.
//
// When emagged it will rig every light it replaces, which will explode when the light is on.
// This is VERY noticable, even the device's name changes when you emag it so if anyone
// examines you when you're holding it in your hand, you will be discovered.
// It will also be very obvious who is setting all these lights off, since only Janitor Borgs and Janitors have easy
// access to them, and only one of them can emag their device.
//
// The explosion cannot insta-kill anyone with 30% or more health.


/obj/item/device/lightreplacer
	name = "light replacer"
	desc = "A lightweight automated device, capable of interfacing with and rapidly replacing standard light installations."
	icon = 'icons/obj/janitor.dmi'
	icon_state = "lightreplacer0"
	item_state = "electronic"

	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	origin_tech = list(TECH_MAGNET = 3, TECH_MATERIAL = 2)

	var/max_uses = 32
	var/uses = 32
	var/emagged = FALSE
	var/charge = 0
	/// The lighting tone to use for placed light bulbs. One of `LIGHT_COLOR_*` or `LIGHT_REPLACE_*`, or a valid hex color code. Default `LIGHT_REPLACE_RANDOM`.
	var/lighting_tone = LIGHT_REPLACE_RANDOM

/obj/item/device/lightreplacer/examine(mob/user, distance)
	. = ..()
	if(distance <= 2)
		to_chat(user, "It has [uses] light\s remaining.")
		switch (lighting_tone)
			if (LIGHT_REPLACE_AREA)
				to_chat(user, "It is configured to match the room's blueprints for bulb color and tone.")
			if (LIGHT_REPLACE_EXISTING)
				to_chat(user, "It is configured to match the replaced bulb's color and tone.")
			if (LIGHT_REPLACE_RANDOM)
				to_chat(user, "It is configured to print bulbs in random tones.")
			else
				to_chat(user, "It is configured to print bulbs in this color: <span style='color: [lighting_tone];'>■</span>")

/obj/item/device/lightreplacer/resolve_attackby(var/atom/A, mob/user)

	//Check for lights in a container, refilling our charges.
	if(istype(A, /obj/item/storage))
		var/obj/item/storage/S = A
		var/amt_inserted = 0
		var/turf/T = get_turf(user)
		for(var/obj/item/light/L in S.contents)
			if(!user.stat && src.uses < src.max_uses && L.status == LIGHT_OK)
				src.AddUses(1)
				amt_inserted++
				S.remove_from_storage(L, T, 1)
				qdel(L)
		S.finish_bulk_removal()
		if(amt_inserted)
			to_chat(user, "You insert [amt_inserted] light\s into \The [src]. It has [uses] light\s remaining.")
			add_fingerprint(user)
			return

	//Actually replace the light.
	if(istype(A, /obj/machinery/light))
		var/obj/machinery/light/L = A
		if(isliving(user))
			var/mob/living/U = user
			ReplaceLight(L, U)
			add_fingerprint(user)
			return
	. = ..()

/obj/item/device/lightreplacer/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/stack/material) && W.get_material_name() == MATERIAL_GLASS)
		var/obj/item/stack/G = W
		if(uses >= max_uses)
			to_chat(user, "<span class='warning'>[src.name] is full.</span>")
			return
		else if(G.use(1))
			AddUses(16) //Autolathe converts 1 sheet into 16 lights.
			to_chat(user, "<span class='notice'>You insert a piece of glass into \the [src.name]. You have [uses] light\s remaining.</span>")
			return
		else
			to_chat(user, "<span class='warning'>You need one sheet of glass to replace lights.</span>")

	if(istype(W, /obj/item/light))
		var/obj/item/light/L = W
		if(L.status == LIGHT_OK)
			if(uses < max_uses)
				if(!user.unEquip(L))
					return
				AddUses(1)
				to_chat(user, "You insert \the [L.name] into \the [src.name]. You have [uses] light\s remaining.")
				qdel(L)
				return
		else
			to_chat(user, "You need a working light.")
			return

/obj/item/device/lightreplacer/attack_self(mob/user)
	/* // This would probably be a bit OP. If you want it though, uncomment the code.
	if(isrobot(user))
		var/mob/living/silicon/robot/R = user
		if(R.emagged)
			src.Emag()
			to_chat(usr, "You shortcircuit the [src].")
			return
	*/
	to_chat(usr, "It has [uses] lights remaining.")

/obj/item/device/lightreplacer/on_update_icon()
	icon_state = "lightreplacer[emagged]"


/obj/item/device/lightreplacer/attack_self(mob/user)
	var/selection = input(user, "Select a color, tone, or matching option:", "Light Replace Color", LIGHT_REPLACE_OPTIONS[1]) in LIGHT_REPLACE_OPTIONS
	if (!selection)
		return
	switch (selection)
		if ("Random (Default)")
			lighting_tone = LIGHT_REPLACE_RANDOM
			to_chat(user, SPAN_NOTICE("You configure \the [src] to print bulbs in random tones."))
		if ("Match Blueprint")
			lighting_tone = LIGHT_REPLACE_AREA
			to_chat(user, SPAN_NOTICE("You configure \the [src] to match the room's blueprints for bulb color and tone."))
		if ("Match Existing")
			lighting_tone = LIGHT_REPLACE_EXISTING
			to_chat(user, SPAN_NOTICE("You configure \the [src] to match the replaced bulb's color and tone."))
		if ("Warm")
			lighting_tone = LIGHT_COLOUR_WARM
			to_chat(user, SPAN_NOTICE("You configure \the [src] to print bulbs in warm tones."))
		if ("Cool")
			lighting_tone = LIGHT_COLOUR_COOL
			to_chat(user, SPAN_NOTICE("You configure \the [src] to print bulbs in cool tones."))
		if ("White")
			lighting_tone = LIGHT_COLOUR_WHITE
			to_chat(user, SPAN_NOTICE("You configure \the [src] to print bulbs in white tones."))
		if ("Custom")
			var/new_lighting_tone = input(user, "Select a color:", "Light Replace Color") as color
			if (!new_lighting_tone)
				return
			lighting_tone = new_lighting_tone
			to_chat(user, SPAN_NOTICE("You configure \the [src] to print bulbs in the color: <span style='color: [lighting_tone];'>■</span>"))


/obj/item/device/lightreplacer/proc/Use(var/mob/user)

	playsound(src.loc, 'sound/machines/click.ogg', 50, 1)
	AddUses(-1)
	return 1

// Negative numbers will subtract
/obj/item/device/lightreplacer/proc/AddUses(var/amount = 1)
	uses = min(max(uses + amount, 0), max_uses)

/obj/item/device/lightreplacer/proc/Charge(var/mob/user, var/amount = 1)
	charge += amount
	if(charge > 6)
		AddUses(1)
		charge = 0

/obj/item/device/lightreplacer/proc/ReplaceLight(var/obj/machinery/light/target, var/mob/living/U)

	if(target.get_status() == LIGHT_OK)
		to_chat(U, "There is a working [target.get_fitting_name()] already inserted.")
	else if(!CanUse(U))
		to_chat(U, "\The [src]'s refill light blinks red.")
	else if(Use(U))
		to_chat(U, "<span class='notice'>You replace the [target.get_fitting_name()] with the [src].</span>")

		var/bulb_color = null
		if (lighting_tone == LIGHT_REPLACE_AREA)
			bulb_color = target.get_color_from_area()
		else if (lighting_tone == LIGHT_REPLACE_EXISTING)
			bulb_color = target.lightbulb?.get_color()
		else if (lighting_tone == LIGHT_REPLACE_RANDOM)
			bulb_color = pick(LIGHT_STANDARD_COLORS)
		else
			bulb_color = lighting_tone
		if (!bulb_color)
			bulb_color = pick(LIGHT_STANDARD_COLORS)

		if(target.lightbulb)
			var/obj/item/bulb = target.lightbulb
			target.remove_bulb()
			if (isrobot(U))
				qdel(bulb)

		var/obj/item/light/L = new target.light_type(target, bulb_color)
		if (emagged)
			log_and_message_admins("used an emagged light replacer.", U)
			L.create_reagents(5)
			L.reagents.add_reagent(/datum/reagent/toxin/phoron, 5)
		target.insert_bulb(L)


/obj/item/device/lightreplacer/emag_act(var/remaining_charges, var/mob/user)
	emagged = !emagged
	playsound(src.loc, "sparks", 100, 1)
	update_icon()
	return 1

//Can you use it?

/obj/item/device/lightreplacer/proc/CanUse(var/mob/living/user)
	src.add_fingerprint(user)
	//Not sure what else to check for. Maybe if clumsy?
	if(uses > 0)
		return 1
	else
		return 0
