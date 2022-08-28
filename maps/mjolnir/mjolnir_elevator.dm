/obj/turbolift_map_holder/mjolnir
	name = "mjolnir turbolift map placeholder"
	depth = 6
	lift_size_x = 4
	lift_size_y = 4

	areas_to_use = list(
		/area/turbolift/mjolnir_ground,
		/area/turbolift/mjolnir_first,
		/area/turbolift/mjolnir_second,
		/area/turbolift/mjolnir_third,
		/area/turbolift/mjolnir_fourth,
		/area/turbolift/mjolnir_top
		)


/obj/machinery/computer/shuttle_control/lift/cargo
	name = "cargo lift controls"
	shuttle_tag = "Primary Cargo Lift"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = 0

/obj/machinery/computer/shuttle_control/lift/robotics
	name = "robotics lift controls"
	shuttle_tag = "Robotics Lift"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = 0

/obj/machinery/computer/shuttle_control/lift/missile
	name = "robotics lift controls"
	shuttle_tag = "Missiles Lift"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = 0

/datum/shuttle/autodock/ferry/cargo_lift
	name = "Primary Cargo Lift"
	shuttle_area = /area/turbolift/cargo_lift
	warmup_time = 3
	waypoint_station = "nav_cargo_lift_top"
	waypoint_offsite = "nav_cargo_lift_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0

/datum/shuttle/autodock/ferry/robotics_lift
	name = "Robotics Lift"
	shuttle_area = /area/turbolift/robotics_lift
	warmup_time = 3
	waypoint_station = "nav_robotics_lift_top"
	waypoint_offsite = "nav_robotics_lift_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0

/datum/shuttle/autodock/ferry/missiles_lift
	name = "Missiles Lift"
	shuttle_area = /area/turbolift/missiles_lift
	warmup_time = 3
	waypoint_station = "nav_missiles_lift_top"
	waypoint_offsite = "nav_missiles_lift_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0

/obj/effect/shuttle_landmark/lift/cargo_top
	name = "Top Deck"
	landmark_tag = "nav_cargo_lift_top"
	base_area = /area/quartermaster/storage/upper
	base_turf = /turf/simulated/open

/obj/effect/shuttle_landmark/lift/cargo_bottom
	name = "Lower Deck"
	landmark_tag = "nav_cargo_lift_bottom"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/quartermaster/storage
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/lift/robotics_top
	name = "Top Deck"
	landmark_tag = "nav_robotics_lift_top"
	base_area = /area/assembly/robotics
	base_turf = /turf/simulated/open

/obj/effect/shuttle_landmark/lift/robotics_bottom
	name = "Lower Deck"
	landmark_tag = "nav_robotics_lift_bottom"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/assembly/robotics/lower
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/lift/missiles_top
	name = "Top Deck"
	landmark_tag = "nav_missiles_lift_top"
	base_area = /area/assembly/robotics
	base_turf = /turf/simulated/open

/obj/effect/shuttle_landmark/lift/missiles_bottom
	name = "Lower Deck"
	landmark_tag = "nav_missiles_lift_bottom"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/assembly/robotics/lower
	base_turf = /turf/simulated/floor/plating