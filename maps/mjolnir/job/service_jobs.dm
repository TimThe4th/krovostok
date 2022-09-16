	//////
///SERVICE///
   ///////

/datum/job/chaplain
	title = "Chaplain"
	department = "Auxiliary"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	minimum_character_age = list(SPECIES_HUMAN = 21)
	economic_power = 5
	minimal_player_age = 0
	supervisors = "the First Officer"
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/service/chaplain
	allowed_branches = list(
		/datum/mil_branch/civilian)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ)

	min_skill = list(SKILL_BUREAUCRACY = SKILL_BASIC)
	access = list(access_morgue, access_chapel_office, access_crematorium, access_solgov_crew, access_medical, access_maint_tunnels)

/datum/job/janitor
	title = "Street Cleaner"
	department = "Auxiliary"
	department_flag = SRV
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Firs Officer"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/service/janitor
	allowed_branches = list(
		/datum/mil_branch/civilian,
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)

	min_skill = list(   SKILL_HAULING = SKILL_BASIC)

	access = list(access_maint_tunnels, access_emergency_storage, access_janitor, access_solgov_crew, access_hangar)

/datum/job/chef
	title = "Chef"
	department = "Auxiliary"
	department_flag = SRV
	total_positions = 2
	spawn_positions = 2
	minimum_character_age = list(SPECIES_HUMAN = 18)
	supervisors = "the First Officer"
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/service/canworker
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)
	min_skill = list(   SKILL_COOKING   = SKILL_ADEPT,
	                    SKILL_BOTANY    = SKILL_BASIC,
	                    SKILL_CHEMISTRY = SKILL_BASIC)
	access = list(access_maint_tunnels, access_hydroponics, access_kitchen, access_solgov_crew, access_bar, access_commissary)

/datum/job/bartender
	title = "Bartender"
	department = "Auxiliary"
	department_flag = SRV
	total_positions = 2
	spawn_positions = 2
	minimum_character_age = list(SPECIES_HUMAN = 18)
	supervisors = "the First Officer"
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/service/canworker
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)
	min_skill = list(   SKILL_COOKING   = SKILL_ADEPT,
	                    SKILL_BOTANY    = SKILL_BASIC,
	                    SKILL_CHEMISTRY = SKILL_BASIC)
	access = list(access_maint_tunnels, access_hydroponics, access_kitchen, access_solgov_crew, access_bar, access_commissary)

/datum/job/farmer
	title = "Farmer"
	department = "Auxiliary"
	department_flag = SRV
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Executive Officer"
	economic_power = 6
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/torch/passenger/passenger
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/contractor
	)

/datum/job/merchant
	title = "Merchant"
	selection_color = "#fcb603"
	department = "Auxiliary"
	department_flag = SRV
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Executive Officer"
	economic_power = 6
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/torch/passenger/passenger
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/contractor
	)

/datum/job/ratcatcher
	title = "Rat Catcher"
	department = "Auxiliary"
	department_flag = SRV
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Executive Officer"
	economic_power = 6
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/torch/passenger/passenger
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/contractor
	)

