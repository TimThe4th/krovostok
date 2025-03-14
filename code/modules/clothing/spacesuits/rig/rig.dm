#define ONLY_DEPLOY 1
#define ONLY_RETRACT 2
#define SEAL_DELAY 30

/*
 * Defines the behavior of hardsuits/rigs/power armour.
 */

/obj/item/rig

	name = "hardsuit control module"
	icon = 'icons/obj/rig_modules.dmi'
	desc = "A back-mounted hardsuit deployment and control mechanism."
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE

	// These values are passed on to all component pieces.
	armor_type = /datum/extension/armor/rig
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
		)
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	max_pressure_protection = RIG_MAX_PRESSURE
	min_pressure_protection = 0

	siemens_coefficient = 0.2
	permeability_coefficient = 0.1
	unacidable = TRUE

	var/equipment_overlay_icon = 'icons/mob/onmob/onmob_rig_modules.dmi'
	var/hides_uniform = 1 	//used to determinate if uniform should be visible whenever the suit is sealed or not

	var/interface_path = "hardsuit.tmpl"
	var/ai_interface_path = "hardsuit.tmpl"
	var/interface_title = "Hardsuit Controller"
	var/wearer_move_delay //Used for AI moving.
	var/ai_controlled_move_delay = 10

	// Keeps track of what this rig should spawn with.
	var/suit_type = "hardsuit"
	var/list/initial_modules
	var/chest_type = /obj/item/clothing/suit/space/rig
	var/helm_type =  /obj/item/clothing/head/helmet/space/rig
	var/boot_type =  /obj/item/clothing/shoes/magboots/rig
	var/glove_type = /obj/item/clothing/gloves/rig
	var/cell_type =  /obj/item/cell/high
	var/air_type =   /obj/item/tank/oxygen

	//Component/device holders.
	var/obj/item/tank/air_supply                       // Air tank, if any.
	var/obj/item/clothing/shoes/boots = null                  // Deployable boots, if any.
	var/obj/item/clothing/suit/space/rig/chest                // Deployable chestpiece, if any.
	var/obj/item/clothing/head/helmet/space/rig/helmet = null // Deployable helmet, if any.
	var/obj/item/clothing/gloves/rig/gloves = null            // Deployable gauntlets, if any.
	var/obj/item/cell/cell                             // Power supply, if any.
	var/obj/item/rig_module/selected_module = null            // Primary system (used with middle-click)
	var/obj/item/rig_module/vision/visor                      // Kinda shitty to have a var for a module, but saves time.
	var/obj/item/rig_module/voice/speech                      // As above.
	var/mob/living/carbon/human/wearer                        // The person currently wearing the rig.
	var/image/mob_icon                                        // Holder for on-mob icon.
	var/list/installed_modules = list()                       // Power consumption/use bookkeeping.

	// Rig status vars.
	var/open = 0                                              // Access panel status.
	var/p_open = 0											  // Wire panel status
	var/locked = 1                                            // Lock status.
	var/subverted = 0
	var/interface_locked = 0
	var/control_overridden = 0
	var/ai_override_enabled = 0
	var/security_check_enabled = 1
	var/malfunctioning = 0
	var/malfunction_delay = 0
	var/electrified = 0
	var/locked_down = 0
	var/aimove_power_usage = 200							  // Power usage per tile traveled when suit is moved by AI in IIS. In joules.

	var/seal_delay = SEAL_DELAY
	var/sealing                                               // Keeps track of seal status independantly of canremove.
	var/offline = 1                                           // Should we be applying suit maluses?
	var/online_slowdown = 1                                   // If the suit is deployed and powered, it sets slowdown to this.
	var/offline_slowdown = 3                                  // If the suit is deployed and unpowered, it sets slowdown to this.
	var/vision_restriction = TINT_NONE
	var/offline_vision_restriction = TINT_HEAVY               // tint value given to helmet
	var/airtight = 1 //If set, will adjust ITEM_FLAG_AIRTIGHT flags on components. Otherwise it should leave them untouched.
	var/visible_name
	var/update_visible_name = FALSE

	var/emp_protection = 0

	// Wiring! How exciting.
	var/datum/wires/rig/wires
	var/datum/effect/effect/system/spark_spread/spark_system

	var/banned_modules = list()

	/// BOS: Overrides species_icon in update_icon proc
	var/species_icon_override

