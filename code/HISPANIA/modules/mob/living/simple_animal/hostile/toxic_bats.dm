/mob/living/simple_animal/hostile/toxicbat
	name = "weird space bats"
	desc = "A swarm of weird looking bats."
	icon = 'icons/hispania/mob/animals.dmi'
	icon_state = "bat_tox"
	icon_living = "bat_tox"
	icon_dead = "bat_tox_dead"
	icon_gib = "bat_tox_dead"
	speak_chance = 0
	turns_per_move = 3
	butcher_results = list(/obj/item/reagent_containers/food/snacks/batmeat = 1)
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	speed = 4
	maxHealth = 20
	health = 20
	mob_size = MOB_SIZE_TINY
	harm_intent_damage = 8
	melee_damage_lower = 5
	melee_damage_upper = 5
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	emote_taunt = list("flutters")
	taunt_chance = 20
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	faction = list("scarybat")
	gold_core_spawnable = HOSTILE_SPAWN


/mob/living/simple_animal/hostile/toxicbat/Process_Spacemove(var/check_drift = 0)
	return ..()	//No drifting in space for space carp!

/mob/living/simple_animal/hostile/toxicbat/AttackingTarget()
	. =..()
	var/mob/living/L = .
	if(istype(L))
		if(prob(15))
			L.Stun(1)
			L.visible_message("<span class='danger'>\the [src] scares \the [L]!</span>")