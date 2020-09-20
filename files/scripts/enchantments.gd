extends Node

var enchantmentdict = {
	enchdmg = {name = "+&v Damage", id = 'weapondamage', effect = "damage", mineffect = 2, maxeffect = 3, itemtypes = ['weapon'], type = 'incombat'},
	enchspeed = {name = "+&v Speed", id = 'weaponspeed', effect = "speed", mineffect = 3, maxeffect = 5, itemtypes = ['weapon'], type = 'incombat'},
	encharmor = {name = "+&v Armor", id = 'armorbonus', effect = "armor", mineffect = 2, maxeffect = 4, itemtypes = ['armor'], type = 'incombat'},
	enchstr = {name = "+&v Strength", id = 'armorstr', effect = "stren", mineffect = 1, maxeffect = 1, itemtypes = ['armor','accessory'], type = 'onequip'},
	enchagi = {name = "+&v Agility", id = 'armoragi', effect = "agi", mineffect = 1, maxeffect = 1, itemtypes = ['armor','accessory'], type = 'onequip'},
	enchend = {name = "+&v Endurance", id = 'armorend', effect = "end", mineffect = 1, maxeffect = 1, itemtypes = ['armor','accessory'], type = 'onequip'},
	enchmaf = {name = "+&v Magic affinity", id = 'armormaf', effect = "maf", mineffect = 1, maxeffect = 1, itemtypes = ['armor','accessory'], type = 'onequip'},
	enchhealth = {name = "+&v Health", id = 'armorhealth', effect = "healthmod", mineffect = 20, maxeffect = 40, itemtypes = ['armor'], type = 'onequip'},
	enchhealthp = {name = "+&100v% of Health", id = 'armorhealthp', effect = "healthperc", mineffect = 0.05, maxeffect = 0.15, itemtypes = ['armor'], type = 'onequip'},
	enchenergy = {name = "+&v Energy", id = 'armorenergy', effect = "energy", mineffect = 20, maxeffect = 40, itemtypes = ['armor'], type = 'onequip'},
	enchcour = {name = "+&v Courage", id = 'costumecour', effect = "cour", mineffect = 10, maxeffect = 20, itemtypes = ['costume'], type = 'onequip'},
	enchconf = {name = "+&v Confidence", id = 'costumeconf', effect = "conf", mineffect = 10, maxeffect = 20, itemtypes = ['costume'], type = 'onequip'},
	enchwit = {name = "+&v Wit", id = 'costumewit', effect = "wit", mineffect = 10, maxeffect = 20, itemtypes = ['costume'], type = 'onequip'},
	enchcharm = {name = "+&v Charm", id = 'costumecharm', effect = "charm", mineffect = 10, maxeffect = 20, itemtypes = ['costume'], type = 'onequip'},
	enchbeauty = {name = "+&v Beauty", id = 'costumebeauty', effect = "beauty", mineffect = 5, maxeffect = 15, itemtypes = ['costume'], type = 'onequip'},
	enchfear = {name = "+&v Fear per day", id = 'costumefear', effect = "fear", mineffect = 5, maxeffect = 8, itemtypes = ['costume'], type = 'onendday'},
	enchfearaccess = {name = "+&v Fear per day", id = 'accessfear', effect = "fear", mineffect = 3, maxeffect = 6, itemtypes = ['accessory'], type = 'onendday'},
	enchstress = {name = "-&v Stress per day", id = 'costumestress', effect = "stress", mineffect = 5, maxeffect = 8, itemtypes = ['costume','underwear'], type = 'onendday'},
	enchobedmod = {name = "+&100v% Obedience", id = 'costumeobed', effect = "obedmod", mineffect = 0.15, maxeffect = 0.30, itemtypes = ['costume'], type = 'onequip'},
	enchaccobedmod = {name = "+&100v% Obedience", id = 'accessobed', effect = "obedmod", mineffect = 0.05, maxeffect = 0.15, itemtypes = ['accessory'], type = 'onequip'},
	enchundenergy = {name = "+&v Energy", id = 'underwearenergy', effect = "energy", mineffect = 10, maxeffect = 25, itemtypes = ['costume','underwear'], type = 'onequip'},
	enchundhealth = {name = "+&v Health", id = 'armorhealth', effect = "healthmod", mineffect = 10, maxeffect = 20, itemtypes = ['underwear'], type = 'onequip'},
	enchundcharm = {name = "+&v Charm", id = 'underwearcharm', effect = "charm", mineffect = 5, maxeffect = 10, itemtypes = ['underwear'], type = 'onequip'},
	encstunchnce = {name = "&v% Stun", id = 'stunchance5', effect = "stunchance5", mineffect = 2, maxeffect = 6, itemtypes = ['weapon'], type = 'passive'},
	encdblchnce = {name = "&v% Doubleattack", id = 'doubleattack5', effect = "doubleattack5", mineffect = 5, maxeffect = 10, itemtypes = ['weapon'], type = 'passive'},
}
#cursed gear
var curseenchdict = {
	cursefear = {name = "+&v Fear per day", id = 'cursefear', effect = "fear", mineffect = 8, maxeffect = 15, itemtypes = ['armor','costume'], type = 'onendday'},
	cursestress = {name = "+&v Stress per day", id = 'cursestress', effect = "stress", mineffect = 10, maxeffect = 20, itemtypes = ['armor','costume','underwear'], type = 'onendday'},
	cursespeed = {name = "&v Speed", id = 'cursespeed', effect = "speed", effectvalue = -5, itemtypes = ['armor','weapon'], type = 'incombat'},
	cursehealthp = {name = "&100v% of Health", id = 'cursehealthp', effect = "cursedhealthmod", mineffect = -0.05, maxeffect = -0.25, itemtypes = ['armor','weapon'], type = 'onequip'},
	cursebeauty = {name = "-&v Beauty", id = 'cursebeauty', effect = "cursedbeauty", mineffect = 5, maxeffect = 15, itemtypes = ['armor','costume'], type = 'onequip'},
	curseobedmod = {name = "-&100v% Obedience", id = 'curseobedmod', effect = "cursedobedmod", mineffect = 0.10, maxeffect = 0.30, itemtypes = ['armor','costume','weapon','accessory'], type = 'onequip'},
	curseobed = {name = "-&v Obedience per day", id = 'curseobed', effect = "cursedobed", mineffect = 5, maxeffect = 15, itemtypes = ['armor','costume','weapon'], type = 'onendday'},
	curseenergy = {name = "-&v Energy", id = 'curseenergy', effect = "cursedenergy", mineffect = 10, maxeffect = 20, itemtypes = ['armor','costume','underwear'], type = 'onequip'},
	curselust = {name = "+&v Lust per day", id = 'curselust', effect = "lust", mineffect = 10, maxeffect = 20, itemtypes = ['armor','costume','underwear'], type = 'onendday'},
	curselustc = {name = "+&v Lust in combat", id = 'curselustc', effect = "livingunderwear", mineffect = 1, maxeffect = 4, itemtypes = ['armor','costume','underwear'], type = 'passive'},
	curseluxury = {name = "&v Luxury", id = 'curseluxury', effect = "luxury", effectvalue = -10, itemtypes = ['armor','costume','underwear'], type = 'onequip'},
	cursestressc = {name = "+&v Stress per battle", id = 'cursestressc', effect = "combatstress", mineffect = 2, maxeffect = 6, itemtypes = ['armor','costume','underwear','accessory','weapon'], type = 'passive'},
}