/obj/item/rig/get_mechanics_info()
	. = ..()
	. += {"
		<p>A Hardsuit Control Module, or HCM, is a large device that goes into your backpack slot and can be deployed into a full powered hardsuit.</p>
		<p>HCM oxygen tanks must be refilled like a normal void suit's tank.</p>
		<p>HCM power cells must be recharged.</p>
		<p>HCMs and their components are susceptible to damage from EMPs.</p>
		<p>HCMs rely on an internal power cell to function, and will de-activate themselves if the power cell fully drains. Using modules increases the speed at which the HCM's cell drains.</p>

		<h4>ACTIVATION</h4>
		<p>To deploy and activate an HCM, follow these steps:</p>
		<ol>
			<li>Put the HCM onto your backpack slot. This is a timed action that will require you to remain still while you put it on.</li>
			<li>Ensure you are not wearing anything on your head, suit, or glove slots, and ensure you are not wearing any magboots. These items will block the HCM from fully deploying.</li>
			<li>Use the <code>toggle-hardsuit</code> verb in the chat bar, the <code>Toggle Hardsuit</code> option under the <code>Hardsuit</code> tab in the upper right, or the <code>Toggle</code> button next to the Suit status in the Hardsuit Interface. This is a timed action that will require you to remain still until all components of the suit are deployed and sealed.</li>
			<li>Monitor your chat log - You'll know it's done when you see bold blue text stating the suit tightens around you.</li>
		</ol>

		<h4>DE-ACTIVATION</h4>
		<p>You can de-activate the HCM so you can take it off by following these steps:</p>
		<ol>
			<li>Use the <code>toggle-hardsuit</code> verb in the chat bar, the <code>Toggle Hardsuit</code> option under the <code>Hardsuit</code> tab in the upper right, or the <code>Toggle</code> button next to the Suit status in the Hardsuit Interface. This is a timed action that will require you to remain still until all components of the suit are retracted and unsealed.</li>
			<li>Monitor your chat log - You'll know it's done when you see bold blue text stating the suit loosens around you.</li>
			<li>Click on the HCM with an empty hand to remove it from your back.</li>
		</ol>

		<h4>TOOL INTERACTIONS</h4>
		<ul>
			<li>You can toggle the HCM's access panel lock by using an ID card with the required access on it.</li>
			<li>You can open or close the HCM's maintenance panel by using a crowbar on it. The panel can only be opened if the HCM's access panel is unlocked.</li>
			<li>You can remove modules or the oxygen tank by using a wrench on the HCM. You can only do this if the maintenance panel is open.</li>
			<li>You can insert modules, power cells, oxygen tanks by using them on the HCM while its maintenance panel is open.</li>
			<li>You can repair the HCM's internals by using nanopaste on it while the maintenance panel is open.</li>
			<li>You can open or close the HCM's wire panel by using a screwdriver on it. This operates as a standard wire control panel, interactable with a multitool, wirecutters, signallers, etc. once open.</li>
			<li>You can repair damage to the HCM's chest piece by using a stack of the relevant material or a welder on the HCM or the chest piece while the chest piece is deployed.</li>
		</ul>

		<h4>HARDSUIT INTERFACE</h4>
		<p>The HCM's Hardsuit Interface can be accessed by using the <code>Open Hardsuit Interface</code> option under the <code>Hardsuit</code> tab in the top right, or using the <code>open-hardsuit-interface`</code>verb in the chat bar.</p>
		<ul>
			<li><b>Power Supply</b> tells you how much charge is remaining in the HCM's power cell.</li>
			<li><b>AI Control</b> displays and allows you to toggle an inserted pAI or AI intellicard's ability to control movement (CURRENTLY BROKEN, DO NOT USE).</li>
			<li><b>Cover Status</b> displays and allows you to toggle the HCM's access panel lock.</li>
			<li><b>Suit Pieces</b> displays the name and status of the major components of the hardsuit, and allows you to toggle the helmet on or off.</li>
			<li>Additional HCM modules and their controls are displayed in the HCM's interface as well.</li>
		</ul>
	"}

/obj/item/rig/get_cell()
	return cell

/obj/item/rig/examine(mob/user)
	. = ..()
	if(wearer)
		for(var/obj/item/piece in list(helmet,gloves,chest,boots))
			if(!piece || piece.loc != wearer)
				continue
			to_chat(user, "[icon2html(piece, user)] \The [piece] [piece.gender == PLURAL ? "are" : "is"] deployed.")

	if(src.loc == user)
		to_chat(user, "The access panel is [locked? "locked" : "unlocked"].")
		to_chat(user, "The maintenance panel is [open ? "open" : "closed"].")
		to_chat(user, "The wire panel is [p_open ? "open" : "closed"].")
		to_chat(user, "Hardsuit systems are [offline ? "<font color='red'>offline</font>" : "<font color='green'>online</font>"].")

		if(open)
			to_chat(user, "It's equipped with [english_list(installed_modules)].")

/obj/item/rig/Initialize()
	. = ..()

	item_state = icon_state
	wires = new(src)

	if(!length(req_access))
		locked = 0

	spark_system = new()
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)

	START_PROCESSING(SSobj, src)

	if(initial_modules && initial_modules.len)
		for(var/path in initial_modules)
			var/obj/item/rig_module/module = new path(src)
			installed_modules += module
			module.installed(src)

	// Create and initialize our various segments.
	if(cell_type)
		cell = new cell_type(src)
	if(air_type)
		air_supply = new air_type(src)
	if(glove_type)
		gloves = new glove_type(src)
	if(helm_type)
		helmet = new helm_type(src)
		verbs |= /obj/item/rig/proc/toggle_helmet
	if(boot_type)
		boots = new boot_type(src)
	if(chest_type)
		chest = new chest_type(src)
		if(allowed)
			chest.allowed = allowed

	for(var/obj/item/piece in list(gloves,helmet,boots,chest))
		if(!istype(piece))
			continue
		piece.canremove = 0
		piece.SetName("[suit_type] [initial(piece.name)]")
		piece.desc = "It seems to be part of a [src.name]."
		piece.icon_state = "[initial(icon_state)]"
		piece.min_cold_protection_temperature = min_cold_protection_temperature
		piece.max_heat_protection_temperature = max_heat_protection_temperature
		if(piece.siemens_coefficient > siemens_coefficient) //So that insulated gloves keep their insulation.
			piece.siemens_coefficient = siemens_coefficient
		piece.permeability_coefficient = permeability_coefficient
		piece.unacidable = unacidable
		if(islist(armor))
			piece.armor = armor.Copy() // codex reads the armor list, not extensions. this list does not have any effect on in game mechanics
			remove_extension(piece, /datum/extension/armor)
			set_extension(piece, armor_type, armor, armor_degradation_speed)

	set_slowdown_and_vision(!offline)
	update_icon(1)

