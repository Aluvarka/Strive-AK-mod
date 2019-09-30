extends Node

var person

func getrandomsex(person):
	if globals.rules.male_chance > 0 && rand_range(0, 100) < globals.rules.male_chance:
		person.sex = 'male'
	elif rand_range(0, 100) < globals.rules.futa_chance && globals.rules.futa == true:
		person.sex = 'futanari'
	else:
		person.sex = 'female'

func getage(age):
	var temp
	var agearray = ['teen']
	if globals.rules.children == true:
		agearray.append('child')
	if globals.rules.noadults == false:
		agearray.append('adult')
	if age == 'random' || agearray.find(age) < 0:
		age = agearray[rand_range(0,agearray.size())]
	if (age == 'child' && globals.rules.children == false) || (age == 'adult' && globals.rules.noadults == true):
		age = agearray[rand_range(0,agearray.size())]
	return age


func newslave(race, age, sex, origins = 'slave'):
	var temp
	var temp2
	var person = globals.person.new()
	if race == 'randomcommon':
		race = globals.getracebygroup("starting")
	elif race == 'randomany':
		race = globals.allracesarray[rand_range(0,globals.allracesarray.size())]
	person.race = race
	person.age = getage(age)
	person.mindage = person.age
	person.sex = sex
	if person.sex == 'random': getrandomsex(person)
	for i in ['cour_base','conf_base','wit_base','charm_base']:
		person.stats[i] = rand_range(35,65)
	person.id = str(globals.state.slavecounter)
	globals.state.slavecounter += 1
	changerace(person, 'Human')
	changerace(person)
	person.work = 'rest'
	person.sleep = 'communal'
	person.sexuals.actions.kiss = 0
	person.sexuals.actions.massage = 0
	globals.assets.getsexfeatures(person)
	if person.race.find('Halfkin') >= 0 || (person.race.find('Beastkin') >= 0 && globals.rules.furry == false):
		person.race = person.race.replace('Beastkin', 'Halfkin')
		person.bodyshape = 'humanoid'
		person.skincov = 'none'
		person.arms = 'normal'
		person.legs = 'normal'
		if rand_range(0,1) > 0.4:
			person.eyeshape = 'normal'
	if globals.rules.randomcustomportraits == true:
		randomportrait(person)
	get_caste(person, origins)
	for i in person.sexuals.unlocks:
		var category = globals.sexscenes.categories[i]
		for ii in category.actions:
			person.sexuals.actions[ii] = 0
	person.memory = person.origins
	person.masternoun = ''
	if randf() < 0.05:
		var spec = globals.specarray[rand_range(0,globals.specarray.size())]
		globals.currentslave = person
		if globals.evaluate(globals.jobs.specs[spec].reqs) == true:
			person.spec = spec
	if person.age == 'child' && randf() < 0.1:
		person.vagvirgin = false
	elif person.age == 'teen' && randf() < 0.3:
		person.vagvirgin = false
	elif person.age == 'adult' && randf() < 0.65:
		person.vagvirgin = false
	person.health = 100
	return person

func changerace(person, race = null):
	var races = globals.races
	var personrace
	if race == null:
		personrace = person.race.replace('Halfkin','Beastkin')
	else:
		personrace = race
	for i in races[personrace]:
		if i in ['description', 'details']:
			continue
		if typeof(races[personrace][i]) == TYPE_ARRAY:
			person[i] = races[personrace][i][rand_range(0,races[personrace][i].size())]
		elif typeof(races[personrace][i]) == TYPE_DICTIONARY:
			if person.get(i) == null:
				continue
			for k in (races[personrace][i]):
				person[i][k] = races[personrace][i][k]
		else:
			if person.get(i) != null:
				person[i] = races[personrace][i]
	

func get_caste(person, caste):
	var array = []
	var spin = 0
	person.origins = caste
	if caste == 'slave':
		person.cour -= rand_range(10,30)
		person.conf -= rand_range(10,30)
		person.wit -= rand_range(10,30)
		person.charm -= rand_range(10,30)
		person.beautybase += rand_range(0,45)
		person.stats.obed_mod += 0.25
		if rand_range(0,10) >= 9:
			person.level += 1
		if rand_range(0,100) >= 95:
			person.beautybase += rand_range(0,15)
	elif caste == 'poor':
		person.cour -= rand_range(5,15)
		person.conf -= rand_range(5,15)
		person.wit -= rand_range(5,15)
		person.charm += rand_range(-5,15)
		person.beautybase += rand_range(0,55)
		if rand_range(0,10) >= 8:
			person.level += round(rand_range(0,2))
		if rand_range(0,100) >= 95:
			person.beautybase += rand_range(0,15)
	elif caste == 'commoner':
		person.cour += rand_range(-5,15)
		person.conf += rand_range(-5,15)
		person.wit += rand_range(-5,15)
		person.charm += rand_range(-5,20)
		person.beautybase += rand_range(10,65)
		if rand_range(0,10) >= 7:
			person.level += round(rand_range(0,2))
		if rand_range(0,100) >= 95:
			person.beautybase += rand_range(0,20)
	elif caste == 'rich':
		person.cour += rand_range(5,20)
		person.conf += rand_range(5,25)
		person.wit += rand_range(5,20)
		person.charm += rand_range(-5,15)
		person.beautybase += rand_range(25,75)
		person.stats.obed_mod -= 0.2
		if rand_range(0,10) >= 5:
			person.level += round(rand_range(0,3))
		if rand_range(0,100) >= 95:
			person.beautybase += rand_range(0,25)
	elif caste == 'noble':
		person.cour += rand_range(10,30)
		person.conf += rand_range(10,30)
		person.wit += rand_range(10,30)
		person.charm += rand_range(10,30)
		person.beautybase = rand_range(35,100)
		person.stats.obed_mod -= 0.4
		if rand_range(0,10) >= 4:
			person.level += round(rand_range(0,3))
		if rand_range(0,100) >= 95:
			person.beautybase += rand_range(0,30)
	
	person.skillpoints += (person.level-1)*variables.skillpointsperlevel
	spin = person.skillpoints
	array = ['sstr','sagi','smaf','send']
	while spin > 0:
		var temp = array[rand_range(0, array.size())]
		if rand_range(0,100) < 50 && person.stats[globals.basestatdict[temp]] < person.stats[globals.maxstatdict[temp]]:
			person.stats[globals.basestatdict[temp]] += 1
			person.skillpoints -= 1
		spin -= 1
	
	
	if rand_range(0,10) > 8:
		person.add_trait(globals.origins.traits('background').name)
	if rand_range(0,10) > 9:
		person.add_trait(globals.origins.traits('personality').name)
	if randf() >= 0.8:
		spin = 2
	else:
		spin = 1
	while spin > 0:
		person.add_trait(globals.origins.traits('any').name)
		spin -= 1
	if rand_range(0,10) > 7:
		person.add_trait(globals.origins.traits('third').name)

	if person.traits.find("Love childs") >= 0: 
		if person.sex == 'male' || person.age == 'child':
			person.add_trait(globals.origins.traits('third').name)
			person.trait_remove("Love childs")
			person.lactation = false
		else:
			person.preg.fertility += 10
			person.lactation = true
			if person.titssize != 'huge':
				person.titssize = globals.sizearray[globals.sizearray.find(person.titssize)+1]
	if person.traits.find("Fickle") >= 0:
		person.sexuals.unlocks.append("swing")