#warning-ignore:unused_argument
func addrandomenchant(item, number = 1):
	var encharray = []
	var existingenchants = []
	var existingenchantsids = []
	var curseencharray = []
	var curse = 0
	if item.enchant != '': return
	for i in item.effects:
		existingenchants.append(i.effect)
		if i.has("id"):
			existingenchantsids.append(i.id)
	for i in enchantmentdict:
		if enchantmentdict[i].itemtypes.has(item.type) && !existingenchantsids.has(enchantmentdict[i].id):
			encharray.append(i)
	for i in curseenchdict:
		if curseenchdict[i].itemtypes.has(item.type) && !existingenchantsids.has(curseenchdict[i].id):
			curseencharray.append(i)

	while number > 0 && encharray.size() > 0:
		number -= 1
		if rand_range(0,100) <= 80:
			if item.enchant == '':
				item.enchant = 'basic'
			elif item.enchant == 'cursed' || item.enchant == 'unique': 
				item.enchant = 'bagzbunny'
			var encharrayid = encharray[randi()%encharray.size()]
			var tempenchant = enchantmentdict[encharrayid]
			var enchant = {type = tempenchant.type, effect = tempenchant.effect, effectvalue = 0, descript = ""}
			encharray.erase(encharrayid)
			if tempenchant.has("mineffect") and tempenchant.has("maxeffect"):
				if tempenchant.maxeffect < 1:
					enchant.effectvalue = round(rand_range(tempenchant.mineffect, tempenchant.maxeffect)*100)/100
				else:
					enchant.effectvalue = round(rand_range(tempenchant.mineffect, tempenchant.maxeffect))
			elif tempenchant.has('effectvalue'):
				enchant.effectvalue = tempenchant.effectvalue
			enchant.descript = "[color=green]" + tempenchant.name.replace('&100v', str(enchant.effectvalue*100)).replace("&v", str(enchant.effectvalue)) + "[/color]"
		
			item.effects += [enchant]
		else:
			curse += 1
			if item.enchant == '':
				item.enchant = 'cursed'
			if item.enchant == 'basic' || item.enchant == 'unique':
				item.enchant = 'bagzbunny'
			var curseencharrayid = curseencharray[randi()%curseencharray.size()]
			var cursedenchant = curseenchdict[curseencharrayid]
			var enchant = {type = cursedenchant.type, effect = cursedenchant.effect, effectvalue = 0, descript = ""}
			curseencharray.erase(curseencharrayid)
			if cursedenchant.has("mineffect") and cursedenchant.has("maxeffect"):
				if cursedenchant.maxeffect < 1:
					enchant.effectvalue = round(rand_range(cursedenchant.mineffect, cursedenchant.maxeffect)*100)/100
				else:
					enchant.effectvalue = round(rand_range(cursedenchant.mineffect, cursedenchant.maxeffect))
			elif cursedenchant.has('effectvalue'):
				enchant.effectvalue = cursedenchant.effectvalue
			enchant.descript = "[color=red]" + cursedenchant.name.replace('&100v', str(enchant.effectvalue*100)).replace("&v", str(enchant.effectvalue)) + "[/color]"	
			item.effects += [enchant]
			if curse <= 1 && number >= 1 && rand_range(0,100) <= 25:
				number += 2
			elif curse <= 1 && number >= 0 && rand_range(0,100) >= 50:
				number += 1


#warning-ignore:unused_argument
func addenchant(item):
	pass
