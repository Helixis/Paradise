///Biothread Hardsuit

/obj/item/clothing/suit/space/hardsuit/biothread
	name = "biothread hardsuit"
	desc = "Perfect for experimental testing"
	icon_state = "water_chrono_suit"
	item_state = "water_chrono_suit"
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/biothread
	armor = list(melee = 80, bullet = 80, laser = 80, energy = 80, bomb = 80, bio = 80, rad = 100, fire = 100, acid = 100)
	slowdown = 0 //Compacto y veloz
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	dog_fashion = null
	hispania_icon = TRUE
	jetpack = /obj/item/tank/jetpack/suit  //Si de alguna forma terminas en el espacio
	strip_delay = 130

/obj/item/clothing/head/helmet/space/hardsuit/biothread
	name = "biothread hardsuit"
	desc = "Perfect for experimental testing"
	icon_state = "wchronohelm"
	hispania_icon = TRUE
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	armor = list(melee = 80, bullet = 80, laser = 80, energy = 80, bomb = 80, bio = 80, rad = 100, fire = 100, acid = 100)
	actions_types = list() //Sin luz de casco
	resistance_flags = FIRE_PROOF | ACID_PROOF

///Purple Danger Backpack Hardsuit

/obj/item/clothing/suit/space/hardsuit/purdar
	name = "purple hardsuit"
	desc = "Perfect for surveillance"
	icon_state = "purplechronosuit"
	item_state = "water_chrono_suit"
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/purdar
	armor = list(melee = 80, bullet = 80, laser = 80, energy = 80, bomb = 10, bio = 10, rad = 50, fire = 100, acid = 100)  //Si un espia pisa una bomba algo salio mal
	slowdown = 0 //Compacto y veloz
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	dog_fashion = null
	hispania_icon = TRUE
	jetpack = /obj/item/tank/jetpack/suit  //Si de alguna forma terminas en el espacio
	strip_delay = 130

/obj/item/clothing/head/helmet/space/hardsuit/purdar
	name = "biothread helmet"
	desc = "Perfect for surveillance"
	icon_state = "purple_chrono_helm"
	hispania_icon = TRUE
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	armor = list(melee = 80, bullet = 80, laser = 80, energy = 80, bomb = 10, bio = 10, rad = 50, fire = 100, acid = 100)  //Si un espia pisa una bomba algo salio mal
	actions_types = list() //Sin luz de casco
	resistance_flags = FIRE_PROOF | ACID_PROOF