/obj/item/rig/Destroy()
	for(var/obj/item/piece in list(gloves,boots,helmet,chest))
		qdel(piece)
	STOP_PROCESSING(SSobj, src)
	qdel(wires)
	wires = null
	qdel(spark_system)
	spark_system = null
	return ..()

/obj/item/rig/get_mob_overlay(mob/user_mob, slot)
	var/image/ret = ..()
	if(icon_override)
		ret.icon = icon_override
	else if(slot == slot_back_str)
		ret.icon = mob_icon
	return ret

/obj/item/rig/proc/set_slowdown_and_vision(var/active)
	if(chest)
		chest.slowdown_per_slot[slot_wear_suit] = (active? online_slowdown : offline_slowdown)
	if(helmet)
		helmet.tint = (active? vision_restriction : offline_vision_restriction)
		helmet.update_vision()

/obj/item/rig/proc/suit_is_deployed()
	if(!istype(wearer) || src.loc != wearer || wearer.back != src)
		return 0
	if(helm_type && !(helmet && wearer.head == helmet))
		return 0
	if(glove_type && !(gloves && wearer.gloves == gloves))
		return 0
	if(boot_type && !(boots && wearer.shoes == boots))
		return 0
	if(chest_type && !(chest && wearer.wear_suit == chest))
		return 0
	return 1

/obj/item/rig/proc/reset()
	canremove = 1
	if(istype(chest))
		chest.check_limb_support(wearer)
	for(var/obj/item/piece in list(helmet,boots,gloves,chest))
		if(!piece) continue
		piece.icon_state = "[initial(icon_state)]"
		if(airtight)
			piece.max_pressure_protection = initial(piece.max_pressure_protection)
			piece.min_pressure_protection = initial(piece.min_pressure_protection)
			piece.item_flags &= ~ITEM_FLAG_AIRTIGHT
	update_icon(1)

