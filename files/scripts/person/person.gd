var id = 0
var unique = null
var name = ''
var surname = ''
var nickname = ''

var imageportait = null
var imagefull = null

var race = ''
var age = ''
var mindage = ''
var sex = ''
var nakedimgfull = null
var height = ''
var bodyshape = 'humanoid'

var arms = 'normal'
var legs = 'normal'
var horns = 'none'
var ears = 'human'
var tail = 'none'
var wings = 'none'

var haircolor = ''
var hairlength = ''
var hairstyle = ''
var pubichair = 'clean'

var eyecolor = ''
var eyeshape = 'normal'
var eyesclera = 'normal'

var skin = ''
var skincov = 'none'
var furcolor = 'none'

var titssize = ''
var titsextra = 0
var titsextradeveloped = false
var lactation = false

var asssize = ''
var vagina = 'normal'
var penis = 'none'
var penistype = 'human'
var penisextra = 0
var balls = 'none'

var piercing = {earlobes = null, eyebrow = null, nose = null, lips = null, tongue = null, navel = null, nipples = null, clit = null, labia = null, penis = null}
var tattoo = {chest = 'none', face = 'none', ass = 'none', arms = 'none', legs = 'none', waist = 'none'}
var tattooshow = {chest = true, face = true, ass = true, arms = true, legs = true, waist = true}
var mods = {}
var customdesc = ''

var consent = false setget consent_set
var vagvirgin = true
var mouthvirgin = true
var assvirgin = true
var penisvirgin = true

var sensvagina = 0
var sensmouth = 0
var senspenis = 0
var sensanal = 0

var forcedsex = false
var sexexp = {partners = {}, watchers = {}, actions = {}, seenactions = {}, orgasms = {}, orgasmpartners = {}}
var knowntechniques = []
var sexuals = {actions = {}, unlocked = false, affection = 0, kinks = {}, unlocks = [], lastaction = ''}
var kinks = []
var sensation = {}

var state = 'normal'
var tags = []
var effects = {}
var away = {duration = 0, at = ''}
var preg = {fertility = 0, has_womb = true, duration = 0, baby = null}
var traits = []
var genes = {}
var spec = null
var gear = {costume = null, underwear = null, armor = null, weapon = null, accessory = null}
var luxury = 0

var brand = 'none'
var rules = {'silence':false, 'pet':false, 'contraception':false, 'aphrodisiac':false, 'masturbation':false, 'nudity':false, 'betterfood':false, 'personalbath':false,'cosmetics':false,'pocketmoney':false}
var masternoun = ''

var work = 'rest'
var farmoutcome = false
var cattle = {is_cattle = false, work = '', used_for = 'food'}
var sleep = ''

var level = 1
var levelupreqs = {} setget levelupreqs_set
var xp = 0 setget xp_set, xp_get
var realxp = 0
var skillpoints = 2
var learningpoints = 0 setget learningpoints_set

var ability = ['attack']
var abilityactive = ['attack']

var origins = 'slave'
var originstrue = ''
var fromguild = false
var memory = ''

var attention = 0
var lastinteractionday = {'day' : 0, 'count' : 0}
var lastsexday = 0
var relations = {}
var metrics = {ownership = 0, jail = 0, mods = 0, brothel = 0, sex = 0, partners = [], randompartners = 0, item = 0, spell = 0, orgy = 0, threesome = 0, win = 0, capture = 0, goldearn = 0, foodearn = 0, manaearn = 0, birth = 0, preg = 0, vag = 0, anal = 0, oral = 0, roughsex = 0, roughsexlike = 0, orgasm = 0}

var beauty = 0 setget ,beauty_get
var beautybase = 0 setget beautybase_set
var beautytemp = 0

var fear_mod = 1

var lewdness = 0 setget lewdness_set
var asser = 0 setget asser_set

