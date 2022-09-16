/datum/job/leadhunter
	title = "Chief Hunter"
	department = "Hunters"
	department_flag = HNT
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	supervisors = "the Research Director"
	selection_color = "#5f9486"
	minimal_player_age = 4
	economic_power = 7
	minimum_character_age = list(SPECIES_HUMAN = 21)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/exploration/pathfinder
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_ADEPT,
	                    SKILL_SCIENCE     = SKILL_ADEPT,
	                    SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERT,
	                    SKILL_WEAPONS     = SKILL_EXPERT)
	skill_points = 22

	access = list(
		access_pathfinder, access_explorer, access_eva, access_maint_tunnels, access_bridge, access_emergency_storage,
		access_guppy_helm, access_solgov_crew, access_expedition_shuttle, access_expedition_shuttle_helm, access_research,
		access_guppy, access_hangar, access_petrov_analysis, access_petrov, access_petrov_maint, access_petrov_helm, access_petrov_toxins, access_petrov_security
	)

	software_on_spawn = list(/datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/pathfinder/get_description_blurb()
	return "Вы - Руководитель Экспедиционных Работ. Ваша задача - организовывать экспедиции к отдаленным и неисследованным объектам. Вы же и управляете командой Исследователей, удостовреяясь, что вся команда полностью укомплектована. Кроме того, Вы пилотируете Харон, если пилота нет на смене. Отправляясь на задание, убедитесь, что всё, предоставляющее научный интерес будет доставлено в научную лабораторию на корабль."

/datum/job/hunter
	title = "Hunter"
	department = "Hunters"
	department_flag = HNT
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Commanding Officer, Executive Officer, and Exploration Operations Leader"
	selection_color = "#5f9486"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/research/scientist

	allowed_branches = list(/datum/mil_branch/civilian, /datum/mil_branch/lord)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor, /datum/mil_rank/lord/gov
	)
	min_skill = list(   SKILL_EVA = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERT,
	                    SKILL_WEAPONS     = SKILL_EXPERT)

	access = list(access_explorer, access_maint_tunnels, access_eva, access_emergency_storage,
		access_guppy_helm, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar, access_petrov_analysis, access_petrov, access_petrov_maint
	)

	software_on_spawn = list(/datum/computer_file/program/deck_management)

/datum/job/explorer/get_description_blurb()
	return "Полевой Ученый: Вашим прямым начальством является Руководитель Разведывательных Работ. В Ваши обязанности входит проведение экспериментов на территории исследуемых объектов, поиск артефактов неземного происхождения, анализ возможной флоры и фауны. Скорее всего, Вы столкнетесь с областями высокой опасности, агрессивными формами жизни, или сбойными системами защиты, так что смотрите в оба. \
	Экспедитор: В Ваши обязанности входит активное исследование объектов, поиск артефактов неземного происхождения, месторождений полезных ископаемых. \
	Ксеноархеолог: В Ваши обязанности входит проведение раскопок, изучение быта и культуры древних цивилизаций, анализ зловещих иероглифов и рун."

/datum/job/xenoexpert
	title = "Xeno Expert"
	department = "Hunters"
	department_flag = HNT
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Commanding Officer, Executive Officer, and Exploration Operations Leader"
	selection_color = "#5f9486"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/research/scientist

	allowed_branches = list(/datum/mil_branch/civilian, /datum/mil_branch/lord)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor, /datum/mil_rank/lord/gov
	)
	min_skill = list(   SKILL_EVA = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERT,
	                    SKILL_WEAPONS     = SKILL_EXPERT)

	access = list(access_explorer, access_maint_tunnels, access_eva, access_emergency_storage,
		access_guppy_helm, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar, access_petrov_analysis, access_petrov, access_petrov_maint
	)

	software_on_spawn = list(/datum/computer_file/program/deck_management)

/datum/job/explorer/get_description_blurb()
	return "Полевой Ученый: Вашим прямым начальством является Руководитель Разведывательных Работ. В Ваши обязанности входит проведение экспериментов на территории исследуемых объектов, поиск артефактов неземного происхождения, анализ возможной флоры и фауны. Скорее всего, Вы столкнетесь с областями высокой опасности, агрессивными формами жизни, или сбойными системами защиты, так что смотрите в оба. \
	Экспедитор: В Ваши обязанности входит активное исследование объектов, поиск артефактов неземного происхождения, месторождений полезных ископаемых. \
	Ксеноархеолог: В Ваши обязанности входит проведение раскопок, изучение быта и культуры древних цивилизаций, анализ зловещих иероглифов и рун."