   /////
///CARGO///
   /////

/datum/job/qm
	title = "Depot Chief"
	department = "Depot"
	department_flag = SPT|SUP
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Commanding Officer"
	economic_power = 5
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 25)
	selection_color = "#755c48"
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/supply/deckofficer/fleet
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)
	skill_points = 20

	access = list(access_maint_tunnels, access_bridge, access_emergency_storage, access_tech_storage,  access_cargo, access_guppy_helm,
						access_cargo_bot, access_qm, access_mailsorting, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar,
						access_mining, access_mining_office, access_mining_station, access_commissary, access_gunnery, access_eva)

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/qm/get_description_blurb()
	return "Вы - Начальник Артилерии, а Вспомогательный отдел, шаттлы в Ангаре и все снаряды на судне - Ваши подданные. В Ваши обязанности входит наблюдение за тем, чтобы корабль был укомплектован, манифесты о полете составлены, боеголовки заряжены, шаттлы заправлены, а корабль оставался готов к новому космическому столкновению."

/datum/job/cargo_tech
	title = "Worker"
	department = "Auxiliary"
	department_flag = SUP
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Gunnery Chief"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	selection_color = "#755c48"
	alt_titles = list(
		"Shuttle Technician")
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/supply/contractor
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)

	access = list(access_maint_tunnels, access_emergency_storage, access_cargo, access_guppy_helm,
						access_cargo_bot, access_mailsorting, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar, access_commissary, access_gunnery, access_eva)

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/cargo_tech/get_description_blurb()
	return "Специалист по снабжению: Вашим прямым начальством является Начальник Артилерии. В Ваши обязанности входит заправка шаттлов, обеспечение доставки заказанных товаров, а также предоставление помощи Канониру в изготовлении боеголовок для космических сражений. \
	Канонир: В Ваши обязанности входит защита, хранение, транспортировка, изготовление боеголовок для космических сражений."

/datum/job/pilot
	title = "Shuttle Pilot"
	department = "Auxiliary"
	department_flag = SUP
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Gunnery Chief"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	selection_color = "#693a9c"
	alt_titles = list(
		"Shuttle Technician")
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/supply/contractor
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)

	access = list(access_maint_tunnels, access_emergency_storage, access_cargo, access_guppy_helm,
						access_cargo_bot, access_mailsorting, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar, access_commissary, access_gunnery, access_eva)

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/cargo_tech/get_description_blurb()
	return "Специалист по снабжению: Вашим прямым начальством является Начальник Артилерии. В Ваши обязанности входит заправка шаттлов, обеспечение доставки заказанных товаров, а также предоставление помощи Канониру в изготовлении боеголовок для космических сражений. \
	Канонир: В Ваши обязанности входит защита, хранение, транспортировка, изготовление боеголовок для космических сражений."

/datum/job/mining
	title = "Miner"
	department = "Auxiliary"
	department_flag = SUP
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Depot Chief"
	economic_power = 7
	minimum_character_age = list(SPECIES_HUMAN = 18)
	selection_color = "#755c48"
	alt_titles = list(
		"Scavenger" = /decl/hierarchy/outfit/job/torch/passenger/research/prospector/scav,
		"Archaeologist")

	min_skill = list(   SKILL_HAULING = SKILL_ADEPT,
	                    SKILL_EVA     = SKILL_BASIC,
	                    SKILL_PILOT   = SKILL_BASIC,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)

	outfit_type = /decl/hierarchy/outfit/job/torch/passenger/research/prospector
	allowed_branches = list(
	/datum/mil_branch/civilian,
	/datum/mil_branch/larfleet = /decl/hierarchy/outfit/job/torch/passenger/research/prospector/fleet)
	allowed_ranks = list( /datum/mil_rank/civ/civ)

	access = list(access_maint_tunnels, access_emergency_storage, access_mining, access_mining_office, access_mining_station,
						access_expedition_shuttle, access_guppy, access_hangar, access_guppy_helm, access_solgov_crew, access_cargo, access_eva)

/datum/job/mining/get_description_blurb()
	return "Член Полевой Поддержки: Вашим прямым начальством является Начальник Артилерии. В Ваши обязанности входит помощь и организация подспорья для Лорданианской экспансии, путем постройки баррикад и усиления обороны на подконтрольных ЛСС аванпостах.\
	Сборщик: В Ваши обязанности входит утилизация разрушенных кораблей, расхищение подозрительных объектов и получение прибыли, чего бы это ни стоило."