var stats = {
	str_max = 0,
	str_mod = 0,
	str_base = 0,
	agi_max = 0,
	agi_mod = 0,
	agi_base = 0,
	maf_max = 0,
	maf_mod = 0,
	maf_base = 0,
	end_base = 0,
	end_mod = 0,
	end_max = 0,
	cour_max = 100,
	cour_base = 0,
	cour_racial = 0,
	conf_max = 100,
	conf_base = 0,
	conf_racial = 0,
	wit_max = 100,
	wit_base = 0,
	wit_racial = 0,
	charm_max = 100,
	charm_base = 0,
	charm_racial = 0,
	obed_cur = 0.0,
	obed_max = 100,
	obed_min = 0,
	obed_mod = 1,
	stress_cur = 0.0,
	stress_max = 150,
	stress_min = 0,
	stress_mod = 1,
	tox_cur = 0.0,
	tox_max = 100,
	tox_min = 0,
	tox_mod = 1,
	lust_cur = 0,
	lust_max = 100,
	lust_min = 0,
	lust_mod = 0,
	health_cur = 0,
	health_max = 100,
	health_base = 0,
	health_bonus = 1,
	health_mod = 0,
	energy_base = 100,
	energy_cur = 75,
	energy_max = 100,
	energy_mod = 0,
	armor_cur = 0,
	armor_max = 0,
	armor_base = 0,
	loyal_cur = 0.0,
	loyal_mod = 1,
	loyal_max = 100,
	loyal_min = 0,
	mood_cur = 100,
	mood_mod = 0,
	mood_min = 0,
	mood_max = 200,
	character = 0,
	weight_cur = 60,
	weight_base = 60,
	weight_min = 0,
	weight_max = 200,
	cour_min = 0,
	conf_min = 0,
	wit_min = 0,
	charm_min = 0
}
var health setget health_set,health_get
var energy setget energy_set,energy_get

var sstr setget str_set,str_get
var sagi setget agi_set,agi_get
var smaf setget maf_set,maf_get
var send setget end_set,end_get

var cour setget cour_set,cour_get
var conf setget conf_set,conf_get
var wit setget wit_set,wit_get
var charm setget charm_set,charm_get

var fear = 0 setget fear_set,fear_get
var obed setget obed_set,obed_get
var stress setget stress_set,stress_get
var loyal setget loyal_set,loyal_get

var lust setget lust_set,lust_get
var toxicity setget tox_set,tox_get

var persmood setget moodset,moodget
var personweight setget weight_set,weight_get

func fear_raw(value):
	fear += value


func get_traits():
	var array = []
	for i in traits:
		array.append(globals.origins.trait(i))
	return array

#warning-ignore:unused_argument
func add_trait(trait, remove = false):
	var traitEntry = globals.origins.trait(trait)
	if traitEntry == null:
		globals.printErrorCode("adding non-existant trait " + str(trait))
		return false
	for i in get_traits():
		if i.name == traitEntry.name || traitEntry.name in i.conflict:
			return false
	traits.append(traitEntry.name)
	if globals.get_tree().get_current_scene().has_node("infotext") && globals.slaves.has(self) && away.at != 'hidden':
		var text = self.dictionary("$name acquired new trait: " + traitEntry.name)
		globals.get_tree().get_current_scene().infotext(text, 'yellow')
	if !traitEntry.effect.empty():
		add_effect(traitEntry.effect)
	return true

func trait_remove(trait):
	var text = ''
	trait = globals.origins.trait(trait)
	if traits.find(trait.name) < 0:
		return
	traits.erase(trait.name)
	if trait['effect'].empty() != true:
		add_effect(trait['effect'], true)
	text += self.dictionary("$name lost trait: " + trait.name)
	if globals.get_tree().get_current_scene().has_node("infotext") && globals.slaves.find(self) >= 0 && away.at != 'hidden':
		globals.get_tree().get_current_scene().infotext(text,'yellow')

func getMasterNoun():
	if masternoun == '':
		return globals.state.defaultmasternoun
	else:
		return masternoun

func levelupreqs_set(value):
	levelupreqs = value

func lewdness_set(value):
	lewdness = clamp(round(value), 0, 120)

func asser_set(value):
	asser = clamp(value, 0, 100)

func fear_set(value):
	var difference = value - fear
	if difference > 0:
		difference = difference - difference*self.cour/200

	fear += round(difference*fear_mod)
	fear = clamp(fear, 0, 100+self.wit/2)

func fear_get():
	return fear

