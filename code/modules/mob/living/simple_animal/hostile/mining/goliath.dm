#define ANCIENT 3
#define ADULT 2
#define SUBADULT 1
#define JUVENILE 0
#define WILD 0
#define PASSIVE 1
#define TAMED 2
#define NOT_DRACONIAN 0
#define DRACONIAN 1
#define FULL_DRACONIAN 2
#define MEAT /obj/item/reagent_containers/food/snacks/monstermeat
#define CORE /obj/item/organ/internal/regenerative_core
#define FLORA /obj/item/reagent_containers/food/snacks/grown/ash_flora
#define ORGANS /obj/item/organ/internal
#define DIAMOND /obj/item/stack/ore/diamond
#define CYBERORGAN /obj/item/organ/internal/cyberimp
#define DRAGONSBLOOD /obj/item/dragons_blood
#define GROWTH_MAX 1200

//A slow but strong beast that tries to stun using its tentacles
/mob/living/simple_animal/hostile/asteroid/goliath
	name = "goliath"
	desc = "A massive beast that uses long tentacles to ensare its prey, threatening them is not advised under any conditions."
	icon = 'icons/mob/lavaland/lavaland_monsters.dmi'
	icon_state = "Goliath"
	icon_living = "Goliath"
	icon_aggro = "Goliath_alert"
	icon_dead = "Goliath_dead"
	icon_gib = "syndicate_gib"
	mouse_opacity = MOUSE_OPACITY_ICON
	move_to_delay = 40
	ranged = TRUE
	ranged_cooldown_time = 120
	friendly = "wails at"
	speak_emote = list("bellows")
	vision_range = 4
	speed = 3
	maxHealth = 300
	health = 300
	harm_intent_damage = 1 //Only the manliest of men can kill a Goliath with only their fists.
	obj_damage = 100
	melee_damage_lower = 25
	melee_damage_upper = 25
	attacktext = "pulverizes"
	attack_sound = 'sound/weapons/punch1.ogg'
	throw_message = "does nothing to the rocky hide of the"
	vision_range = 5
	aggro_vision_range = 9
	move_force = MOVE_FORCE_VERY_STRONG
	move_resist = MOVE_FORCE_VERY_STRONG
	pull_force = MOVE_FORCE_VERY_STRONG
	gender = NEUTER
	sentience_type = SENTIENCE_OTHER
	var/pre_attack = FALSE
	var/pre_attack_icon = "Goliath_preattack"
	loot = list(/obj/item/stack/sheet/animalhide/goliath_hide, /obj/item/reagent_containers/food/snacks/monstermeat/goliath)

/mob/living/simple_animal/hostile/asteroid/goliath/Life()
	. = ..()
	handle_preattack()
	if(!stat && getBruteLoss()) // Regens health slowly
		adjustBruteLoss(-0.5)
		if(prob(70) && tame_progress != TAMED && tame_progress >= 1 && (growth_stage != ADULT && growth_stage != ANCIENT)) // Lose taming progress if you were hurt
			tame_progress--
	if(growth <= 1199 && (growth_stage != ADULT && growth_stage != ANCIENT)) // Juvenile goliath related things.
		if(!stat)
			growth++
			if(tame_progress >= 1 && tame_stage != TAMED) // Lose tame progress overtime.
				tame_progress--
			if(feed_cooldown >= 1) // Lower the cooldown to be fed
				feed_cooldown--
			handle_tame_progress()
			handle_growth()
		if((stat == DEAD) && (tame_stage != TAMED)) // So that 1) an ancient goliath can't immediately spawn another juvenile goliath if it dies, and 2) can't easily cheese the juvenile goliath taming process
			if(prob(10))
					// 10% chance every cycle to decompose
				visible_message("<span class='notice'>\The dead body of the [src] decomposes!</span>")
				gib()
			if(tame_stage != TAMED) // Tame progress is reset unles it was tamed.
				tame_progress = 0
	if(!target && leader && prob(70) && !stat && leader.stat != DEAD && tame_stage == WILD) // Stick around your ancient goliath if you're not chasing after anything and aren't being tamed
		var/turf/T = get_turf(leader)
		var/list/surrounding_turfs = block(locate(T.x - 1, T.y - 1, T.z), locate(T.x + 1, T.y + 1, T.z))
		if(!surrounding_turfs.len)
			return
		if(get_dist(src, T) <= 6)
			return
		if(isturf(loc) && get_dist(src, T) <= 50)
			LoseTarget()
			Goto(pick(surrounding_turfs), move_to_delay)
			return

/mob/living/simple_animal/hostile/asteroid/goliath/revive()
	..()
	anchored = TRUE
	add_draconian_effect(draconian_overlay)