/obj/item/rig/proc/toggle_seals(var/mob/initiator,var/instant)

	if(sealing) return

	// Seal toggling can be initiated by the suit AI, too
	if(!wearer)
		to_chat(initiator, "<span class='danger'>Cannot toggle suit: The suit is currently not being worn by anyone.</span>")
		return 0

	if(!check_power_cost(wearer, 1))
		return 0

	deploy(wearer,instant)

	var/seal_target = !canremove
	var/failed_to_seal

	canremove = 0 // No removing the suit while unsealing.
	sealing = 1

	if(!seal_target && !suit_is_deployed())
		wearer.visible_message(\
		"<span class='danger'>[wearer]'s suit flashes an error light.</span>", \
		"<span class='danger'>Your suit flashes an error light. It can't function properly without being fully deployed.</span>")

		failed_to_seal = 1

	if(!failed_to_seal)

		if(!instant)
			wearer.visible_message(\
			"<span class='info'>[wearer]'s suit emits a quiet hum as it begins to adjust its seals.</span>", \
			"<span class='info'>With a quiet hum, the suit begins running checks and adjusting components.</span>")

			if(seal_delay && !do_after(wearer,seal_delay, src))
				failed_to_seal = 1

		if(!wearer)
			failed_to_seal = 1
		else
			for(var/list/piece_data in list(list(wearer.shoes,boots,"boots",boot_type),list(wearer.gloves,gloves,"gloves",glove_type),list(wearer.head,helmet,"helmet",helm_type),list(wearer.wear_suit,chest,"chest",chest_type)))

				var/obj/item/piece = piece_data[1]
				var/obj/item/compare_piece = piece_data[2]
				var/msg_type = piece_data[3]
				var/piece_type = piece_data[4]

				if(!piece || !piece_type)
					continue

				if(!istype(wearer) || !istype(piece) || !istype(compare_piece) || !msg_type)
					if(wearer) to_chat(wearer, "<span class='warning'>You must remain still while the suit is adjusting the components.</span>")
					failed_to_seal = 1
					break

				if(!failed_to_seal && wearer.back == src && piece == compare_piece)

					if(seal_delay && !instant && !do_after(wearer, seal_delay, src, do_flags = DO_DEFAULT & ~DO_USER_SAME_HAND))
						failed_to_seal = 1

					piece.icon_state = "[initial(icon_state)][!seal_target ? "_sealed" : ""]"
					switch(msg_type)
						if("boots")
							to_chat(wearer, "<span class='info'>\The [piece] [!seal_target ? "seal around your feet" : "relax their grip on your legs"].</span>")
							wearer.update_inv_shoes()
						if("gloves")
							to_chat(wearer, "<span class='info'>\The [piece] [!seal_target ? "tighten around your fingers and wrists" : "become loose around your fingers"].</span>")
							wearer.update_inv_gloves()
						if("chest")
							to_chat(wearer, "<span class='info'>\The [piece] [!seal_target ? "cinches tight again your chest" : "releases your chest"].</span>")
							wearer.update_inv_wear_suit()
						if("helmet")
							to_chat(wearer, "<span class='info'>\The [piece] hisses [!seal_target ? "closed" : "open"].</span>")
							wearer.update_inv_head()
							if(helmet)
								helmet.update_light(wearer)

					//sealed pieces become airtight, protecting against diseases
					var/datum/extension/armor/rig/armor_datum = get_extension(piece, /datum/extension/armor)
					if(istype(armor_datum))
						armor_datum.sealed = !seal_target
					playsound(src, 'sound/machines/suitstorage_lockdoor.ogg', 10, 0)

				else
					failed_to_seal = 1

		if((wearer && !(istype(wearer) && wearer.back == src)) || (!seal_target && !suit_is_deployed()))
			failed_to_seal = 1

	sealing = null

	if(failed_to_seal)
		for(var/obj/item/piece in list(helmet,boots,gloves,chest))
			if(!piece) continue
			piece.icon_state = "[initial(icon_state)][!seal_target ? "" : "_sealed"]"
		canremove = !seal_target
		if(airtight)
			update_component_sealed()
		update_icon(1)
		return 0

	// Success!
	canremove = seal_target
	to_chat(wearer, "<span class='info'><b>Your entire suit [canremove ? "loosens as the components relax" : "tightens around you as the components lock into place"].</b></span>")
	if(!canremove && update_visible_name)
		visible_name = wearer.real_name

	if(wearer != initiator)
		to_chat(initiator, "<span class='info'>Suit adjustment complete. Suit is now [canremove ? "unsealed" : "sealed"].</span>")

	if(canremove)
		for(var/obj/item/rig_module/module in installed_modules)
			module.deactivate()
	if(airtight)
		update_component_sealed()
	update_icon(1)


/obj/item/rig/proc/update_component_sealed()
	for(var/obj/item/piece in list(helmet,boots,gloves,chest))
		if(canremove)
			piece.max_pressure_protection = initial(piece.max_pressure_protection)
			piece.min_pressure_protection = initial(piece.min_pressure_protection)
			piece.item_flags &= ~ITEM_FLAG_AIRTIGHT
		else
			piece.max_pressure_protection = max_pressure_protection
			piece.min_pressure_protection = min_pressure_protection
			piece.item_flags |=  ITEM_FLAG_AIRTIGHT
	if (hides_uniform && chest)
		if(canremove)
			chest.flags_inv &= ~(HIDEJUMPSUIT)
		else
			chest.flags_inv |= HIDEJUMPSUIT
	if (helmet)
		if (canremove)
			helmet.flags_inv &= ~(HIDEMASK)
		else
			helmet.flags_inv |= HIDEMASK
	update_icon(1)

/obj/item/rig/Process()

	// If we've lost any parts, grab them back.
	var/mob/living/M
	for(var/obj/item/piece in list(gloves,boots,helmet,chest))
		if(piece.loc != src && !(wearer && piece.loc == wearer))
			if(istype(piece.loc, /mob/living))
				M = piece.loc
				M.drop_from_inventory(piece)
			piece.forceMove(src)

	var/changed = update_offline()
	if(changed)
		if(offline)
			//notify the wearer
			if(!canremove)
				if (offline_slowdown < 3)
					to_chat(wearer, "<span class='danger'>Your suit beeps stridently, and suddenly goes dead.</span>")
				else
					to_chat(wearer, "<span class='danger'>Your suit beeps stridently, and suddenly you're wearing a leaden mass of metal and plastic composites instead of a powered suit.</span>")
			if(offline_vision_restriction >= TINT_MODERATE)
				to_chat(wearer, "<span class='danger'>The suit optics flicker and die, leaving you with restricted vision.</span>")
			else if(offline_vision_restriction >= TINT_BLIND)
				to_chat(wearer, "<span class='danger'>The suit optics drop out completely, drowning you in darkness.</span>")

			if(electrified > 0)
				electrified = 0
			for(var/obj/item/rig_module/module in installed_modules)
				module.deactivate()
		else
			if(istype(wearer) && !wearer.wearing_rig)
				wearer.wearing_rig = src

		set_slowdown_and_vision(!offline)
		if(istype(chest))
			chest.check_limb_support(wearer)

	if(!offline)
		if(cell && cell.charge > 0 && electrified > 0)
			electrified--

		if(malfunction_delay > 0)
			malfunction_delay--
		else if(malfunctioning)
			malfunctioning--
			malfunction()

		for(var/obj/item/rig_module/module in installed_modules)
			if(!cell.checked_use(module.Process() * CELLRATE))
				module.deactivate()//turns off modules when your cell is dry