func levelup():
	levelupreqs.clear()
	level += 1
	var traitchance = 0
	traitchance = round(level/variables.traitperlvlup)*variables.traitperlvlup
	skillpoints += variables.skillpointsperlevel
	learningpoints += round((rand_range(3,6)*level)*variables.skillpointsperlevel)
	if level == traitchance:
		add_trait(globals.origins.traits('lvlup').name)
	realxp = 0
	if int(level) % 2 == 0:
		self.health += 10
	self.loyal += rand_range(5,10)
	if self != globals.player:
		globals.get_tree().get_current_scene().infotext(dictionary("$name has advanced to Level " + str(level)),'green')
	else:
		globals.get_tree().get_current_scene().infotext(dictionary("You have advanced to Level " + str(level)),'green')

#interactions functions added to manage transistion from storing day of last interaction to storing a dictionary
func recordInteraction():
	if typeof(lastinteractionday) != TYPE_DICTIONARY:
		lastinteractionday = {'day' : globals.resources.day, 'count' : float(lastinteractionday == globals.resources.day)}
	elif lastinteractionday.day == globals.resources.day:
		lastinteractionday.count += 1
	else:
		lastinteractionday = {'day' : globals.resources.day, 'count' : 1}

func getRemainingInteractions():
	if typeof(lastinteractionday) == TYPE_DICTIONARY:
		return variables.dailyactionsperslave - float(lastinteractionday.day == globals.resources.day) * lastinteractionday.count
	else:
		return variables.dailyactionsperslave - float(lastinteractionday == globals.resources.day)

func canInteract():
	return getRemainingInteractions() > 0

func xp_set(value):
	var difference = value - realxp
	if traits.has("Clever") == true:
		difference = difference*1.25
	elif traits.has("Curious") == true:
		difference = difference*1.1
	realxp += max(float(difference)/max(level,1),1)
	realxp = round(clamp(realxp, 0, 100))
	if realxp >= 100 && self == globals.player:
		levelup()


func xp_get():
	return realxp

func getessence():
	var essence
	if race in ['Demon', 'Arachna', 'Lamia', 'Dark Elf']:
		essence = 'taintedessenceing'
	elif race in ['Fairy', 'Tribal Elf', 'Dragonkin', 'Seraph']:
		essence = 'magicessenceing'
	elif race in ['Dryad', 'Elf', 'Gnome']:
		essence = 'natureessenceing'
	elif race in ['Harpy', 'Centaur', 'Taurus'] || race.find('Beastkin') >= 0 || race.find('Halfkin') >= 0:
		essence = 'bestialessenceing'
	elif race in ['Slime','Nereid', "Scylla"]:
		essence = 'fluidsubstanceing'
	return essence


func cleartraits():
	spec = null
	while !traits.empty():
		trait_remove(traits.back())
	for i in ['str_base','agi_base', 'maf_base', 'end_base']:
		stats[i] = 0
	skillpoints = 2
	level = 1
	xp = 0

func add_effect(effect, remove = false):
	effect = effect.duplicate()
	if effects.has(effect.code):
		if remove == true:
			effects.erase(effect.code)
			for i in effect:
				if stats.has(i):
					stats[i] = stats[i] + -effect[i]
				elif self.get(i) != null:
					#self[i] -= effect[i]
					set(i, get(i) - effect[i])
	elif remove != true:
		effects[effect.code] = effect
		for i in effect:
			if stats.has(i):
				stats[i] = stats[i] + effect[i]
			elif self.get(i) != null:
				#self[i] += effect[i]
				set(i, get(i) + effect[i])


func beauty_get():
	return beautybase + beautytemp


func health_set(value):
	stats.health_max = round(max(10, ((variables.basehealth + (stats.end_base+stats.end_mod)*variables.healthperend + stats.health_mod) + floor(level/2)*5) * stats.health_bonus))
	stats.health_cur = clamp(floor(value), 0, stats.health_max) 
	if stats.health_cur <= 0:
		death()

func obed_set(value):
	var difference = stats.obed_cur - value
	var string = ""
#warning-ignore:unused_variable
	var color
