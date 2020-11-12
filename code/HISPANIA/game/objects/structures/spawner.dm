/obj/structure/spawner/mining/carps
	name = "Carps den"
	desc = "A den housing a nest of carps, oh god why?"
	mob_types = list(/mob/living/simple_animal/hostile/carp)

/obj/structure/spawner/headcrab_old
	name = "headcrab old nest"
	desc = "A living nest for headcrabs."
	icon_state = "headcrab_nest"
	icon = 'icons/mob/headcrab.dmi'
	max_integrity = 300
	max_mobs = 3
	spawn_time = 250
	mob_types = list(/mob/living/simple_animal/hostile/headcrab, /mob/living/simple_animal/hostile/headcrab/fast, /mob/living/simple_animal/hostile/headcrab/poison)
	spawn_text = "crawls out of"
	faction = list("hostile")

/obj/structure/spawner/cyber_horror_spawner
	name = "cyber hive mind"
	desc = "A machine too advanced for a simple organic mind to understand."
	icon = 'icons/hispania/mob/cyber_horror.dmi'
	icon_state ="hive_artificer"
	max_mobs = 8
	max_integrity = 400
	spawn_time = 200
	spawn_text = "is assembled from"
	mob_types = list(/mob/living/simple_animal/hostile/cyber_organic, /mob/living/simple_animal/hostile/cyber_organic/vox, /mob/living/simple_animal/hostile/cyber_organic/plasmamen, /mob/living/simple_animal/hostile/cyber_organic/tajaran, /mob/living/simple_animal/hostile/cyber_organic/grey)
	faction = list("cyber")
	light_range = 1.5
	light_color = LIGHT_COLOR_CYAN
	var/heal_delay = 30
	var/last_heal = 0
	var/corrupt_delay = 50
	var/last_corrupt = 0

/obj/structure/spawner/cyber_horror_spawner/process()
	if(!anchored)
		return

	if(last_heal <= world.time)
		last_heal = world.time + heal_delay
		for(var/mob/living/L in range(5, src))
			if(iscyber(L))
				if(L.health != L.maxHealth)
					var/mob/living/simple_animal/M = L
					if(M.health < M.maxHealth)
						M.adjustHealth(-1)

	if(last_corrupt <= world.time)
		var/list/validturfs = list()
		var/list/cyberturf = list()
		for(var/T in circleviewturfs(src, 5))
			if(istype(T, /turf/simulated/floor/bluegrid))
				cyberturf |= T
				continue
			if(is_type_in_typecache(T, GLOB.blacklisted_pylon_turfs)) //Esta blacklist evitara errores
				continue
			else
				validturfs |= T

		last_corrupt = world.time + corrupt_delay

		var/turf/T = safepick(validturfs)
		if(T)
			if(istype(T, /turf/simulated/floor))
				T.ChangeTurf(/turf/simulated/floor/bluegrid)
			if(istype(T, /turf/simulated/wall))
				T.ChangeTurf(/turf/simulated/wall/cult/artificer)