//offline should not change outside this proc
/obj/item/rig/proc/update_offline()
	var/go_offline = (!istype(wearer) || loc != wearer || wearer.back != src || canremove || sealing || !cell || cell.charge <= 0)
	if(offline != go_offline)
		offline = go_offline
		return 1
	return 0

/obj/item/rig/proc/check_power_cost(var/mob/living/user, var/cost, var/use_unconcious, var/obj/item/rig_module/mod, var/user_is_ai)

	if(!istype(user))
		return 0

	var/fail_msg

	if(!user_is_ai)
		var/mob/living/carbon/human/H = user
		if(istype(H) && H.back != src)
			fail_msg = "<span class='warning'>You must be wearing \the [src] to do this.</span>"
	if(sealing)
		fail_msg = "<span class='warning'>The hardsuit is in the process of adjusting seals and cannot be activated.</span>"
	else if(!fail_msg && ((use_unconcious && user.stat > 1) || (!use_unconcious && user.stat)))
		fail_msg = "<span class='warning'>You are in no fit state to do that.</span>"
	else if(!cell)
		fail_msg = "<span class='warning'>There is no cell installed in the suit.</span>"
	else if(cost && !cell.check_charge(cost * CELLRATE))
		fail_msg = "<span class='warning'>Not enough stored power.</span>"

	if(fail_msg)
		to_chat(user, "[fail_msg]")
		return 0

	// This is largely for cancelling stealth and whatever.
	if(mod && mod.disruptive)
		for(var/obj/item/rig_module/module in (installed_modules - mod))
			if(module.active && module.disruptable)
				module.deactivate()

	cell.use(cost * CELLRATE)
	return 1

/obj/item/rig/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/nano_state = GLOB.inventory_state)
	if(!user)
		return

	var/list/data = list()

	if(selected_module)
		data["primarysystem"] = "[selected_module.interface_name]"

	if(src.loc != user)
		data["ai"] = 1

	data["seals"] =     "[src.canremove]"
	data["sealing"] =   "[src.sealing]"
	data["helmet"] =    (helmet ? "[helmet.name]" : "None.")
	data["gauntlets"] = (gloves ? "[gloves.name]" : "None.")
	data["boots"] =     (boots ?  "[boots.name]" :  "None.")
	data["chest"] =     (chest ?  "[chest.name]" :  "None.")

	data["charge"] =       cell ? round(cell.charge,1) : 0
	data["maxcharge"] =    cell ? cell.maxcharge : 0
	data["chargestatus"] = cell ? Floor(cell.percent()/2) : 0

	data["emagged"] =       subverted
	data["coverlock"] =     locked
	data["interfacelock"] = interface_locked
	data["aicontrol"] =     control_overridden
	data["aioverride"] =    ai_override_enabled
	data["securitycheck"] = security_check_enabled
	data["malf"] =          malfunction_delay

	if(wearer) //Internals below!!!
		data["valveOpen"] = (wearer.internal == air_supply)

		if(!wearer.internal || wearer.internal == air_supply)	// if they have no active internals or if tank is current internal
			if(wearer.wear_mask && (wearer.wear_mask.item_flags & ITEM_FLAG_AIRTIGHT))// mask
				data["maskConnected"] = 1
			else if(wearer.head && (wearer.head.item_flags & ITEM_FLAG_AIRTIGHT)) // Make sure they have a helmet and its airtight
				data["maskConnected"] = 1
			else
				data["maskConnected"] = 0

	data["tankPressure"] = round(air_supply && air_supply.air_contents && air_supply.air_contents.return_pressure() ? air_supply.air_contents.return_pressure() : 0)
	data["releasePressure"] = round(air_supply && air_supply.distribute_pressure ? air_supply.distribute_pressure : 0)
	data["defaultReleasePressure"] = air_supply ? round(initial(air_supply.distribute_pressure)) : 0
	data["maxReleasePressure"] = air_supply ? round(TANK_MAX_RELEASE_PRESSURE) : 0
	data["tank"] = air_supply ? 1 : 0

	var/list/module_list = list()
	var/i = 1
	for(var/obj/item/rig_module/module in installed_modules)
		var/list/module_data = list(
			"index" =             i,
			"name" =              "[module.interface_name]",
			"desc" =              "[module.interface_desc]",
			"can_use" =           "[module.usable]",
			"can_select" =        "[module.selectable]",
			"can_toggle" =        "[module.toggleable]",
			"is_active" =         "[module.active]",
			"engagecost" =        module.use_power_cost*10,
			"activecost" =        module.active_power_cost*10,
			"passivecost" =       module.passive_power_cost*10,
			"engagestring" =      module.engage_string,
			"activatestring" =    module.activate_string,
			"deactivatestring" =  module.deactivate_string,
			"damage" =            module.damage
			)

		if(module.charges && module.charges.len)

			module_data["charges"] = list()
			module_data["chargetype"] = module.charge_selected

			for(var/chargetype in module.charges)
				var/datum/rig_charge/charge = module.charges[chargetype]
				module_data["charges"] += list(list("caption" = "[chargetype] ([charge.charges])", "index" = "[chargetype]"))

		module_list += list(module_data)
		i++

	if(module_list.len)
		data["modules"] = module_list

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, ((src.loc != user) ? ai_interface_path : interface_path), interface_title, 480, 550, state = nano_state)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/obj/item/rig/on_update_icon(var/update_mob_icon)

	//TODO: Maybe consider a cache for this (use mob_icon as blank canvas, use suit icon overlay).
	overlays.Cut()
	if(!mob_icon || update_mob_icon)
		var/species_icon
		if (!species_icon_override)
			species_icon = 'icons/mob/onmob/onmob_rig_back.dmi'
		else
			species_icon = species_icon_override
		// Since setting mob_icon will override the species checks in
		// update_inv_wear_suit(), handle species checks here.
		if(wearer && sprite_sheets && sprite_sheets[wearer.species.get_bodytype(wearer)])
			species_icon =  sprite_sheets[wearer.species.get_bodytype(wearer)]
		mob_icon = image("icon" = species_icon, "icon_state" = "[icon_state]")

	if(equipment_overlay_icon && LAZYLEN(installed_modules))
		for(var/obj/item/rig_module/module in installed_modules)
			if(module.suit_overlay)
				chest.overlays += image("icon" = equipment_overlay_icon, "icon_state" = "[module.suit_overlay]", "dir" = SOUTH)

	if(wearer)
		wearer.update_inv_shoes()
		wearer.update_inv_gloves()
		wearer.update_inv_head()
		wearer.update_inv_wear_mask()
		wearer.update_inv_wear_suit()
		wearer.update_inv_w_uniform()
		wearer.update_inv_back()
	return