#warning-ignore:unused_variable
	var text = ""
	stats.obed_mod = clamp(stats.obed_mod, 0.2, 2)
	if difference > 0:
		difference = abs(difference)
		if abs(difference) < 20:
			string = "(-)"
		elif abs(difference) < 40:
			string = "(--)"
		else:
			string = "(---)"
		stats.obed_cur -= difference
		text = self.dictionary("$name's obedience has decreased " + string)
		color = 'red'
	else:
		difference = abs(difference)
		if abs(difference) < 20:
			string = "(+)"
		elif abs(difference) < 40:
			string = "(++)"
		else:
			string = "(+++)"
		text = self.dictionary("$name's obedience has grown " + string)
		color = 'green'
		stats.obed_cur += difference*stats.obed_mod

	stats.obed_cur = clamp(stats.obed_cur, stats.obed_min, stats.obed_max)
	if stats.obed_cur < 50 && spec == 'executor':
		stats.obed_cur = 50

func loyal_set(value):
	var difference = stats.loyal_cur - value
	var string = ""
#warning-ignore:unused_variable
	var color
#warning-ignore:unused_variable
	var text = ""
	if difference > 0:
		difference = abs(difference)
		if abs(difference) < 5:
			string = "(-)"
		elif abs(difference) < 10:
			string = "(--)"
		else:
			string = "(---)"
		stats.loyal_cur -= difference
		text = self.dictionary("$name's loyalty decreased " + string)
		color = 'red'
	elif difference < 0:
		difference = abs(difference)
		if abs(difference) < 5:
			string = "(+)"
		elif abs(difference) < 10:
			string = "(++)"
		else:
			string = "(+++)"
		text = self.dictionary("$name's loyalty grown " + string)
		color = 'green'
		stats.loyal_cur += difference*stats.loyal_mod


	stats.loyal_cur = max(min(stats.loyal_cur, stats.loyal_max),stats.loyal_min)
#		if globals.get_tree().get_current_scene().has_node("infotext") && globals.slaves.find(self) >= 0 && away.at != 'hidden':
#			globals.get_tree().get_current_scene().infotext(text,color)

func stress_set(value):

	var difference = value - stats.stress_cur
	difference = difference*stats.stress_mod
	var endvalue = stats.stress_cur + difference
	var text = ""
	var color
	if stats.stress_cur < 99 && endvalue >= 99:
		text += "$name is about to suffer from mental breakdown... "
		color = 'red'
	if stats.stress_cur < 66 && endvalue >= 66:
		text += "$name has become considerably stressed. "
		color = 'red'
	elif (stats.stress_cur < 33 || stats.stress_cur >= 66) && (endvalue >= 33 && endvalue < 66):
		text += "$name has become mildly stressed. "
		color = 'yellow'
	elif stats.stress_cur >= 33 && endvalue < 33:
		text += "$name is no longer stressed. "
		color = 'green'

	stats.stress_cur = clamp(endvalue, stats.stress_min, stats.stress_max)
	if text != '' && globals.get_tree().get_current_scene().has_node("infotext") && globals.slaves.has(self) && away.at != 'hidden':
		globals.get_tree().get_current_scene().infotext(self.dictionary(text),color)
	if self == globals.player:
		stats.stress_cur = 0

func mentalbreakdown():
	self.cour -= rand_range(5,self.cour/4)
	self.conf -= rand_range(5,self.conf/4)
	self.wit -= rand_range(5,self.wit/4)
	self.charm -= rand_range(5,self.charm/4)
	if self.effects.has('captured'):
		self.add_effect(globals.effectdict.captured, true)
	if sleep != 'farm':
		self.health -= rand_range(0, stats.health_max/5)
	self.stress -= 30

func learningpoints_set(value):

	var difference = learningpoints - value
	var string = ""
	var text = ""
	var color
	if difference < 0:
		difference = abs(difference)
		string = difference
		text = self.dictionary("$name has acquired " + str(string) + " learning points. " )
		color = 'green'

	if globals.get_tree().get_current_scene().has_node("infotext") && globals.slaves.find(self) >= 0 && away.at != 'hidden':
		globals.get_tree().get_current_scene().infotext(text,color)
	learningpoints = value

