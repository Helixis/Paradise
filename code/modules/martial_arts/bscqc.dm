#define SLAM_COMBO "GH"
#define RESTRAIN_COMBO "GG"
#define PRESSURE_COMBO "DG"

/datum/martial_art/bscqc
	name = "BSCQC"
	help_verb = /mob/living/carbon/human/proc/BSCQC_help
	block_chance = 75

/datum/martial_art/bscqc/under_siege
	name = "Close Quarters Combat for defense"

/datum/martial_art/bscqc/proc/drop_restraining()
	restraining = FALSE

/datum/martial_art/bscqc/proc/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!can_use(A))
		return FALSE
	if(findtext(streak, SLAM_COMBO))
		streak = ""
		Slam(A, D)
		return TRUE
	if(findtext(streak, RESTRAIN_COMBO))
		streak = ""
		Restrain(A, D)
		return TRUE
	if(findtext(streak, PRESSURE_COMBO))
		streak = ""
		Pressure(A, D)
		return TRUE

/datum/martial_art/bscqc/proc/Slam(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!can_use(A))
		return FALSE
	if(!D.weakened && !D.resting && !D.lying)
		D.visible_message("<span class='warning'>[A] slams [D] into the ground!</span>", \
						  	"<span class='userdanger'>[A] slams you into the ground!</span>")
		playsound(get_turf(A), 'sound/weapons/slam.ogg', 50, 1, -1)
		D.apply_damage(5, BRUTE)
		D.Weaken(6)
		add_attack_logs(A, D, "Melee attacked with martial-art [src] :  Slam", ATKLOG_ALL)
		return TRUE
	streak = ""
	harm_act(A, D)
	streak = ""
	return TRUE

/datum/martial_art/bscqc/proc/Pressure(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!can_use(A))
		return FALSE
	D.visible_message("<span class='warning'>[A] forces their arm on [D]'s neck!</span>")
	D.adjustStaminaLoss(60)
	playsound(get_turf(A), 'sound/weapons/cqchit1.ogg', 50, 1, -1)
	add_attack_logs(A, D, "Melee attacked with martial-art [src] : Pressure", ATKLOG_ALL)
	return TRUE

/datum/martial_art/bscqc/proc/Restrain(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(restraining)
		return
	if(!can_use(A))
		return FALSE
	if(!D.stat)
		D.visible_message("<span class='warning'>[A] locks [D] into a restraining position!</span>", \
							"<span class='userdanger'>[A] locks you into a restraining position!</span>")
		D.adjustStaminaLoss(20)
		D.Stun(5)
		restraining = TRUE
		addtimer(CALLBACK(src, .proc/drop_restraining), 50, TIMER_UNIQUE)
		add_attack_logs(A, D, "Melee attacked with martial-art [src] : Restrain", ATKLOG_ALL)
		return TRUE
	streak = ""
	harm_act(A, D)
	streak = ""
	return TRUE

/datum/martial_art/bscqc/grab_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!can_use(A))
		return FALSE
	add_to_streak("G", D)
	if(check_streak(A, D))
		return TRUE
	var/obj/item/grab/G = D.grabbedby(A, 1)
	if(G)
		G.state = GRAB_AGGRESSIVE //Instant aggressive grab
		add_attack_logs(A, D, "Melee attacked with martial-art [src] : aggressively grabbed", ATKLOG_ALL)

	return TRUE

/datum/martial_art/bscqc/harm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!can_use(A))
		return FALSE
	add_to_streak("H", D)
	if(check_streak(A, D))
		return TRUE
	add_attack_logs(A, D, "Melee attacked with martial-art [src]", ATKLOG_ALL)
	A.do_attack_animation(D)
	var/picked_hit_type = pick("CQC'd", "neck chopped", "gut punched", "Big Bossed")
	var/bonus_damage = 6
	if(D.weakened || D.resting || D.lying)
		bonus_damage += 2
		picked_hit_type = "stomps on"
	D.apply_damage(bonus_damage, BRUTE)
	if(picked_hit_type == "kicks" || picked_hit_type == "stomps on")
		playsound(get_turf(D), 'sound/weapons/cqchit2.ogg', 50, 1, -1)
	else
		playsound(get_turf(D), 'sound/weapons/cqchit1.ogg', 50, 1, -1)
	D.visible_message("<span class='danger'>[A] [picked_hit_type] [D]!</span>", \
					  "<span class='userdanger'>[A] [picked_hit_type] you!</span>")
	add_attack_logs(A, D, "Melee attacked with martial-art [src] : [picked_hit_type]", ATKLOG_ALL)
	if(A.resting && !D.stat && !D.weakened)
		D.visible_message("<span class='warning'>[A] leg sweeps [D]!", \
							"<span class='userdanger'>[A] leg sweeps you!</span>")
		playsound(get_turf(A), 'sound/effects/hit_kick.ogg', 50, 1, -1)
		D.apply_damage(5, BRUTE)
		D.Weaken(3)
		add_attack_logs(A, D, "Melee attacked with martial-art [src] : Leg sweep", ATKLOG_ALL)
	return TRUE

/datum/martial_art/bscqc/disarm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!can_use(A))
		return FALSE
	add_to_streak("D", D)
	var/obj/item/I = null
	if(check_streak(A, D))
		return TRUE
	var/obj/item/grab/G = A.get_inactive_hand()
	if(restraining && istype(G) && G.affecting == D)
		D.visible_message("<span class='danger'>[A] puts [D] into a chokehold!</span>", \
							"<span class='userdanger'>[A] puts you into a chokehold!</span>")
		D.SetSleeping(20)
		restraining = FALSE
		if(G.state < GRAB_NECK)
			G.state = GRAB_NECK
		return TRUE
	else
		restraining = FALSE

	if(prob(25))
		if(!D.stat || !D.weakened || !restraining)
			I = D.get_active_hand()
			D.visible_message("<span class='warning'>[A] strikes [D]'s jaw with their hand!</span>", \
								"<span class='userdanger'>[A] strikes your jaw, disorienting you!</span>")
			playsound(get_turf(D), 'sound/weapons/cqchit1.ogg', 50, 1, -1)
			D.drop_item()
			if(I && D.drop_item())
				A.put_in_hands(I)
			D.Jitter(2)
			D.apply_damage(3, BRUTE)
	else
		D.visible_message("<span class='danger'>[A] attempted to disarm [D]!</span>", "<span class='userdanger'>[A] attempted to disarm [D]!</span>")
		playsound(D, 'sound/weapons/punchmiss.ogg', 25, 1, -1)

	add_attack_logs(A, D, "Melee attacked with martial-art [src] : Disarmed [I ? " grabbing \the [I]" : ""]", ATKLOG_ALL)
	return TRUE

/mob/living/carbon/human/proc/BSCQC_help()
	set name = "Remember The Training"
	set desc = "You try to remember some of the basics of CQC."
	set category = "BSCQC"
	to_chat(usr, "<b><i>You try to remember some of the basics of your militar CQC training.</i></b>")

	to_chat(usr, "<span class='notice'>Slam</span>: Grab, switch hands, Harm. Slam opponent into the ground, knocking them down.")
	to_chat(usr, "<span class='notice'>Restrain</span>: Grab, switch hands, Grab. Locks opponents into a restraining position, disarm to knock them out with a choke hold.")
	to_chat(usr, "<span class='notice'>Pressure</span>: Disarm Grab. Decent stamina damage.")

	to_chat(usr, "<b><i>In addition, by having your throw mode on when being attacked, you enter an active defense mode where you have a chance to block and sometimes even counter attacks done to you.</i></b>")