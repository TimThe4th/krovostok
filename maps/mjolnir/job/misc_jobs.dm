/********
Synthetic
********/

/datum/job/cyborg
	total_positions = 3
	spawn_positions = 3
	supervisors = "your laws"
	minimal_player_age = 6
	allowed_ranks = list(
		/datum/mil_rank/civ/synthetic
	)

/datum/job/ai
	minimal_player_age = 8
	allowed_ranks = list(
		/datum/mil_rank/civ/synthetic
	)

/*******
Civilian
*******/

/datum/job/assistant
	title = "Civilian"
	total_positions = -1
	spawn_positions = -1
	supervisors = "the Executive Officer"
	economic_power = 6
	announced = FALSE
	alt_titles = list(
		"Off-Duty" = /decl/hierarchy/outfit/job/torch/crew/service/crewman,
		"Villager",
		"Journalist" = /decl/hierarchy/outfit/job/torch/passenger/passenger/journalist,
		"Investor" = /decl/hierarchy/outfit/job/torch/passenger/passenger/investor,
		"Psychologist" = /decl/hierarchy/outfit/job/torch/passenger/passenger/psychologist,
		"Chronicler" = /decl/hierarchy/outfit/job/torch/passenger/passenger/journalist,
		"Historian",
		"Naturalist",
		"Ecologist",
		"Entertainer",
		"Independent Observer",
		"Sociologist",
		"Trainer",
		"Assistant")
	outfit_type = /decl/hierarchy/outfit/job/torch/passenger/passenger
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)

/datum/job/outsider
	title = "Outsider"
	department = "Civilian"
	department_flag = CIV
	total_positions = 2
	spawn_positions = 2
	ideal_character_age = 30
	supervisors = "nobody"
	minimal_player_age = 0
	create_record = 0
	account_allowed = 0
	economic_power = 0
	allowed_branches = list(
		/datum/mil_branch/civilian,
		/datum/mil_branch/alien
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/alien
	)
	latejoin_at_spawnpoints = 1
	announced = FALSE
	access = list(access_maint_tunnels, access_emergency_storage)

/datum/job/beggar
	title = "Beggar"
	department = "Civilian"
	department_flag = CIV
	total_positions = 2
	spawn_positions = 2
	ideal_character_age = 30
	supervisors = "nobody"
	minimal_player_age = 0
	create_record = 0
	account_allowed = 0
	economic_power = 0
	allowed_branches = list(
		/datum/mil_branch/civilian,
		/datum/mil_branch/alien
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/alien
	)
	latejoin_at_spawnpoints = 1
	announced = FALSE
	access = list(access_maint_tunnels, access_emergency_storage)

/datum/job/scientist
	title = "Scholar"
	department = "Civilian"
	selection_color = "#693a9c"
	department_flag = CIV
	total_positions = 2
	spawn_positions = 2
	ideal_character_age = 30
	supervisors = "nobody"
	minimal_player_age = 0
	create_record = 0
	account_allowed = 0
	economic_power = 0
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)
	latejoin_at_spawnpoints = 1
	announced = FALSE
	access = list(access_maint_tunnels, access_emergency_storage)