func tox_set(value):
	var difference = value - stats.tox_cur
	stats.tox_cur = clamp(stats.tox_cur + difference*stats.tox_mod, stats.tox_min, stats.tox_max)

func energy_set(value):
	value = round(value)
	var difference = value - stats.energy_cur
	stats.energy_max = round(max(10,stats.energy_base+(5*(stats.end_base+stats.end_mod))))
	stats.energy_cur = clamp(stats.energy_cur + difference*(1 + stats.energy_mod/100.0), 0, stats.energy_max)
	if self == globals.player:
		globals.resources.energy = 0

var originvalue = {'slave' : 55, 'poor' : 65, 'commoner' : 75, 'rich' : 85, 'atypical' : 85, 'noble' : 100}

func cour_set(value):
	var difference = max(0, stats.cour_max - originvalue['noble'])
	stats.cour_base = clamp(value, stats.cour_min, min(stats.cour_max, originvalue[origins]+difference))

func conf_set(value):
	var difference = max(0, stats.conf_max - originvalue['noble'])
	stats.conf_base = clamp(value, stats.conf_min, min(stats.conf_max, originvalue[origins])+difference)

func wit_set(value):
	var difference = max(0, stats.wit_max - originvalue['noble'])
	stats.wit_base = clamp(value, stats.wit_min, min(stats.wit_max, originvalue[origins]+difference))

func charm_set(value):
	var difference = max(0, stats.charm_max - originvalue['noble'])
	stats.charm_base = clamp(value, stats.charm_min, min(stats.charm_max, originvalue[origins]+difference))


func lust_set(value):
	var difference = value - stats.lust_cur
	if difference > 0:
		stats.lust_cur = clamp(stats.lust_cur + difference*(1 + stats.lust_mod/100.0),stats.lust_min,stats.lust_max)
	else:
		stats.lust_cur = clamp(stats.lust_cur + difference,stats.lust_min,stats.lust_max)

func moodset(value):
	var difference = value - stats.mood_cur
	if difference > 0:
		stats.mood_cur = clamp(stats.mood_cur + difference*(1 + stats.mood_mod/100.0),stats.mood_min,stats.mood_max)
	else:
		stats.mood_cur = clamp(stats.mood_cur + difference,stats.mood_min,stats.mood_max)


func weight_set(value):
	var difference = stats.weight_base - stats.weight_cur
	var plusweight = false
	var heightbonus = 1.0
	var malebonus = 1.0
	var agebonus = 1.0
	var result = 0
	malebonus = globals.fastif(sex == 'male', '1.2', '1.0')
	if age != 'adult':
		if age == 'child':
			agebonus = 1.4
		else:
			agebonus = 1.2
	if stats.weight_cur > stats.weight_base || stats.weight_cur < stats.weight_base:
		plusweight = true
	stats.weight_base = min(stats.weight_base, stats.weight_max)
	result = (stats.weight_base/agebonus)*malebonus*heightbonus
	if plusweight == true:
		self.stats.weight_cur = stats.weight_base + difference
	else:
		self.stats.weight_cur = result
#	self.stats.weight_cur += stats.weight_base+difference

#warning-ignore:unused_argument
func str_set(value):
	stats.str_base = min(stats.str_base, stats.str_max)

#warning-ignore:unused_argument
func agi_set(value):
	stats.agi_base = min(stats.agi_base, stats.agi_max)

#warning-ignore:unused_argument
func maf_set(value):
	stats.maf_base = min(stats.maf_base, stats.maf_max)

func end_set(value):
	var plushealth = true
	if stats.end_base < value:
		plushealth = true
	stats.end_base = min(stats.end_base, stats.end_max)
	if plushealth:
		self.health += variables.healthperend
	else:
		self.health = self.health



func beautybase_set(value):
	value = round(value)
	beautybase = min(max(value,0),150)

func loyal_get():
	return stats.loyal_cur

func health_get():
	return stats.health_cur

func obed_get():
	return stats.obed_cur

func stress_get():
	return stats.stress_cur

func cour_get():
	return floor(stats.cour_base + stats.cour_racial)

func conf_get():
	return floor(stats.conf_base + stats.conf_racial)

func wit_get():
	return floor(stats.wit_base + stats.wit_racial)

