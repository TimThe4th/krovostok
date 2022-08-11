#if !defined(using_map_DATUM)

	#include "mjolnir_cursed.dm"
	#include "mjolnir_define.dm"
	#include "mjolnir_lobby.dm"
	#include "mjolnir_setup.dm"

	#define using_map_DATUM /datum/map/mjolnir

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Nameless

#endif