/mob/living/simple_animal/hostile/asteroid/goliath/proc/handle_preattack()
	if(ranged_cooldown <= world.time + ranged_cooldown_time * 0.25 && !pre_attack)
		pre_attack++
	if(!pre_attack || stat || AIStatus == AI_IDLE)
		return
	icon_state = pre_attack_icon

/mob/living/simple_animal/hostile/asteroid/goliath/death(gibbed)
	move_force = MOVE_FORCE_DEFAULT
	move_resist = MOVE_RESIST_DEFAULT
	pull_force = PULL_FORCE_DEFAULT
	..(gibbed)

/mob/living/simple_animal/hostile/asteroid/goliath/OpenFire()
	var/extra_tentacles = 0
	var/tturf = get_turf(target)
	if(!isturf(tturf))
		return
	if(get_dist(src, target) <= 7)//Screen range check, so you can't get tentacle'd offscreen
		if((aux_tentacles != 0) || (growth_stage == JUVENILE && draconian != NOT_DRACONIAN))
			visible_message("<span class='warning'>[src] digs its tentacles under [target]!</span>")
		else
			visible_message("<span class='warning'>[src] digs a tentacle under [target]!</span>")
		if((draconian != NOT_DRACONIAN) || (growth_stage == ANCIENT)) // Ancient goliaths or draconian goliaths get +1 tentacles.
			extra_tentacles = 1
		new /obj/effect/temp_visual/goliath_tentacle/original(tturf, src, (aux_tentacles + extra_tentacles))
		ranged_cooldown = world.time + ranged_cooldown_time
		icon_state = icon_aggro
		pre_attack = FALSE

/mob/living/simple_animal/hostile/asteroid/goliath/adjustHealth(amount, updating_health = TRUE)
	if(amount > 0)
		ranged_cooldown -= 10
		handle_preattack()
	. = ..()

/mob/living/simple_animal/hostile/asteroid/goliath/Aggro()
	vision_range = aggro_vision_range
	handle_preattack()
	if(icon_state != icon_aggro)
		icon_state = icon_aggro

//Lavaland Goliath
/mob/living/simple_animal/hostile/asteroid/goliath/beast
	name = "goliath"
	desc = "A hulking, armor-plated beast with long tendrils arching from its back."
	icon = 'icons/mob/lavaland/lavaland_monsters.dmi'
	icon_state = "goliath"
	icon_living = "goliath"
	icon_aggro = "goliath"
	icon_dead = "goliath_dead"
	throw_message = "does nothing to the tough hide of the"
	pre_attack_icon = "goliath2"
	crusher_loot = /obj/item/crusher_trophy/goliath_tentacle
	butcher_results = list(/obj/item/reagent_containers/food/snacks/monstermeat/goliath = 2, /obj/item/stack/sheet/animalhide/goliath_hide = 1, /obj/item/stack/sheet/bone = 2)
	loot = list()
	stat_attack = UNCONSCIOUS
	robust_searching = TRUE

/mob/living/simple_animal/hostile/asteroid/goliath/beast/random/Initialize(mapload)
	. = ..()
	if(prob(1))
		new /mob/living/simple_animal/hostile/asteroid/goliath/beast/ancient(loc)
	else if(prob(10))
		new /mob/living/simple_animal/hostile/asteroid/goliath/juvenile(loc)
	return INITIALIZE_HINT_QDEL

/mob/living/simple_animal/hostile/asteroid/goliath/beast/ancient
	name = "ancient goliath"
	desc = "Goliaths are biologically immortal, and rare specimens have survived for centuries. This one is clearly ancient, and its tentacles constantly churn the earth around it."
	icon_state = "Goliath"
	icon_living = "Goliath"
	icon_aggro = "Goliath_alert"
	icon_dead = "Goliath_dead"
	maxHealth = 400
	health = 400
	speed = 4
	pre_attack_icon = "Goliath_preattack"
	throw_message = "does nothing to the rocky hide of the"
	loot = list(/obj/item/stack/sheet/animalhide/goliath_hide) //A throwback to the asteroid days
	butcher_results = list(/obj/item/reagent_containers/food/snacks/monstermeat/goliath = 2, /obj/item/stack/sheet/bone = 2)
	crusher_drop_mod = 30
	wander = FALSE
	growth_stage = ANCIENT
	var/list/cached_tentacle_turfs
	var/turf/last_location
	var/tentacle_recheck_cooldown = 100
	var/goliaths_owned = 0

