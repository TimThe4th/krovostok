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
	initial_gas = list(GAS_OXYGEN = MOLES_O2STANDARD, GAS_NITROGEN = MOLES_N2STANDARD)

/turf/simulated/floor/tiled/mjolnir_tiled
    name = "tiled floor"
    icon = 'maps/mjolnir/bos/icons/turfs/plitka.dmi'
    icon_state = "tiled"

/turf/simulated/floor/tiled/mjolnir_mono
    name = "mono floor"
    icon = 'maps/mjolnir/bos/icons/turfs/plitka.dmi'
    icon_state = "mono"

/turf/simulated/floor/tiled/mjolnir_mono2
    name = "mono floor"
    icon = 'maps/mjolnir/bos/icons/turfs/plitka.dmi'
    icon_state = "mono2"

/turf/simulated/floor/reinforced
    name = "reinforced floor"
    icon = 'maps/mjolnir/bos/icons/turfs/plitka.dmi'
    icon_state = "reinforced"

/turf/simulated/floor/tiled/mjolnir_kafel
    name = "kafel floor"
    icon = 'maps/mjolnir/bos/icons/turfs/plitka.dmi'
    icon_state = "kafel"

/turf/simulated/floor/tiled/mjolnir_kafel_b
    name = "black kafel floor"
    icon = 'maps/mjolnir/bos/icons/turfs/plitka.dmi'
    icon_state = "kafel_b"
