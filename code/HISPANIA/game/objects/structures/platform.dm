//Platform Code by Danaleja2005

/obj/structure/platform
    name = "Metal Platform"
    icon = 'icons\hispania\obj\platform.dmi'
    icon_state = "metal"
    desc =  " A metal platform"
    anchored = TRUE
    can_be_unanchored = FALSE

/obj/structure/platform/metal2
    name = "Metal Platform 2"
    icon_state = "metal2"

/obj/machinery/door/platform/CanPass(atom/movable/mover, turf/target, height=0)
	if(get_dir(loc, target) == dir) //Make sure looking at appropriate border
		return !density
	else
		return 1

///Corners

/obj/structure/platform/corner
    name = "Metal Platform Corner"
    icon_state = "metalcorner"
    desc =  " A metal platform corner"

/obj/structure/platform/metal2/corner 
    name = "Metal Platform 2"
    desc =  " A metal platform corner"
    icon_state = "metalcorner2"
    

