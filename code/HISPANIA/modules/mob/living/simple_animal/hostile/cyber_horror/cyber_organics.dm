/mob/living/simple_animal/hostile/cyber_organic
	name = "human cyber horror"
	desc = "A horrific mix of organic tissue with nanomachines, theres no hope for what it use to be a human"
	icon = 'icons/hispania/mob/cyber_horror.dmi'
	icon_state = "cyber_horror"
	health = 130
	response_help = "pokes"
	response_disarm = "pushes aside"
	response_harm = "hits"
	obj_damage = 60
	melee_damage_lower = 15
	melee_damage_upper = 15
	obj_damage = 60
	faction = list("cyber")
	maxHealth = 130
	turns_per_move = 5
	see_in_dark = 8
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 270
	a_intent = INTENT_HARM
	bubble_icon = "machine"
	light_color = LIGHT_COLOR_CYAN
	light_range = 2
	light_power = 2.5
	turns_per_move = 5
	attacktext = "bites"
	del_on_death = 1
	loot = list(/obj/effect/decal/cleanable/robot_debris, /obj/item/stack/ore/bluespace_crystal)
	deathmessage = "blows apart!"
	attack_sound = 'sound/weapons/bladeslice.ogg'

/mob/living/simple_animal/hostile/cyber_organic/vox
	name = "vox cyber horror"
	desc = "A horrific mix of organic tissue with nanomachines, theres no hope for what it use to be a vox"
	icon_state = "vox_cyber_horror"

/mob/living/simple_animal/hostile/cyber_organic/plasmamen
	name = "plasmaman cyber horror"
	desc = "A horrific mix of organic tissue with nanomachines, theres no hope for what it use to be a plasmaman"
	icon_state = "plasma_cyber_horror"

/mob/living/simple_animal/hostile/cyber_organic/tajaran
	name = "tajaran cyber horror"
	desc = "A horrific mix of organic tissue with nanomachines, theres no hope for what it use to be a tajaran"
	icon_state = "tajaran_cyber_horror"

/mob/living/simple_animal/hostile/cyber_organic/grey
	name = "grey cyber horror"
	desc = "A horrific mix of organic tissue with nanomachines, theres no hope for what it use to be a grey"
	icon_state = "grey_cyber_horror"

/mob/living/simple_animal/hostile/cyber_organic/New()
	..()
	var/datum/effect_system/smoke_spread/smoke = new
	smoke.set_up(5, 0, src.loc)
	smoke.start()
	playsound(src.loc, 'sound/effects/empulse.ogg', 25, 1)

/mob/living/simple_animal/hostile/cyber_organic/emp_act()
	if(health > 1)
		adjustHealth(health-1)
	else
		death()
