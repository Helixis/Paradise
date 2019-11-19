#define SLEEP_CHOP "DH"
#define BACKPACK_DROP "DDG"
#define HAND_BREAKER "GDDHH"

/datum/martial_art/seckaraty
	name = "Seckaraty"
	help_verb = /mob/living/carbon/human/proc/seckaraty_help

/datum/martial_art/seckaraty/proc/check_streak(var/mob/living/carbon/human/A, var/mob/living/carbon/human/D)
	if(findtext(streak,SLEEP_CHOP))
		streak = ""
		//sleep_chop(A,D)
		return 1
	if(findtext(streak,BACKPACK_DROP))
		streak = ""
		//backpack_drop(A,D)
		return 1
	if(findtext(streak,HAND_BREAKER))
		streak = ""
		//hand_breaker(A,D)
		return 1
	return 0

/datum/martial_art/adminfu/help_act(var/mob/living/carbon/human/A, var/mob/living/carbon/human/D)
	add_to_streak("P",D)
	if(check_streak(A,D))
		return 1
	basic_hit(A,D)
	return 1

/datum/martial_art/seckaraty/harm_act(var/mob/living/carbon/human/A, var/mob/living/carbon/human/D)
	add_to_streak("H",D)
	if(check_streak(A,D))
		return 1
	basic_hit(A,D)
	return 1

/datum/martial_art/seckaraty/disarm_act(var/mob/living/carbon/human/A, var/mob/living/carbon/human/D)
	add_to_streak("D",D)
	if(check_streak(A,D))
		return 1
	basic_hit(A,D)
	return 1

/datum/martial_art/seckaraty/grab_act(var/mob/living/carbon/human/A, var/mob/living/carbon/human/D)
	add_to_streak("G",D)
	if(check_streak(A,D))
		return 1
	basic_hit(A,D)
	return 1

/mob/living/carbon/human/proc/seckaraty_help()
	set name = "Recall Teachings"
	set desc = "Remember the ancient martial techniques of the shitcurity."
	set category = "Seckaraty"

	to_chat(usr, "<b><i>You crack your knuckles and have a flashback of knowledge...</i></b>")
	to_chat(usr, "<span class='notice'>1</span>: .")
	to_chat(usr, "<span class='notice'>2</span>: .")
	to_chat(usr, "<span class='notice'>3</span>: .")