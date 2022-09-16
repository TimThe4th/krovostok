/datum/map/mjolnir
	name = "Nova Cuba"
	full_name = "Nova Cuba"
	path = "mjolnir"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK

	usable_email_tlds = list("inax.lssf.mil", "inax.lordgov", "freemail.net", "gilgamesh.navy.mil", "inax.oorah.mil")

	allowed_spawns = list("Cryogenic Storage", "Cyborg Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "Nova Cuba"
	station_short = "Nova Cuba"
	dock_name     = "TBD"
	boss_name     = "Lordanian Sovereign Systems Government"
	boss_short    = "LordGov"
	company_name  = "Lordanian Sovereign Systems"
	company_short = "LSS"

	map_admin_faxes = list("Inax Territorial  Administration")

	evac_controller_type = /datum/evacuation_controller/shuttle
	use_overmap = 0
	num_exoplanets = 0

	away_site_budget = 3.5

	station_levels = list(1, 2, 3)
	contact_levels = list(1, 2, 3)
	player_levels = list(1, 2, 3)

	admin_levels = list(4)
	escape_levels = list(5)
	empty_levels = list(6)
	accessible_z_levels = list(1, 2, 3)