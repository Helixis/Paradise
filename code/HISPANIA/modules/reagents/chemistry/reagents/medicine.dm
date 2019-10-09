/datum/reagent/medicine/ampligen
	name = "Ampligen"
	id = "ampligen"
	description = "A basic antiviral. It needs to be mixed to unlock its properties"
	reagent_state = LIQUID
	color = "#149995"
	metabolization_rate = 0.2

/datum/reagent/medicine/balavir
	name = "Balavir"
	id = "balavir"
	description = "A basic compound in antiviral preparation"
	reagent_state = LIQUID
	color = "#6e0e0e"
	metabolization_rate = 0.2

/datum/reagent/medicine/dolutegravir
	name = "Dolutegravir"
	id = "dolutegravir"
	description = "An uniersal antiviral. Very effective against the vast majority of viruses"
	reagent_state = LIQUID
	color = "#415351"
	metabolization_rate = 0.2

/datum/reagent/medicine/efavirenz
	name = "Efavirenz"
	id = "efavirenz"
	description = "One of the most effective antivirals in Bundibugyo treatment."
	reagent_state = LIQUID
	color = "#2c8e5a"
	metabolization_rate = 0.2
	taste_description = "a purge"

/datum/reagent/medicine/famciclovir
	name = "Famciclovir"
	id = "famciclovir"
	description = "A high-level antiviral. Last resort if all else fails"
	reagent_state = LIQUID
	color = "#649a7f"
	metabolization_rate = 0.4
	taste_description = "wish"

/datum/reagent/medicine/fosamprenavir
	name = "Fosamprenavir"
	id = "fosamprenavir"
	description = "An all-purpose antiviral."
	reagent_state = LIQUID
	color = "#f9f9f9"
	metabolization_rate = 0.2
	taste_description = "antiviral"

/datum/reagent/duloxetine
	name = "Duloxetine"
	id = "duloxetine"
	description = "Antidepressant that will keep the patient in a state of happiness while in the body."
	reagent_state = LIQUID
	color = "#60A584"
	overdose_threshold = 35
	addiction_chance = 70
	taste_description = "calm"

/datum/reagent/duloxetine/on_mob_life(mob/living/M)
	var/update_flags = STATUS_UPDATE_NONE
	if(prob(15))
		M.emote(pick("chuckle", "sign", "dance", "laugh"))
	if(prob(15))
		to_chat(M, "<span class='notice'>You feel great!</span>")
		M.emote(pick("laugh", "giggle"))
	if(prob(8))
		to_chat(M, "<span class='notice'>You feel warm.</span>")
	if(prob(10))
		to_chat(M, "<span class='notice'>You feel less stressed!</span>")
		M.emote(pick("smile", "giggle"))
	return ..() | update_flags

/datum/reagent/duloxetine/overdose_process(mob/living/M, severity)
	var/list/overdose_info = ..()
	var/effect = overdose_info[REAGENT_OVERDOSE_EFFECT]
	var/update_flags = overdose_info[REAGENT_OVERDOSE_FLAGS]
	if(severity == 1)
		if(effect <= 2)
			M.visible_message("<span class='warning'>[M] looks nervous!</span>")
			M.AdjustConfused(15)
			M.emote("twitch_s")
		else if(effect <= 4)
			M.visible_message("<span class='warning'>[M] is all sweaty!</span>")
			M.bodytemperature += rand(15,30)
		else if(effect <= 7)
			M.emote("twitch")
			M.Jitter(10)
	else if(severity == 2)
		if(effect <= 2)
			M.emote("gasp")
			to_chat(M, "<span class='warning'>You can't breathe!</span>")
			update_flags |= M.adjustOxyLoss(5, FALSE)
			update_flags |= M.Stun(1, FALSE)
		else if(effect <= 4)
			to_chat(M, "<span class='warning'>You feel terrible!</span>")
			M.Jitter(10)
			update_flags |= M.Weaken(1, FALSE)
			M.AdjustConfused(33)
		else if(effect <= 7)
			M.emote("collapse")
			to_chat(M, "<span class='warning'>Your heart is pounding!</span>")
			M << 'sound/effects/singlebeat.ogg'
	return list(effect, update_flags)