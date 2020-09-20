
extends Node


############################### TRAITS ################################

var traitlist = {}

func _init():
	traitlist = load("res://files/scripts/traits.gd").new().traits



func traits(tag):
	var rval = []
	var traits = traitlist
	
	if tag == 'any':
		for i in traits:
			if traits[i]['tags'].has('secondary') != true && traits[i]['tags'].has('injury') != true:
				rval.append(traits[i])
	elif tag == 'anygood':
		for i in traits:
			if traits[i]['tags'].has('secondary') != true && traits[i]['tags'].has('detrimental') != true && traits[i]['tags'].has('lvlup') != true && traits[i]['tags'].has('elitething') != true && traits[i]['tags'].has('injury') != true:
					rval.append(traits[i])
	elif tag == 'physgood':
		for i in traits:
			if traits[i]['tags'].has('physical') == true && traits[i]['tags'].has('detrimental') != true && traits[i]['tags'].has('lvlup') != true && traits[i]['tags'].has('elitething') != true && traits[i]['tags'].has('injury') != true:
					rval.append(traits[i])
	elif tag == 'mentalgood':
		for i in traits:
			if traits[i]['tags'].has('mental') == true && traits[i]['tags'].has('detrimental') != true && traits[i]['tags'].has('lvlup') != true && traits[i]['tags'].has('elitething') != true && traits[i]['tags'].has('injury') != true && traits[i]['tags'].has('sexual') != true:
					rval.append(traits[i])
	elif tag == 'anybad':
		for i in traits:
			if traits[i]['tags'].has('secondary') != true && traits[i]['tags'].has('detrimental') == true && traits[i]['tags'].has('lvlup') != true && traits[i]['tags'].has('elitething') != true && traits[i]['tags'].has('goodthing') != true:
					rval.append(traits[i])
	else:
		var temp = traits.keys()
		if typeof(tag) != TYPE_ARRAY:
			for i in traits:
				if traits[i]['tags'].has(tag):
					rval.append(traits[i])
		else:
			for i in traits:
				if traits[i]['tags'].has(tag[0]) && traits[i]['tags'].has(tag[1]):
					rval.append(traits[i])
	return globals.randomfromarray(rval)

var traitscript = load("res://files/scripts/traits.gd")

func trait(trait):
	return traitlist[trait]





#static func set_childhood(person, specify = 'empty'):
#	var childhood
#	if specify == 'empty':
#		return
#	elif specify == '$person':
#		childhood = childhood_pool('personry')
#		person.cour = -rand_range(5,15)
#		person.conf = -rand_range(5,15)
#		person.wit = -rand_range(5,15)
#		person.charm = -rand_range(5,15)
#		person.face.beauty = rand_range(1,40)
#		if rand_range(0,10) > 7:
#			if rand_range(0,10) < 6:
#				person.traits = traits('detrimental')
#			else:
#				person.traits = traits('any')
#	else:
#		person.traits = traits('any')
#		childhood = childhood_pool('personry')
#	#person.traits = traits('any')
#	person.origins.childhood = childhood
#	var effects = childhood.effects
#	person.fetch(effects)
#	return person

static func calculate(person, origin):
	for key in origin.stats:
		if person.stats.has(key):
			var tv = person[key]
			if typeof(tv) == TYPE_DICTIONARY:
				calculate(tv, origin[key])
			else:
				person[key] = person.stats[key] + origin.stats[key]
	if origin.has('skills'):
		globals.merge(person.skills, origin.skills)