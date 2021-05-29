/datum/event/spawn_fugitive
	announceWhen = 120

/datum/event/spawn_fugitive/announce()
	//GLOB.event_announcement.Announce("Unknown entity detected aboard [station_name()]. Please report any sightings to local authority.", "Bioscan Alert", 'sound/hispania/effects/oldman/alert.ogg')

/datum/event/spawn_fugitive/proc/fugitivo()
	spawn()
		var/list/candidates = pollCandidatesWithVeto(src,usr,null,"Do you want to play as the fugitive?",null,null,10 SECONDS,TRUE,null,TRUE,FALSE, source = image('icons/hispania/obj/event_icon.dmi', "fugitive"))
		if(!length(candidates))
			kill()
			return
		var/mob/C = pick(candidates)
		if(!C.key)
			kill()
			return
		var/datum/mind/player_mind = new /datum/mind(C.key)
		player_mind.active = TRUE

		var/datum/game_mode/fugitive/elfugao = new
		var/mob/living/carbon/human/fug = elfugao.setup_fugitive(player_mind)

		SSticker.mode.eventmode = elfugao

		message_admins("[key_name_admin(fug)] has been made into the Fugitive by an event/gamemode.")
		log_game("[key_name_admin(fug)] was spawned as the Fugitive by an event/gamemode.")

/datum/event/spawn_fugitive/start()
	fugitivo()
