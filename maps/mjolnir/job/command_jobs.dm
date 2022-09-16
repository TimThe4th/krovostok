/datum/job/captain
	title = "Supreme Supervisor"
	supervisors = "Operational Headquarters and your conscience"
	minimal_player_age = 14
	economic_power = 15
	minimum_character_age = list(SPECIES_HUMAN = 40)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/CO
	allowed_branches = list(
		/datum/mil_branch/lord
	)
	allowed_ranks = list(
		/datum/mil_rank/lord/chr
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_ADEPT,
	                    SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/captain/get_description_blurb()
	return "Ты - Командующий Офицер. Выше тебя только Оперативный Штаб, военно-полевой суд, ну и морально-этические нормы, с чем ты можешь спорить.\
	Ты опытный и эффективный руководитель и менеджер прекрасного корабля Лордании, и именно с тебя будет спрос за всё, что происходит с ним, либо на нём.\
	Твоя задача состоит в том, чтобы [GLOB.using_map.full_name] в полной мере выполнял свою боевую задачу - разведку территорий.\
	 Пользуйтесь помощью Первого Офицера, глав отделов , (и вашего политрука) для эффективного управления кораблём, но не пренебрегайте собственным опытом."
/datum/job/captain/post_equip_rank(var/mob/person, var/alt_title)
	var/sound/announce_sound = (GAME_STATE <= RUNLEVEL_SETUP)? null : sound('sound/misc/boatswain.ogg', volume=20)
	captain_announcement.Announce("All hands, [alt_title || title] [person.real_name] on deck!", new_sound = announce_sound)
	..()

/datum/job/mayor
	title = "Mayor"
	supervisors = "Operational Headquarters and your conscience"
	department_flag = COM
	minimal_player_age = 14
	economic_power = 15
	minimum_character_age = list(SPECIES_HUMAN = 40)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/CO
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_ADEPT,
	                    SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/captain/get_description_blurb()
	return "Ты - Командующий Офицер. Выше тебя только Оперативный Штаб, военно-полевой суд, ну и морально-этические нормы, с чем ты можешь спорить.\
	Ты опытный и эффективный руководитель и менеджер прекрасного корабля Лордании, и именно с тебя будет спрос за всё, что происходит с ним, либо на нём.\
	Твоя задача состоит в том, чтобы [GLOB.using_map.full_name] в полной мере выполнял свою боевую задачу - разведку территорий.\
	 Пользуйтесь помощью Первого Офицера, глав отделов , (и вашего политрука) для эффективного управления кораблём, но не пренебрегайте собственным опытом."
/datum/job/captain/post_equip_rank(var/mob/person, var/alt_title)
	var/sound/announce_sound = (GAME_STATE <= RUNLEVEL_SETUP)? null : sound('sound/misc/boatswain.ogg', volume=20)
	captain_announcement.Announce("All hands, [alt_title || title] [person.real_name] on deck!", new_sound = announce_sound)
	..()


/datum/job/hos
	title = "Sheriff of Militia"
	department_flag = SEC
	supervisors = "the Commanding Officer and the First Officer"
	economic_power = 8
	minimal_player_age = 14
	minimum_character_age = list(SPECIES_HUMAN = 25)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/cos
	allowed_branches = list(
		/datum/mil_branch/larfleet,
	)
	allowed_ranks = list(
		/datum/mil_rank/larfleet/o3,
		/datum/mil_rank/larfleet/o4
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)
	skill_points = 28

	access = list(access_security, access_brig, access_armory, access_forensics_lockers,
			            access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_teleporter, access_eva, access_bridge, access_heads,
			            access_hos, access_RC_announce, access_keycard_auth, access_sec_doors,
			            access_solgov_crew, access_gun, access_emergency_armory, access_hangar, access_petrov, access_petrov_security, access_gunnery)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/hos/get_description_blurb()
	return "-"

/datum/job/terrep
	title = "Diplomat"
	department = "Support"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "Operational Headquarters and Terran Embassy Command"
	selection_color = "#b00000"
	minimal_player_age = 14
	economic_power = 16
	minimum_character_age = list(SPECIES_HUMAN = 25)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/terrep
	allowed_branches = list(
		/datum/mil_branch/terran
	)
	allowed_ranks = list(
		/datum/mil_rank/terran/o3
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_SCIENCE     = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_BASIC)

	max_skill = list(   SKILL_BUREAUCRACY       = SKILL_MAX,
	                    SKILL_FINANCE     = SKILL_MAX)
	skill_points = 20

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	access = list(access_representative, access_maint_tunnels, access_bridge, access_solgov_crew)


/datum/job/terrep/get_description_blurb()
	return "-"

/datum/job/terrep/post_equip_rank(var/mob/person, var/alt_title)
	var/my_title = "\a ["\improper [(person.mind ? (person.mind.role_alt_title ? person.mind.role_alt_title : person.mind.assigned_role) : "Representative's Guard")]"]"
	for(var/mob/M in GLOB.player_list)
		if(M.client && M.mind)
			if(M.mind.assigned_role == "Guard")
				to_chat(M, SPAN_NOTICE("<b>Your supervisor, [my_title] named [person.real_name], is present on [GLOB.using_map.full_name].</b>"))
	..()

/datum/job/terguard
	title = "Guard"
	department = "Support"
	department_flag = SPT
	total_positions = 2
	spawn_positions = 2
	supervisors = "the ICCG Representative"
	selection_color = "#b00000"
	economic_power = 12
	minimal_player_age = 2
	minimum_character_age = list(SPECIES_HUMAN = 25)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/ter_bodyguard
	allowed_branches = list(/datum/mil_branch/terran)
	allowed_ranks = list(
		/datum/mil_rank/terran/e4,
		/datum/mil_rank/terran/e6)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_BASIC)
	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX,
	                    SKILL_BUREAUCRACY = SKILL_MAX)
	skill_points = 24
	access = list(access_representative, access_maint_tunnels, access_bridge, access_solgov_crew, access_sec_guard)
	defer_roundstart_spawn = TRUE

