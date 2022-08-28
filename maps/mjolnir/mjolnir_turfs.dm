/turf/simulated/floor
	name = "mud"
	icon = 'icons/bos/turf/vg.dmi'
	icon_state = "mud_light"
	base_name = "rock"
	base_desc = "rock."
	base_icon = 'icons/bos/turf/vg.dmi'
	base_icon_state = "rock_old"

/turf/simulated/floor/grass
	name = "grass"

/decl/flooring/grass
	flags = TURF_HAS_EDGES | TURF_HAS_CORNERS | TURF_CAN_BREAK | TURF_IS_FRAGILE | TURF_REMOVE_SHOVEL

/turf/simulated/floor/tiled
	name = "deck"

/decl/flooring/tiling
	name = "deck"

/turf/simulated/floor/shuttle_ceiling/torch
	color = COLOR_SOL

/turf/simulated/floor/shuttle_ceiling/torch/air
	initial_gas = list(GAS_OXYGEN = MOLES_O2STANDARD, GAS_NITROGEN = MOLES_N2STANDARD)