##	if person.traits.find("Lovable") >= 0:
##		person.beautybase += rand_range(5,15)
##	if person.traits.find("Tough") >= 0:
##		person.stats.health_bonus += 0.25
##	if person.traits.find("Vigorous") >= 0:
##		person.stats.energy_max += 25
##	if person.traits.find("Strong willed") >= 0:
##		person.stats.obed_mod -= 0.35
##		person.stats.loyal_max -= 25
##		person.stats.conf_min = 45
	if person.traits.find("Thick skinned") >= 0:
		person.stats.armor_cur += 2
	if person.traits.find("Obese") >= 0: 
		if person.sex != 'male' && person.titssize != 'huge':
			person.titssize = globals.sizearray[globals.sizearray.find(person.titssize)+1]
		if person.asssize != 'huge':
			person.asssize = globals.sizearray[globals.sizearray.find(person.asssize)+1]
		person.stats.energy_max -= 40
	if person.traits.find("Plump") >= 0:
		if person.traits.find("Baker") <= 0:
			person.stats.energy_max -= 10
		if person.sex != 'male' && person.titssize != 'huge':
			person.titssize = globals.sizearray[globals.sizearray.find(person.titssize)+1]
		if person.asssize != 'huge':
			person.asssize = globals.sizearray[globals.sizearray.find(person.asssize)+1]
	if person.race == 'Orc':
		person.stats.health_base += 25
	if person.race == 'Fairy':
		person.stats.health_base -= 15
		person.stats.wit_base += 20
#	if person.traits.find("Magician") >= 0:
#		person.stats.maf_max += 1
#		person.stats.str_max -= 1
#		person.stats.wit_base += 20
#	if person.traits.find("Warrior") >= 0:
#		person.stats.str_max += 1
#		person.stats.maf_max -= 1
#		person.stats.cour_base += 20
#	if person.traits.find("Hunter") >= 0:
#		person.stats.agi_max += 1
#		person.stats.wit_base += 10
#		person.stats.cour_base += 10
#	if person.traits.find("Athlete") >= 0:
#		person.stats.end_max += 1
#		person.stats.cour_base += 10
#		person.stats.charm_base += 10
##	if person.traits.find("Glass Bones") >= 0:
##		person.stats.health_bonus -= 0.3
	if rand_range(0,10) > 7.5:
		if person.race.find('Wolf') >= 0:
			person.add_trait(globals.origins.traits('wolfish').name)
		elif person.race.find('Cat') >= 0:
			person.add_trait(globals.origins.traits('feline').name)
		elif person.race.find('Fox') >= 0:
			person.add_trait(globals.origins.traits('fox').name)
		elif person.race.find('Bunny') >= 0:
			person.add_trait(globals.origins.traits('bunny').name)
		elif person.race.find('Tanuki') >= 0:
			person.add_trait(globals.origins.traits('tanuki').name)
		elif person.race == 'Harpy':
			person.add_trait(globals.origins.traits('harpy').name)
		elif person.race == 'Taurus':
			person.add_trait(globals.origins.traits('bovine').name)
		elif person.race == 'Demon':
			person.add_trait(globals.origins.traits('demon').name)
		elif person.race == 'Seraph':
			person.add_trait(globals.origins.traits('seraph').name)
		elif person.race == 'Dragonkin':
			person.add_trait(globals.origins.traits('dragon').name)
		elif person.race == 'Fairy':
			person.add_trait(globals.origins.traits('fey').name)
		elif person.race == 'Arachna':
			person.add_trait(globals.origins.traits('spider').name)
		elif person.race == 'Centaur':
			person.add_trait(globals.origins.traits('horse').name)
	if person.traits.find("Wolf Hide") >= 0:
		person.stats.armor_cur += 2

func tohalfkin(person):
	person.legs = 'normal'
	person.arms = 'normal'
	person.skincov = 'none'
	person.bodyshape = 'humanoid'

func randomportrait(person):
	if randomportraits == null:
		randomportraits = load(globals.modfolder + "/randomportraits/randomportraits.gd").new()
	randomportraits.setrandom(person)

var randomportraits = null