/datum/outfit/job/hos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE) //Al entrar como HoS ganas el arte marcial.
	..()
	if(visualsOnly)
		return
	var/datum/martial_art/seckaraty/robustness = new
	robustness.teach(H)