func charm_get():
	return floor(stats.charm_base + stats.charm_racial)

func lust_get():
	return stats.lust_cur


func tox_get():
	return stats.tox_cur

func energy_get():
	return stats.energy_cur

func str_get():
	return stats.str_base + stats.str_mod

func agi_get():
	return stats.agi_base + stats.agi_mod

func maf_get():
	return stats.maf_base + stats.maf_mod

func end_get():
	return stats.end_base + stats.end_mod

func moodget():
	return stats.mood_cur
	
func weight_get():
	return stats.weight_cur

func awareness(hunt = false):
	var number = 0
	number = self.sagi*3 + self.wit/10
	if mods.has('augmenthearing'):
		number += 3
	if race.find('Wolf') >= 0:
		number += 4
	if globals.state.spec == 'Hunter' && hunt == false:
		number += 10
	if effects.has("tribal1"):
		number += 3
	elif effects.has('tribal2'):
		number += 6
	elif effects.has('tribal3'):
		number += 9
	if traits.has('Bestial Instinct'):
		number += 3
	if traits.has('Observant'):
		number += 8
	return number


func health_icon():
	var health
	if float(stats.health_cur)/stats.health_max > 0.75:
		health = load("res://files/buttons/icons/health/2.png")
	elif float(stats.health_cur)/stats.health_max > 0.4:
		health = load("res://files/buttons/icons/health/1.png")
	else:
		health = load("res://files/buttons/icons/health/3.png")
	return health

func obed_icon():
	var obed
	if stats.obed_cur > 80: 
		obed = load("res://files/buttons/icons/obedience/2.png")
	elif stats.obed_cur > 40:
		obed = load("res://files/buttons/icons/obedience/1.png")
	else:
		obed = load("res://files/buttons/icons/obedience/3.png")
	return obed

func stress_icon():
	var icon
	if stats.stress_cur >= 66:
		icon = load("res://files/buttons/icons/stress/3.png")
	elif stats.stress_cur >= 33:
		icon = load("res://files/buttons/icons/stress/1.png")
	else:
		icon = load("res://files/buttons/icons/stress/2.png")
	return icon


func name_long():
	var text = ''
	if nickname == '':
		text = name
	else:
		text = '"' + nickname + '" ' + name
	if surname != "":
		text += " " + str(surname)

	return text

func name_short():
	if globals.expansion.settings.minortweaknicknames == true:
		## CHANGED - 25/5/19 - changed name_short() and similar to include first name too, to better handle non-unique nicknames
		if nickname == '':
			return name
		else:
			return str("\""+nickname+"\" "+name).substr(0,20) ## return nickname
	else:
		if nickname == '':
			return name
		else:
			return nickname

func race_short():
	if race.find("Beastkin") >= 0:
		return race.replace("Beastkin ", 'B.')
	elif race.find("Halfkin") >= 0:
		return race.replace("Halfkin ", "H.")
	else:
		return race

func dictionary(text):
	var string = text
	string = string.replace('$name', name_short())
	string = string.replace('$surname', surname)
	string = string.replace('$sex', sex)
	if sex == 'male':
		string = string.replace('$penis', 'strapon' if (penis == 'none') else 'his cock')
		string = string.replace('$child', 'boy')
		string = string.replace('$He', 'He')
		string = string.replace('$he', 'he')
		string = string.replace('$His', 'His')
		string = string.replace('$his', 'his')
		string = string.replace('$him', 'him')
		string = string.replace('$son', 'son')
		string = string.replace('$sibling', 'brother')
		string = string.replace('$parent', 'father')
		string = string.replace('$sir', 'Sir')
	else:
		string = string.replace('$penis', 'strapon' if (penis == 'none') else 'her cock')
		string = string.replace('$child', 'girl')
		string = string.replace('$He', 'She')
		string = string.replace('$he', 'she')
		string = string.replace('$His', 'Her')
		string = string.replace('$his', 'her')
		string = string.replace('$him', 'her')
		string = string.replace('$son', 'daughter')
		string = string.replace('$sibling', 'sister')
		string = string.replace('$parent', 'mother')
		string = string.replace('$sir', "Ma'am")
	string = string.replace('$race', race.to_lower())
	string = string.replace('$playername', globals.player.name_short())
	string = string.replace('$master', getMasterNoun())
	string = string.replace('[haircolor]', haircolor)
	string = string.replace('[eyecolor]', eyecolor)
	string = string.replace('$r', globals.fastif(race.find('Wolf') >= 1, 'rr', 'r'))
	string = string.replace('$s', globals.fastif(race.find('Lamia') >= 1, 'ss', 's'))	
	string = string.replace('$nya', globals.fastif(race.find('Cat') >= 1, '-nya', ''))
	return string

