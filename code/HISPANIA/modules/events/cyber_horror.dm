/datum/event/cyber_horror
	announceWhen = 15
	endWhen = 11
	var/locstring
	var/cyber_random

/datum/event/cyber_horror/start()
	var/list/availableareas = list()
	for(var/area/maintenance/A in world)
		availableareas += A
	var/area/randomarea = pick(availableareas)
	var/list/turf/simulated/floor/turfs = list()
	for(var/turf/simulated/floor/F in randomarea)
		if(turf_clear(F))
			turfs += F
	var/list/spawn_types = list()
	spawn_types = list(/obj/structure/spawner/cyber_horror_spawner)
	var/max_number = 2

	while(turfs.len > 0 && max_number > 0)
		var/turf/simulated/floor/T = pick(turfs)
		turfs.Remove(T)
		max_number--
		var/spawn_type = pick(spawn_types)
		new spawn_type(T)


/datum/event/cyber_horror/announce()
	GLOB.event_announcement.Announce("There's an anomaly on space time with some recent lifesign readings, proceed with caution and handle the situation before this starts to affect productivity.", "Artificial Lifesign Alert")
