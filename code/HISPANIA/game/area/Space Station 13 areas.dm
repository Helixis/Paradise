/*

### Aqui encontraras la lista de areas personalizadas de hispania:

/area/CATEGORY/OR/DESCRIPTOR/NAME 	(puedes hacer cuantas divisiones como quieras)
	name = "NICE NAME" 				(nombre que sale en los GPS al estar ahi)
	icon = "ICON FILENAME" 			(aqui si tienes icono personalizado para el area, no es necesario)
	icon_state = "NAME OF ICON" 	(nombre del icono)
	requires_power = FALSE 			(predeterminado es TRUE)
	music = "music/music.ogg"		(musica al entrar en esta seccion)

*/

area/shuttle/tsf
	name = "TSF Discovery"
	icon_state = "shuttle"

/area/snowland
	icon_state = "Naga"
	has_gravity = TRUE

/area/snowland/explored
	name = "Naga Surface"
	icon_state = "explored"
	music = null
	always_unpowered = TRUE
	requires_power = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	outdoors = TRUE
	ambientsounds = list('sound/ambience/ambimine.ogg')
	flags = NONE

/area/snowland/unexplored
	name = "Naga Surface"
	icon_state = "unexplored"
	music = null
	always_unpowered = TRUE
	requires_power = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	outdoors = TRUE
	ambientsounds = list('sound/ambience/ambimine.ogg')
	flags = NONE

/area/TSF_Outpost
	name = "TSF Outpost"
	icon_state = "mining"
	has_gravity = TRUE

/area/TSF_Outpost/Docking
	name = "TSF Outpost Docking Area"
	icon_state = "yellow"

/area/TSF_Outpost/Kitchen
	name = "TSF Outpost Kitchen"
	icon_state = "kitchen"

/area/TSF_Outpost/Chapel
	name = "TSF Outpost Chapel"
	icon_state = "chapel"
	ambientsounds = list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg','sound/ambience/ambicha4.ogg','sound/music/traitor.ogg')

/area/TSF_Outpost/Hallway
	name = "TSF Outpost Central Hallway"
	icon_state = "escape"

/area/TSF_Outpost/Medbay
	name = "TSF Outpost Medbay"
	icon_state = "medbay"
	music = 'sound/ambience/signal.ogg'

/area/TSF_Outpost/Exterior
	name = "TSF Outpost Exterior Access"
	icon_state = "storage"

/area/TSF_Outpost/CrewDorms
	name = "TSF Outpost Crew Dorms"
	icon_state = "dorms"

/area/TSF_Outpost/CrewShower
	name = "TSF Outpost Crew Showers"
	icon_state = "toilet"

/area/NT_Polar_Outpost
	name = "NT Naga Research Facility"
	icon_state = "DJ"
	has_gravity = TRUE

/area/NT_Polar_Outpost/mining
	name = "RO Naga Mining"
	icon_state = "mining"

/area/NT_Polar_Outpost/crew
	name = "RO Naga Crew Quarters"
	icon_state = "fitness"

/area/NT_Polar_Outpost/engineering
	name = "RO Naga Engineering"
	icon_state = "construction"

/area/NT_Polar_Outpost/centrall_hall
	name = "RO Central Hall"
	icon_state = "interrogationhall"

/area/NT_Polar_Outpost/research
	name = "RO Research"
	icon_state = "medresearch"

/area/NT_Polar_Outpost/gate_failure
	name = "RO Gateway Prototype"
	icon_state = "teleporter"