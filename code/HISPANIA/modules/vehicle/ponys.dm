/obj/vehicle/space/pony
	name = "Pony-Bike"
	desc = "A cool looking heavily modified speedbike only for the most robust and manly people on the station"
	icon = 'icons/hispania/obj/pony.dmi'
	icon_state = "vinyl"
	vehicle_move_delay = 0
	generic_pixel_x = 0
	generic_pixel_y = 4
	var/overlay_state = "vinyl_cover"
	var/mutable_appearance/overlay


/obj/vehicle/space/pony/Initialize(mapload)
	. = ..()
	overlay = mutable_appearance(icon, overlay_state, ABOVE_MOB_LAYER)
	add_overlay(overlay)

/obj/vehicle/space/pony/Move(newloc,move_dir)
	if(has_buckled_mobs())
		new /obj/effect/temp_visual/dir_setting/pony_trail(loc)
	. = ..()

/obj/effect/temp_visual/dir_setting/pony_trail
	name = "pony trails"
	icon = 'icons/hispania/obj/pony.dmi'
	icon_state = "pony_magic"
	duration = 10
	randomdir = FALSE
	layer = MOB_LAYER - 0.2

/obj/vehicle/space/pony/pony_vinyl
	name = "Vinyl Pony-Bike"

/obj/vehicle/space/pony/pony_rainbowdash
	name = "Rainbow Dash Pony-Bike"
	icon_state = "rainbow"
	overlay_state = "rainbow_cover"

/obj/vehicle/space/pony/pony_rarity
	name = "Rarity Pony-Bike"
	icon_state = "rarity"
	overlay_state = "rarity_cover"

/obj/vehicle/space/pony/pony_pinkie
	name = "Pinkie Pony-Bike"
	icon_state = "pinkie"
	overlay_state = "pinkie_cover"

/obj/vehicle/space/pony/pony_flutter
	name = "Fluttershy Pony-Bike"
	icon_state = "fluttershy"
	overlay_state = "fluttershy_cover"

/obj/vehicle/space/pony/pony_apple
	name = "Applejack Pony-Bike"
	icon_state = "applejack"
	overlay_state = "applejack_cover"

/obj/vehicle/space/pony/pony_twilight
	name = "Twilight Pony-Bike"
	icon_state = "twilight"
	overlay_state = "twilight_cover"