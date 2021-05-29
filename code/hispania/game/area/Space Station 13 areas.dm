/*
### Aqui encontraras la lista de areas personalizadas de hispania:

/area/CATEGORY/OR/DESCRIPTOR/NAME 	(puedes hacer cuantas divisiones como quieras)
	name = "NICE NAME" 				(nombre que sale en los GPS al estar ahi)
	icon = "ICON FILENAME" 			(aqui si tienes icono personalizado para el area, no es necesario)
	icon_state = "NAME OF ICON" 	(nombre del icono)
	requires_power = FALSE 			(predeterminado es TRUE)
	music = "music/music.ogg"		(musica al entrar en esta seccion)
*/

/area/shuttle/tsf
	name = "TSF Discovery"
	icon_state = "shuttle"

/area/fug_outdoors
	name = "??? Outdoors"
	icon_state = "bluenew"
	nad_allowed = TRUE
	outdoors = TRUE
	ambientsounds = SNOWY
	sound_environment = SOUND_AREA_LAVALAND

/area/fug_home
	name = "Stolen House"
	icon_state = "slime"
	nad_allowed = TRUE
	sound_environment = SOUND_AREA_WOODFLOOR

/area/shuttle/fug_shuttle
	name = "\improper Stolen Shuttle"
	icon_state = "blue"
	nad_allowed = TRUE
	parallax_movedir = SOUTH
