/datum/job/doctor
	title = "Doctor"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Surgeons and the Chief Medical Officer"
	economic_power = 7
	minimum_character_age = list(SPECIES_HUMAN = 18)
	minimal_player_age = 0
	selection_color = "#013d3b"
	alt_titles = list(
		"Nurse")
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/medical/doctor/fleet
	allowed_branches = list(
		/datum/mil_branch/larfleet,
		/datum/mil_branch/civilian = /decl/hierarchy/outfit/job/torch/crew/medical/doctor
	)
	allowed_ranks = list(
		/datum/mil_rank/larfleet/e3,
		/datum/mil_rank/larfleet/e4,
		/datum/mil_rank/larfleet/e5,
		/datum/mil_rank/civ/contractor
	)
	min_skill = list(   SKILL_EVA     = SKILL_BASIC,
	                    SKILL_MEDICAL = SKILL_BASIC,
	                    SKILL_ANATOMY = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)

	access = list(access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_eva, access_surgery, access_medical_equip, access_solgov_crew, access_hangar)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)
	skill_points = 22

/datum/job/medical_trainee
	title = "Medical Intern"
	department = "Medical"
	department_flag = MED
	total_positions = 1
	spawn_positions = 1
	supervisors = "Medical personnel, and the Chief Medical Officer"
	selection_color = "#013d3b"
	minimum_character_age = list(SPECIES_HUMAN = 18)

	outfit_type = /decl/hierarchy/outfit/job/torch/crew/medical/doctor
	allowed_branches = list(
		/datum/mil_branch/larfleet = /decl/hierarchy/outfit/job/torch/crew/medical/doctor/fleet,
		/datum/mil_branch/civilian
	)

	allowed_ranks = list(
		/datum/mil_rank/larfleet/e2,
		/datum/mil_rank/civ/contractor
	)

	skill_points = 4
	no_skill_buffs = TRUE

	min_skill = list(   SKILL_EVA     = SKILL_ADEPT,
	                    SKILL_HAULING = SKILL_ADEPT,
	                    SKILL_MEDICAL = SKILL_EXPERT,
	                    SKILL_ANATOMY = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)

	access = list(access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_surgery, access_medical_equip, access_solgov_crew)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)

/datum/job/medical_trainee/get_description_blurb()
	return "-"
/datum/job/chemist
	title = "Apothecary"
	department = "Medical"
	department_flag = MED
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Chief Medical Officer, the Corporate Liaison and Medical Personnel"
	selection_color = "#013d3b"
	economic_power = 4
	minimum_character_age = list(SPECIES_HUMAN = 21)
	minimal_player_age = 0
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/medical/contractor/chemist
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/contractor)
	min_skill = list(   SKILL_MEDICAL   = SKILL_ADEPT,
	                    SKILL_CHEMISTRY = SKILL_ADEPT)

	max_skill = list(   SKILL_MEDICAL     = SKILL_ADEPT,
						SKILL_ANATOMY	  = SKILL_ADEPT,
	                    SKILL_CHEMISTRY   = SKILL_MAX)
	skill_points = 16

	access = list(access_medical, access_maint_tunnels, access_emergency_storage, access_medical_equip, access_solgov_crew, access_chemistry,
	 						access_virology, access_morgue, access_crematorium)

/datum/job/chemist/get_description_blurb()
	return "-"

/datum/job/healer
	title = "Psi-Healer"
	department = "Medical"
	department_flag = MED
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Chief Medical Officer, the Corporate Liaison and Medical Personnel"
	selection_color = "#013d3b"
	economic_power = 4
	minimum_character_age = list(SPECIES_HUMAN = 21)
	minimal_player_age = 0
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/medical/contractor/chemist
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/contractor)
	min_skill = list(   SKILL_MEDICAL   = SKILL_ADEPT,
	                    SKILL_CHEMISTRY = SKILL_ADEPT)

	max_skill = list(   SKILL_MEDICAL     = SKILL_ADEPT,
						SKILL_ANATOMY	  = SKILL_ADEPT,
	                    SKILL_CHEMISTRY   = SKILL_MAX)
	skill_points = 16

	access = list(access_medical, access_maint_tunnels, access_emergency_storage, access_medical_equip, access_solgov_crew, access_chemistry,
	 						access_virology, access_morgue, access_crematorium)

/datum/job/chemist/get_description_blurb()
	return "-"