/obj/item/rig/get_mob_overlay(mob/user_mob, slot)
	var/image/ret = ..()
	if(slot != slot_back_str || offline)
		return ret

	if(equipment_overlay_icon && LAZYLEN(installed_modules))
		for(var/obj/item/rig_module/module in installed_modules)
			if(module.suit_overlay)
				ret.overlays += image("icon" = equipment_overlay_icon, "icon_state" = "[module.suit_overlay]")
	return ret

/obj/item/rig/get_req_access()
	if(!security_check_enabled || !locked)
		return list()
	return ..()

/obj/item/rig/proc/check_suit_access(var/mob/living/carbon/human/user)

	if(!security_check_enabled)
		return 1

	if(istype(user))
		if(!canremove)
			return 1
		if(malfunction_check(user))
			return 0
		if(user.back != src)
			return 0
		else if(!src.allowed(user))
			to_chat(user, "<span class='danger'>Unauthorized user. Access denied.</span>")
			return 0

	else if(!ai_override_enabled)
		to_chat(user, "<span class='danger'>Synthetic access disabled. Please consult hardware provider.</span>")
		return 0

	return 1

//TODO: Fix Topic vulnerabilities for malfunction and AI override.
/obj/item/rig/Topic(href,href_list)
	if(!check_suit_access(usr))
		return 0

	if(href_list["toggle_piece"])
		toggle_piece(href_list["toggle_piece"], usr)
		return 1
	if(href_list["toggle_seals"])
		toggle_seals(usr)
		return 1
	if(href_list["interact_module"])

		var/module_index = text2num(href_list["interact_module"])

		if(module_index > 0 && module_index <= installed_modules.len)
			var/obj/item/rig_module/module = installed_modules[module_index]
			switch(href_list["module_mode"])
				if("activate")
					module.activate()
				if("deactivate")
					module.deactivate()
				if("engage")
					module.engage()
				if("select")
					if(selected_module == module)
						deselect_module()
					else
						module.select()
				if("select_charge_type")
					module.charge_selected = href_list["charge_type"]
		return 1
	if(href_list["toggle_ai_control"])
		ai_override_enabled = !ai_override_enabled
		notify_ai("Synthetic suit control has been [ai_override_enabled ? "enabled" : "disabled"].")
		return 1
	if(href_list["toggle_suit_lock"])
		locked = !locked
		return 1
	if(href_list["air_supply"])
		air_supply.OnTopic(wearer,href_list)
		return 1

/obj/item/rig/proc/notify_ai(var/message)
	for(var/obj/item/rig_module/ai_container/module in installed_modules)
		if(module.integrated_ai && module.integrated_ai.client && !module.integrated_ai.stat)
			to_chat(module.integrated_ai, "[message]")
			. = 1