func dictionaryplayer(text):
	var string = text
	string = string.replace('[Playername]', globals.player.name_short())
	string = string.replace('$name', name_short())
	string = string.replace('$sex', sex)
	string = string.replace('$He', 'You')
	string = string.replace('$he', 'you')
	string = string.replace('$His', 'Your')
	string = string.replace('$his', 'your')
	string = string.replace('$him', 'your')
	string = string.replace('$master', getMasterNoun())
	if sex == 'male':
		string = string.replace('$penis', globals.fastif(penis == 'none', 'strapon', 'his cock'))
		string = string.replace('$child', 'boy')
		string = string.replace('$child', 'son')
		string = string.replace('$sibling', 'brother')
		string = string.replace('$sir', 'Sir')
	else:
		string = string.replace('$penis', globals.fastif(penis == 'none', 'strapon', 'her cock'))
		string = string.replace('$child', 'girl')
		string = string.replace('$child', 'daughter')
		string = string.replace('$sibling', 'sister')
		string = string.replace('$sir', "Ma'am")
	string = string.replace('[haircolor]', haircolor)
	string = string.replace('[eyecolor]', eyecolor)
	string = string.replace('$race', race.to_lower())
	return string

func dictionaryplayerplus(text):
	var string = text
	string = string.replace(' has', ' have')
	string = string.replace(' Has', ' have')
	string = string.replace('You is', 'You are')
	string = string.replace("You's", "You're")
	string = string.replace('appears', 'appear')
	return string

func description():
	return globals.description.getslavedescription(self)

func descriptionsmall():
	return globals.description.getslavedescription(self, 'compact')

func status():
	return globals.description.getstatus(self)

func countluxury():
	var templuxury = luxury
	var goldspent = 0
	var foodspent = 0
	var nosupply = false
	var value = 0
	if sleep == 'personal':
		templuxury += 10+(5*globals.state.mansionupgrades.mansionluxury)
	elif sleep == 'your':
		templuxury += 5+(5*globals.state.mansionupgrades.mansionluxury)
	if rules.betterfood == true && globals.resources.food >= 5:
		globals.resources.food -= 5
		foodspent += 5
		templuxury += 5
	if rules.personalbath == true:
		if spec != 'housekeeper':
			value = 2
		else:
			value = 1
		if globals.itemdict.supply.amount >= value:
			templuxury += 5
			globals.itemdict.supply.amount -= value
		else:
			#nosupply == true
			nosupply = true
	if rules.pocketmoney == true:
		if spec != 'housekeeper':
			value = 10
		else:
			value = 5
		if brand == 'freewill':
			value *= 2
		if traits.find("Greedy") >= 1:
			value *= 3
		if globals.resources.gold >= value:
			templuxury += 10
			goldspent += value
			globals.resources.gold -= value
	if rules.cosmetics == true:
		if globals.itemdict.supply.amount > 1:
			templuxury += 5
			globals.itemdict.supply.amount -= 1
		else:
			nosupply = true
	if traits.find("Greedy") >= 1:
		templuxury -= 5

	var luxurydict = {luxury = templuxury, goldspent = goldspent, foodspent = foodspent, nosupply = nosupply}
	return luxurydict

func calculateluxury():
	var luxury = variables.luxuryreqs[origins]
	if traits.has("Ascetic"):
		luxury = luxury/2
	elif traits.has("Spoiled"):
		luxury *= 2
	elif traits.has("Broken mind"):
		luxury = luxury*0
	return luxury



