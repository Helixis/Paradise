///Hispania Civilians Clothes

/*Nota: todos los sprites que sean pertenecientes al code hispania y tengan sus
respectivos sprites en las carpetas de iconos de hispania , es decir icons/hispania
deberan tener una linea de codigo demas para que funcionen "hispania_icon = TRUE"*/

//code by Danaleja2005

/obj/machinery/vending/walldrobe
	name = "\improper WallDrobe"
	desc = "Wall-mounted Clothes dispenser. Made by D&N Corp."
	product_ads = "Dress up in fashion and wear our amazing uniforms, hats, suits made of the best material, only with us N&D Corp!."
	icon = 'icons/hispania/obj/vending.dmi'
	icon_state = "walldrobe"
	icon_deny = "walldrobe-deny"
	icon_vend = "walldrobe-vend"
	density = FALSE //It is wall-mounted, and thus, not dense. --SuperxpdudeS
	vend_delay = 12

/obj/machinery/vending/walldrobe/cap
	name = "\improper Captain's WallDrobe"
	req_access = list(access_captain)
	products = list(/obj/item/clothing/under/rank/command/captain/formal/light = 1,
					/obj/item/clothing/under/rank/command/captain/formal/dark = 1,
					/obj/item/clothing/head/caphat/dark = 1,
					/obj/item/clothing/head/caphat/light = 1,
					/obj/item/clothing/suit/armor/vest/captrenchcoat = 1,
					/obj/item/clothing/suit/captunic = 1,
					/obj/item/clothing/suit/captunic/capjacket = 1,
					/obj/item/clothing/under/captainparade = 1,
					/obj/item/clothing/under/rank/captain = 1,
					/obj/item/clothing/head/caphat/parade = 1,
					/obj/item/clothing/under/rank/captain = 1,
					/obj/item/clothing/under/rank/captain = 1,
					/obj/item/clothing/under/dress/dress_cap = 1,
					/obj/item/clothing/under/dress/dress_cap = 1,
					/obj/item/clothing/suit/armor/vest/capcarapace/alt = 1,
					/obj/item/clothing/shoes/brown = 1,
					/obj/item/clothing/shoes/laceup = 1,
					/obj/item/clothing/suit/mantle/armor/captain = 1,
					/obj/item/clothing/gloves/color/captain = 1)

/obj/machinery/vending/walldrobe/rd
	name = "\improper Research Director's WallDrobe"
	req_access = list(access_rd)
	products = list(/obj/item/clothing/suit/storage/labcoat/rdlargedark = 1,
					/obj/item/clothing/suit/storage/labcoat/rdlargeroundcutdark = 1,
					/obj/item/clothing/suit/bio_suit/scientist = 1,
					/obj/item/clothing/head/bio_hood/scientist = 1,
					/obj/item/clothing/under/rank/research_director = 1,
					/obj/item/clothing/suit/storage/labcoat = 1,
					/obj/item/clothing/suit/mantle/labcoat = 1,
					/obj/item/clothing/mask/gas = 1,
					/obj/item/clothing/shoes/white = 1,
					/obj/item/clothing/gloves/color/latex = 1)

/obj/machinery/vending/walldrobe/ce
	name = "\improper Chief Enginner's WallDrobe"
	req_access = list(access_ce)
	products = list(/obj/item/clothing/under/rank/chief_engineer = 1,
					/obj/item/clothing/under/rank/chief_engineer/skirt = 1,
					/obj/item/clothing/suit/mantle/chief_engineer = 1,
					/obj/item/clothing/head/beret/ce = 1,
					/obj/item/clothing/head/hardhat/white = 1,
                    /obj/item/clothing/glasses/welding/superior = 1,
                    /obj/item/clothing/gloves/color/yellow = 1,
					/obj/item/clothing/shoes/brown = 1,
					/obj/item/clothing/head/beret/eng = 1,
					/obj/item/clothing/suit/storage/hazardvest = 1,
					/obj/item/clothing/mask/gas = 1)

/obj/machinery/vending/walldrobe/cmo
	name = "\improper Chief Medical Officer's WallDrobe"
	req_access = list(access_cmo)
	products = list(/obj/item/clothing/suit/bio_suit/cmo = 1,
					/obj/item/clothing/head/bio_hood/cmo = 1,
					/obj/item/clothing/shoes/white = 1,
					/obj/item/clothing/suit/storage/labcoat/cmo = 1,
					/obj/item/clothing/under/rank/chief_medical_officer = 1,
					/obj/item/clothing/suit/mantle/labcoat/chief_medical_officer = 1,
					/obj/item/clothing/shoes/brown = 1,
					/obj/item/clothing/gloves/color/latex/nitrile = 1,
					/obj/item/clothing/under/rank/medical/blue = 1,
					/obj/item/clothing/head/surgery/blue = 1,
					/obj/item/clothing/under/rank/medical/green = 1,
					/obj/item/clothing/head/surgery/green = 1,
					/obj/item/clothing/under/rank/medical/purple = 1,
					/obj/item/clothing/head/surgery/purple = 1)

/obj/machinery/vending/walldrobe/hos
	name = "\improper Head of Security's WallDrobe"
	req_access = list(access_hos)
	products = list(/obj/item/clothing/under/rank/head_of_security = 1,
					/obj/item/clothing/under/rank/head_of_security/formal = 1,
					/obj/item/clothing/under/rank/head_of_security/corp = 1,
					/obj/item/clothing/under/rank/head_of_security/skirt = 1,
					/obj/item/clothing/suit/armor/hos = 1,
					/obj/item/clothing/suit/armor/hos/alt = 1,
					/obj/item/clothing/head/HoS = 1,
			 		/obj/item/clothing/head/HoS/beret = 1,
					/obj/item/clothing/suit/mantle/armor = 1,
					/obj/item/clothing/mask/gas/sechailer/hos =1)