/datum/job/terguard/is_position_available()
	if(..())
		for(var/mob/M in GLOB.player_list)
			if(M.client && M.mind && M.mind.assigned_role == "Diplomat")
				return TRUE
	return FALSE

/datum/job/terguard/get_description_blurb()
	return "-"

/datum/job/terguard/post_equip_rank(var/mob/person, var/alt_title)
	var/my_title = "\a ["\improper [(person.mind ? (person.mind.role_alt_title ? person.mind.role_alt_title : person.mind.assigned_role) : "Representative's Guard")]"]"
	for(var/mob/M in GLOB.player_list)
		if(M.client && M.mind)
			if(M.mind.assigned_role == "Diplomat")
				to_chat(M, SPAN_NOTICE("<b>Your Guard, [my_title] named [person.real_name], is present on [GLOB.using_map.full_name].</b>"))
	..()

/datum/job/komissar
	title = "Agent"
	department = "Militia"
	department_flag = SEC
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Commanding Officer and the First Officer"
	selection_color = "#2f2f7f"
	minimal_player_age = 6
	economic_power = 8
	minimum_character_age = list(SPECIES_HUMAN = 35)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/sea/fleet
	allowed_branches = list(
		/datum/mil_branch/lord
	)
	allowed_ranks = list(
		/datum/mil_rank/lord/kgb = /decl/hierarchy/outfit/job/torch/crew/command/sea/fleet/kgb //cursed af
	)
	min_skill = list(   SKILL_EVA        = SKILL_BASIC,
	                    SKILL_COMBAT     = SKILL_BASIC,
	                    SKILL_WEAPONS    = SKILL_ADEPT)

	max_skill = list(   SKILL_COMBAT       = SKILL_MAX,
	                    SKILL_WEAPONS      = SKILL_MAX,
	                    SKILL_PILOT        = SKILL_MAX,
	                    SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX)
	skill_points = 24


	access = list(access_medical, access_engine, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_teleporter, access_eva, access_bridge, access_all_personal_lockers, access_janitor,
			            access_kitchen, access_cargo, access_RC_announce, access_keycard_auth, access_guppy_helm,
			            access_solgov_crew, access_gun, access_expedition_shuttle, access_guppy, access_senadv, access_hangar, access_emergency_armory, access_gunnery, access_security)

	software_on_spawn = list(/datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)
