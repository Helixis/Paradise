#define SLEEP_CHOP "GDH"
#define BACKPACK_DROP "DDG"
#define SUCKER_PUNCH "PPH"
#define HAND_BREAKER "GDDHH"

/datum/martial_art/seckaraty
	name = "Seckaraty"
	help_verb = /mob/living/carbon/human/proc/seckaraty_help
	block_chance = 25

/datum/martial_art/seckaraty/proc/check_streak(var/mob/living/carbon/human/A, var/mob/living/carbon/human/D)
	if(findtext(streak,SLEEP_CHOP))
		streak = ""
		sleep_chop(A,D)
		return 1
	if(findtext(streak,BACKPACK_DROP))
		streak = ""
		backpack_drop(A,D)
		return 1
	if(findtext(streak,HAND_BREAKER))
		streak = ""
		hand_breaker(A,D)
		return 1
	if(findtext(streak,SUCKER_PUNCH))
		streak = ""
		sucker_punch(A,D)
		return 1
	return 0

/datum/martial_art/seckaraty/proc/sleep_chop(var/mob/living/carbon/human/A, var/mob/living/carbon/human/D)
	if(!can_use(A))
		return 0
	if(!D.stat && !D.weakened)
		A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
		D.visible_message("<span class='warning'>[A] chops [D]'s shoulder in a strange way knocking them out!</span>", \
						  "<span class='userdanger'>[A] chops your shoulder very hard!</span>")
		playsound(get_turf(A), 'sound/effects/hit_kick.ogg', 50, 1, -1)
		D.Sleeping(8)
		return 1
	return basic_hit(A,D)

/datum/martial_art/seckaraty/proc/backpack_drop(var/mob/living/carbon/human/A, var/mob/living/carbon/human/D)
	if(!can_use(A))
		return 0
	A.drop_item()
	var/list/all_items = D.get_contents()
	for(var/obj/item/storage/backpack/B in all_items)
		if(B.flags & NODROP)
			to_chat(A, "<span class='warning'>You can't remove \the [B.name], it appears to be stuck!</span>")
			return
		D.unEquip(B)
		D.visible_message("<span class='danger'>[A] removes [D]'s [B.name] forcibly.</span>", \
						  "<span class='userdanger'>[A] removes your [B.name] forcibly.</span>")
		A.put_in_hands(B)
	return 1

/datum/martial_art/seckaraty/proc/sucker_punch(var/mob/living/carbon/human/A, var/mob/living/carbon/human/D)
	if(!can_use(A))
		return 0
	if(!D.stat && !D.weakened)
		A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
		playsound(get_turf(D), 'sound/weapons/punch1.ogg', 50, 1, -1)
		D.visible_message("<span class='danger'>[A] punches [D] in the stomach!</span>", \
						  "<span class='userdanger'>[A] winds you with a punch in the stomach!</span>")
		D.audible_message("<b>[D]</b> gags!")
		D.AdjustLoseBreath(3)
		D.Weaken(8)

		return 1
	return basic_hit(A,D)

/datum/martial_art/seckaraty/proc/hand_breaker(var/mob/living/carbon/human/A, var/mob/living/carbon/human/D)
	if(!can_use(A))
		return 0
	A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
	playsound(get_turf(D), 'sound/weapons/punch1.ogg', 50, 1, -1)
	D.visible_message("<span class='warning'>[A] grabs [D] hand and smashes it!</span>", \
					  "<span class='userdanger'>[A] grabs your hand and smashes it!</span>")
	var/picked_hand = pick("l_hand", "r_hand")
	D.apply_damage(15, BRUTE, picked_hand)
	if(prob(60))
		var/obj/item/organ/external/H = D.get_organ(picked_hand)
			H.fracture()
	return 1

/datum/martial_art/seckaraty/help_act(var/mob/living/carbon/human/A, var/mob/living/carbon/human/D)
	add_to_streak("P",D)
	if(check_streak(A,D))
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

/datum/martial_art/seckaraty/grab_act(var/mob/living/carbon/human/A, var/mob/living/carbon/human/D)
	add_to_streak("G", D)
	if(check_streak(A, D))
		return TRUE
	var/obj/item/grab/G = D.grabbedby(A, 1)
	if(G)
		G.state = GRAB_AGGRESSIVE //Instant aggressive grab
		add_attack_logs(A, D, "Melee attacked with martial-art [src] : aggressively grabbed", ATKLOG_ALL)

	return 1

/mob/living/carbon/human/proc/seckaraty_help()
	set name = "Recall Teachings"
	set desc = "Remember the ancient martial techniques of the shitcurity."
	set category = "Seckaraty"

	to_chat(usr, "<b><i>You crack your knuckles and have a flashback of knowledge...</i></b>")
	to_chat(usr, "<span class='notice'>Sleep Chop</span>: Grab, switch hands, Disarm Harm. Someone is talking too much? Knock them out for a moment.")
	to_chat(usr, "<span class='notice'>Backpack Drop</span>: Disarm Disarm Grab. A civilian is refusing to give you their backpack? Take it anyway.")
	to_chat(usr, "<span class='notice'>Sucker Punch</span>: Help Help Harm. Give your victim a warm hug before punching them in their guts.")
	to_chat(usr, "<span class='notice'>Hand Breaker</span>: Grab, switch hands, Disarm Disarm Harm Harm. Smash their hand so hard with a chance to break it!")

	to_chat(usr, "<b><i>In addition, by having your throw mode on when being attacked, you enter an active defense mode where you have a chance to block and sometimes even counter attacks done to you.</i></b>")