/obj/item/rig/equipped(mob/living/carbon/human/M)
	..()

	if(seal_delay > 0 && istype(M) && M.back == src)
		M.visible_message(\
		"<span class='info'>[M] starts putting on \the [src]...</span>", \
		"<span class='info'>You start putting on \the [src]...</span>")

		if(!do_after(M, seal_delay, M, DO_PUBLIC_UNIQUE))
			if(M && M.back == src)
				if(!M.unEquip(src))
					return
			src.dropInto(loc)
			return

	if(istype(M) && M.back == src)
		M.visible_message(\
		"<span class='info'><b>[M] struggles into \the [src].</b></span>", \
		"<span class='info'><b>You struggle into \the [src].</b></span>")

		wearer = M
		wearer.wearing_rig = src
		update_icon()

/obj/item/rig/proc/toggle_piece(var/piece, var/mob/initiator, var/deploy_mode)

	if(sealing || !cell || !cell.charge)
		return

	if(!istype(wearer) || !wearer.back == src)
		return

	if(initiator == wearer && wearer.incapacitated(INCAPACITATION_DISABLED)) // If the initiator isn't wearing the suit it's probably an AI.
		return

	var/obj/item/check_slot
	var/equip_to
	var/obj/item/use_obj

	if(!wearer)
		return

	switch(piece)
		if("helmet")
			equip_to = slot_head
			use_obj = helmet
			check_slot = wearer.head
		if("gauntlets")
			equip_to = slot_gloves
			use_obj = gloves
			check_slot = wearer.gloves
		if("boots")
			equip_to = slot_shoes
			use_obj = boots
			check_slot = wearer.shoes
		if("chest")
			equip_to = slot_wear_suit
			use_obj = chest
			check_slot = wearer.wear_suit

	if(use_obj)
		if(check_slot == use_obj && deploy_mode != ONLY_DEPLOY)

			var/mob/living/carbon/human/holder

			if(use_obj)
				holder = use_obj.loc
				if(istype(holder))
					if(use_obj && check_slot == use_obj)
						to_chat(wearer, "<span class='info'><b>Your [use_obj.name] [use_obj.gender == PLURAL ? "retract" : "retracts"] swiftly.</b></span>")
						use_obj.canremove = 1
						holder.drop_from_inventory(use_obj, src)
						use_obj.canremove = 0

		else if (deploy_mode != ONLY_RETRACT)
			if(check_slot && check_slot == use_obj)
				return
			use_obj.forceMove(wearer)
			if(!wearer.equip_to_slot_if_possible(use_obj, equip_to, TRYEQUIP_REDRAW | TRYEQUIP_SILENT))
				use_obj.forceMove(src)
				if(check_slot)
					to_chat(initiator, "<span class='danger'>You are unable to deploy \the [piece] as \the [check_slot] [check_slot.gender == PLURAL ? "are" : "is"] in the way.</span>")
					return
			else
				to_chat(wearer, "<span class='notice'>Your [use_obj.name] [use_obj.gender == PLURAL ? "deploy" : "deploys"] swiftly.</span>")

	if(piece == "helmet" && helmet)
		helmet.update_light(wearer)

/obj/item/rig/proc/deploy(mob/M,var/sealed)

	var/mob/living/carbon/human/H = M

	if(!H || !istype(H)) return

	if(H.back != src)
		return

	if(sealed)
		if(H.head)
			var/obj/item/garbage = H.head
			H.head = null
			qdel(garbage)

		if(H.gloves)
			var/obj/item/garbage = H.gloves
			H.gloves = null
			qdel(garbage)

		if(H.shoes)
			var/obj/item/garbage = H.shoes
			H.shoes = null
			qdel(garbage)

		if(H.wear_suit)
			var/obj/item/garbage = H.wear_suit
			H.wear_suit = null
			qdel(garbage)

	for(var/piece in list("helmet","gauntlets","chest","boots"))
		toggle_piece(piece, H, ONLY_DEPLOY)

/obj/item/rig/dropped(var/mob/user)
	..()
	for(var/piece in list("helmet","gauntlets","chest","boots"))
		toggle_piece(piece, user, ONLY_RETRACT)
	if(wearer)
		wearer.wearing_rig = null
		wearer = null

/obj/item/rig/proc/deselect_module()
	if (selected_module)
		if(selected_module.suit_overlay_inactive)
			selected_module.suit_overlay = selected_module.suit_overlay_inactive
		else
			selected_module.suit_overlay = null
		selected_module = null
		update_icon()

//Todo
/obj/item/rig/proc/malfunction()
	return 0

/obj/item/rig/emp_act(severity_class)
	//set malfunctioning
	if(emp_protection < 30) //for ninjas, really.
		malfunctioning += 10
		if(malfunction_delay <= 0)
			malfunction_delay = max(malfunction_delay, round(30/severity_class))

	//drain some charge
	if(cell) cell.emp_act(severity_class + 1)

	//possibly damage some modules
	take_hit((100/severity_class), "electrical pulse", 1)
	..()

