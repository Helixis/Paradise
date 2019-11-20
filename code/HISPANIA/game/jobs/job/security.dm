/datum/outfit/job/hos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE) //Al entrar como HoS ganas el arte marcial.
	..()
	if(visualsOnly)
		return
	var/datum/martial_art/seckaraty/robustness = new
	robustness.teach(H)

/obj/item/clothing/gloves/color/black/krav_maga/equipped(mob/user, slot) //Esto previene que se ganen los combos del Krav Maga
	if(user.mind.assigned_role == "Head of Security")
		to_chat(user, "<span class = 'userdanger'>You would never lower yourself to a pathetic Warden level!</span>")
		return

/obj/item/clothing/gloves/color/black/krav_maga/dropped(mob/user)
	if(user.mind.assigned_role == "Head of Security")
		return