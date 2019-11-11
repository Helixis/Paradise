/datum/reagent/medicine/moa_complement
	name = "Oxygen"
	id = "moa_complement"
	reagent_state = LIQUID
	heart_rate_decrease = 1
	can_synth = FALSE
	taste_description = "a safe refuge"

/datum/reagent/medicine/moa_complement/on_mob_life(mob/living/M)
		var/update_flags = STATUS_UPDATE_NONE
		update_flags |= M.adjustOxyLoss(-16, FALSE)