/mob/living/simple_animal/hostile/asteroid/goliath/beast/ancient/Life()
	. = ..()
	if(!.) // dead
		return
	if(isturf(loc))
		if(!LAZYLEN(cached_tentacle_turfs) || loc != last_location || tentacle_recheck_cooldown <= world.time)
			LAZYCLEARLIST(cached_tentacle_turfs)
			last_location = loc
			tentacle_recheck_cooldown = world.time + initial(tentacle_recheck_cooldown)
			for(var/turf/simulated/floor/T in orange(4, loc))
				LAZYADD(cached_tentacle_turfs, T)
		for(var/t in cached_tentacle_turfs)
			if(isfloorturf(t))
				if(prob(10))
					new /obj/effect/temp_visual/goliath_tentacle(t, src)
			else
				cached_tentacle_turfs -= t
	if(target && prob(20) && goliaths_owned <= 2) // Spawn juvenile goliaths to aid in combat. Maximum of 3.
		var/mob/living/simple_animal/hostile/asteroid/goliath/juvenile/G = new /mob/living/simple_animal/hostile/asteroid/goliath/juvenile(loc)
		G.admin_spawned = admin_spawned
		G.GiveTarget(target)
		G.friends = friends
		G.faction = faction.Copy()
		visible_message("<span class='warning'>[src]'s matter splits off to form a smaller monster!</span>")
		goliaths_owned++
		G.leader = src
	if(stat != DEAD && goliaths_owned <= 4) // Pick up stray juveniles and subadults for a max of 5, up from 3 it can spawn
		for(var/mob/living/simple_animal/hostile/asteroid/goliath/S in range(7,src))
			if((S.leader == null || S.leader.stat == DEAD) && S.tame_stage == WILD && (S.growth_stage != ADULT && S.growth_stage != ANCIENT))
				S.leader = src
				goliaths_owned++

/mob/living/simple_animal/hostile/asteroid/goliath/beast/tendril
	fromtendril = TRUE

//Tentacles
/obj/effect/temp_visual/goliath_tentacle
	name = "goliath tentacle"
	icon = 'icons/mob/lavaland/lavaland_monsters.dmi'
	icon_state = "Goliath_tentacle_spawn"
	layer = BELOW_MOB_LAYER
	var/mob/living/spawner

/obj/effect/temp_visual/goliath_tentacle/Initialize(mapload, mob/living/new_spawner)
	. = ..()
	for(var/obj/effect/temp_visual/goliath_tentacle/T in loc)
		if(T != src)
			return INITIALIZE_HINT_QDEL
	if(!QDELETED(new_spawner))
		spawner = new_spawner
	if(ismineralturf(loc))
		var/turf/simulated/mineral/M = loc
		M.gets_drilled()
	deltimer(timerid)
	timerid = addtimer(CALLBACK(src, .proc/tripanim), 7, TIMER_STOPPABLE)

/obj/effect/temp_visual/goliath_tentacle/original/Initialize(mapload, new_spawner, aux_tentacles)
	. = ..()
	var/list/directions = GLOB.cardinal.Copy()
	for(var/i in 1 to aux_tentacles)
		var/spawndir = pick_n_take(directions)
		var/turf/T = get_step(src, spawndir)
		if(T)
			new /obj/effect/temp_visual/goliath_tentacle(T, spawner)

/obj/effect/temp_visual/goliath_tentacle/proc/tripanim()
	icon_state = "Goliath_tentacle_wiggle"
	deltimer(timerid)
	timerid = addtimer(CALLBACK(src, .proc/trip), 3, TIMER_STOPPABLE)

/obj/effect/temp_visual/goliath_tentacle/proc/trip()
	var/mob/living/simple_animal/hostile/asteroid/goliath/G = spawner
	var/latched = FALSE
	for(var/mob/living/L in loc)
		if((!QDELETED(spawner) && spawner.faction_check_mob(L)) || L.stat == DEAD)
			continue
		visible_message("<span class='danger'>[src] grabs hold of [L]!</span>")
		if(istype(G, /mob/living/simple_animal/hostile/asteroid/goliath) && G.growth_stage == ADULT)
			L.Stun(5)
			L.adjustBruteLoss(rand(10,15))
		else
			L.Weaken(2)
			L.adjustBruteLoss(rand(5,10))
		latched = TRUE
	if(!latched)
		retract()
	else
		deltimer(timerid)
		timerid = addtimer(CALLBACK(src, .proc/retract), 10, TIMER_STOPPABLE)

/obj/effect/temp_visual/goliath_tentacle/proc/retract()
	icon_state = "Goliath_tentacle_retract"
	deltimer(timerid)
	timerid = QDEL_IN(src, 7)

/mob/living/simple_animal/hostile/asteroid/goliath/death()
	..()
	add_draconian_effect(draconian_overlay)

#undef ANCIENT
#undef ADULT
#undef SUBADULT
#undef JUVENILE
#undef WILD
#undef PASSIVE
#undef TAMED
#undef NOT_DRACONIAN
#undef DRACONIAN
#undef FULL_DRACONIAN
#undef MEAT
#undef CORE
#undef FLORA
#undef ORGANS
#undef DIAMOND
#undef CYBERORGAN
#undef DRAGONSBLOOD
#undef GROWTH_MAX