func calculateprice():
	var price = 0
	var bonus = 1
	price = beautybase*variables.priceperbasebeauty + beautytemp*variables.priceperbonusbeauty
	price += (level-1)*variables.priceperlevel
	price = price*globals.races[race.replace('Halfkin', 'Beastkin')].pricemod
	if vagvirgin == true:
		bonus += variables.pricebonusvirgin
	if sex == 'futanari':
		bonus += variables.pricebonusfuta
	for i in get_traits():
		if i.tags.has('detrimental'):
			bonus += variables.pricebonusbadtrait
		if i.tags.find('sexual') == 2:
			price += 50
		if i.tags.find('sexual') >= 3:
			price += 100
		if i.tags.find('elitething') >= 0:
			price += 150
		if i.tags.find('personality') >= 0:
			price += 35
		if i.tags.find('goodthing') >= 0:
			price += 25
	if self.toxicity >= 60 && traits.has('Mercenary') != true:
		bonus -= variables.pricebonustoxicity

	if variables.gradepricemod.has(origins):
		bonus += variables.gradepricemod[origins]
	if variables.agepricemods.has(age):
		bonus += variables.agepricemods[age]


	if traits.has('Vigorous') == true:
		price += 50
	if traits.has('Uncivilized'):
		bonus -= variables.priceuncivilized
	if traits.has('Melancholia') == true && traits.has('Mercenary') != true:
		price -= 75
	if traits.has('Broken mind') == true && traits.has('Mercenary') != true:
		price = price/3
	if traits.has('Obese') == true && traits.has('Mercenary') != true:
		price = price*0.9
	if traits.has('Mercenary') == true:
		price += 155*(level)
		price *= 2

	
	
	price = price*bonus

	if price < 0:
		price = variables.priceminimum
	return round(price)

func buyprice():
	return calculateprice()

func sellprice(alternative = false):
	var price = calculateprice()*0.6

	if effects.has('captured') == true && alternative == false:
		price = price/2
	var influential = false
	for i in globals.slaves:
		if i.traits.has("Influential"):
			influential = true
	if influential:
		price *= 1.2
	price = max(round(price), variables.priceminimumsell)
	if globals.state.spec == 'Slaver' && fromguild == false:
		price *= 2
	if traits.has('Mercenary') == true:
		price = 1
	return price

func death():
	if globals.slaves.has(self):
		globals.main.infotext(self.dictionary("$name has deceased. "),'red')
		globals.items.unequipall(self)
		globals.slaves.erase(self)
		if globals.state.relativesdata.has(id):
			globals.state.relativesdata[id].state = 'dead'
	elif globals.state.babylist.has(self):
		globals.state.babylist.erase(self)
		globals.clearrelativesdata(self.id)
	globals.state.playergroup.erase(self.id)

func removefrommansion():
	globals.slaves.erase(self)
	globals.main.infotext(self.dictionary("$name $surname is no longer in your possession. "),'red')
	globals.items.unequipall(self)
	if globals.state.relativesdata.has(id):
		globals.state.relativesdata[id].state = 'left'

func abortion():
	if preg.duration > 0:
		preg.duration = 0
		var baby = globals.state.findbaby(preg.baby)
		preg.baby = null
		baby.death()

func checksex():
	var male = false
	var female = false

	if penis != 'none':
		male = true
	if vagina != 'none':
		female = true

	if male && female:
		sex = 'futanari'
	elif male:
		sex = 'male'
	else:
		sex = 'female'

func fetch(dict):
	for key in dict:
		var tv = dict[key]
		if typeof(tv) == TYPE_DICTIONARY:
			globals.merge(get(key), dict[key])
		elif typeof(tv) == TYPE_INT:
			set(key, get(key) + dict[key])
		else:
			set(key, dict[key])


func consent_set(value):
	if value and !consent && levelupreqs.get('code','') == 'relationship':
		if globals.get_tree().get_current_scene().has_node("date") && !globals.get_tree().get_current_scene().get_node("date").visible && globals.get_tree().get_current_scene().has_node("infotext") && globals.slaves.has(self):
			var text =  self.dictionary("After getting closer with $name, you felt like $he unlocked new potential.")
			globals.get_tree().get_current_scene().infotext(text, 'green')
		levelup()		
	consent = value