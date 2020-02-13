/mob/living/simple_animal/hostile/cucaracha
	name = "cucaracha"
	desc = "You pick the wrong maint fool!"
	icon = 'icons/hispania/mob/animals.dmi'
	icon_state = "cucaracha"
	icon_living = "cucaracha"
	icon_dead = "cucaracha_dead"
	var/throw_message = "does nothing to the tough dual energy sword of"
	health = 700		//Descuida solo un golpe con el flyswatter y muere
	maxHealth = 700
	speed = 10
	melee_damage_lower = 25
	melee_damage_upper = 25
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 270
	obj_damage = 50   //Tiene una espada laser, claro que rompe cosas
	attack_sound = 'sound/weapons/blade1.ogg'
	maxbodytemp = INFINITY
	pass_flags = PASSTABLE | PASSGRILLE
	mob_size = MOB_SIZE_TINY
	response_help  = "pokes"
	response_disarm = "shoos"
	response_harm   = "hits"
	attacktext = "slices"
	ventcrawler = VENTCRAWLER_ALWAYS //Es una cucaracha, claro que entra en la ventilacion
	var/point_return = 9 //Variable ocupada para poder reflejar
	flags_2 = CHECK_RICOCHET_2	//Funcion super rara para reflect

/mob/living/simple_animal/hostile/cucaracha/can_die()
	return ..() && !SSticker.cinematic //No puedes matar a una cucaracha con una nuke

/mob/living/simple_animal/hostile/cucaracha/Process_Spacemove(var/movement_dir) //Las cucarachas pueden volar en el espacio
	return TRUE

/mob/living/simple_animal/hostile/cucaracha/ex_act() //No intentes matar una cucaracha con explosivos
	return

/mob/living/simple_animal/hostile/cucaracha/attackby(obj/item/C, mob/user, mob/living/simple_animal/hostile/M)
	if(istype(C, /obj/item/melee/flyswatter))
		death()

/mob/living/simple_animal/hostile/cucaracha/hitby(atom/movable/AM, skipcatch, hitpush, blocked, datum/thrownthing/throwingdatum) //No meta throw
    if(istype(AM, /obj/item))
        var/obj/item/T = AM
        if(!stat)
            Aggro()
        if(T.throwforce <= 20)
            visible_message("<span class='notice'>The [T.name] [throw_message] [src.name]!</span>")
            return
    ..()

/mob/living/simple_animal/hostile/cucaracha/handle_ricochet(obj/item/projectile/P)   ///Funciones complejas de reflejar
	var/turf/p_turf = get_turf(P)
	var/face_direction = get_dir(src, p_turf)
	var/face_angle = dir2angle(face_direction)
	var/incidence_s = GET_ANGLE_OF_INCIDENCE(face_angle, (P.Angle + 180))
	if(abs(incidence_s) > 90 && abs(incidence_s) < 270)
		return FALSE
	var/new_angle_s = SIMPLIFY_DEGREES(face_angle + incidence_s)
	P.setAngle(new_angle_s)
	visible_message("<span class='warning'>[P] reflects off [src]!</span>")
	return TRUE