/obj/item/rig/proc/shock(mob/user)
	if (electrocute_mob(user, cell, src)) //electrocute_mob() handles removing charge from the cell, no need to do that here.
		spark_system.start()
		if(user.stunned)
			return 1
	return 0

/obj/item/rig/proc/take_hit(damage, source, is_emp=0)

	if(!installed_modules.len)
		return

	var/chance
	if(!is_emp)
		var/damage_resistance = 0
		if(istype(chest, /obj/item/clothing/suit/space))
			damage_resistance = chest.breach_threshold
		chance = 2*max(0, damage - damage_resistance)
	else
		//Want this to be roughly independant of the number of modules, meaning that X emp hits will disable Y% of the suit's modules on average.
		//that way people designing hardsuits don't have to worry (as much) about how adding that extra module will affect emp resiliance by 'soaking' hits for other modules
		chance = 2*max(0, damage - emp_protection)*min(installed_modules.len/15, 1)

	if(!prob(chance))
		return

	//deal addition damage to already damaged module first.
	//This way the chances of a module being disabled aren't so remote.
	var/list/valid_modules = list()
	var/list/damaged_modules = list()
	for(var/obj/item/rig_module/module in installed_modules)
		if(module.damage < 2)
			valid_modules |= module
			if(module.damage > 0)
				damaged_modules |= module

	var/obj/item/rig_module/dam_module = null
	if(damaged_modules.len)
		dam_module = pick(damaged_modules)
	else if(valid_modules.len)
		dam_module = pick(valid_modules)

	if(!dam_module) return

	dam_module.damage++

	if(!source)
		source = "hit"

	if(wearer)
		if(dam_module.damage >= 2)
			to_chat(wearer, "<span class='danger'>The [source] has disabled your [dam_module.interface_name]!</span>")
		else
			to_chat(wearer, "<span class='warning'>The [source] has damaged your [dam_module.interface_name]!</span>")
	dam_module.deactivate()

/obj/item/rig/proc/malfunction_check(var/mob/living/carbon/human/user)
	if(malfunction_delay)
		if(offline)
			to_chat(user, "<span class='danger'>The suit is completely unresponsive.</span>")
		else
			to_chat(user, "<span class='danger'>ERROR: Hardware fault. Rebooting interface...</span>")
		return 1
	return 0

/obj/item/rig/proc/ai_can_move_suit(var/mob/user, var/check_user_module = 0, var/check_for_ai = 0)

	if(check_for_ai)
		if(!(locate(/obj/item/rig_module/ai_container) in contents))
			return 0
		var/found_ai
		for(var/obj/item/rig_module/ai_container/module in contents)
			if(module.damage >= 2)
				continue
			if(module.integrated_ai && module.integrated_ai.client && !module.integrated_ai.stat)
				found_ai = 1
				break
		if(!found_ai)
			return 0

	if(check_user_module)
		if(!user || !user.loc || !user.loc.loc)
			return 0
		var/obj/item/rig_module/ai_container/module = user.loc.loc
		if(!istype(module) || module.damage >= 2)
			to_chat(user, "<span class='warning'>Your host module is unable to interface with the suit.</span>")
			return 0

	if(offline || !cell || !cell.charge || locked_down)
		if(user) to_chat(user, "<span class='warning'>Your host rig is unpowered and unresponsive.</span>")
		return 0
	if(!wearer || wearer.back != src)
		if(user) to_chat(user, "<span class='warning'>Your host rig is not being worn.</span>")
		return 0
	if(!wearer.stat && !control_overridden && !ai_override_enabled)
		if(user) to_chat(user, "<span class='warning'>You are locked out of the suit servo controller.</span>")
		return 0
	return 1

/obj/item/rig/proc/force_rest(var/mob/user)
	if(!ai_can_move_suit(user, check_user_module = 1))
		return
	wearer.lay_down()
	to_chat(user, "<span class='notice'>\The [wearer] is now [wearer.resting ? "resting" : "getting up"].</span>")

/obj/item/rig/proc/forced_move(var/direction, var/mob/user)
	if(malfunctioning)
		direction = pick(GLOB.cardinal)

	if(world.time < wearer_move_delay)
		return

	if(!wearer || !wearer.loc || !ai_can_move_suit(user, check_user_module = 1))
		return

	// AIs are a bit slower than regular and ignore move intent.
	wearer_move_delay = world.time + ai_controlled_move_delay

	cell.use(aimove_power_usage * CELLRATE)
	wearer.DoMove(direction, user)

// This returns the rig if you are contained inside one, but not if you are wearing it
/atom/proc/get_rig()
	if(loc)
		return loc.get_rig()
	return null

/obj/item/rig/get_rig()
	return src

/mob/living/carbon/human/get_rig()
	return wearing_rig

#undef ONLY_DEPLOY
#undef ONLY_RETRACT
#undef SEAL_DELAY
