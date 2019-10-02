
extends Node

static func randsex():
	var text
	if (globals.rules['male_chance'] > 0 && rand_range(0, 100) < globals.rules['male_chance']):
		text = 'male'
	else:
		text = 'female'
	return text

static func randage():
	var text = ['teen']
	if globals.rules.children == true:
		text.append('child')
	if globals.rules.noadults == false:
		text.append('adult')
	text = text[randi()%text.size()]
	return text

static func commonrace():
	var text
	text = ['Human','Elf','Dark Elf','Halfkin Cat','Halfkin Wolf','Halfkin Fox','Halfkin Bunny','Taurus','Demon','Goblin','Ork']
	if globals.rules.furry == true:
		text.append('Beastkin Cat')
		text.append('Beastkin Wolf')
		text.append('Beastkin Fox')
		text.append('Beastkin Bunny')
	text = text[randi()%text.size()]
	return text

static func randhaircolor():
	var text
	text = ['blond','black','brown','red']
	text = text[randi()%text.size()]
	return text

static func randanyhaircolor():
	var text
	text = ['red', 'auburn', 'brown', 'black', 'white', 'green', 'purple', 'blue', 'blond', 'red']
	text = text[randi()%text.size()]
	return text

static func randanyeyecolor():
	var text = ['blue', 'green', 'brown', 'hazel', 'black', 'gray', 'purple', 'blue', 'blond', 'red', 'auburn']
	return text[randi()%text.size()]

static func randskincolor():
	var text = ['pale', 'fair', 'olive', 'tan', 'brown', 'dark', 'blue', 'purple', 'pale blue', 'green','teal']
	return text[randi()%text.size()]

static func rarerace():
	var text
	text = ['Dragonkin','Harpy','Arachna','Lamia','Nereid','Scylla','Demon','Seraph','Drow','Slime','Fairy','Centaur','Gnome']
	if globals.rules.furry == true:
		text.append('Beastkin Tanuki')
	text = text[randi()%text.size()]
	return text

static func anyrace():
	var text
	text = ['Human','Elf','Dark Elf','Halfkin Cat','Halfkin Wolf','Halfkin Fox','Halfkin Bunny','Taurus','Demon','Goblin','Ork','Dragonkin','Harpy','Arachna','Lamia','Nereid','Scylla','Seraph','Drow','Slime','Fairy','Centaur','Gnome']
	if globals.rules.furry == true:
		text.append('Beastkin Cat')
		text.append('Beastkin Wolf')
		text.append('Beastkin Fox')
		text.append('Beastkin Bunny')
		text.append('Beastkin Tanuki')
	text = text[randi()%text.size()]
	return text

func randcombspec():
	var text
	text = ['bodyguard', 'assassin', 'ranger']
	return text[randi()%text.size()]

func randsexspec():
	var text
	text = ['nympho', 'geisha','housekeeper']
	return text[randi()%text.size()]

#Leonais and Rendrassa's Quests func start
static func randbeastkin():
	var text
	text = ['Beastkin Wolf', 'Beastking Cat', 'Beastkin Fox', 'Beastkin Bunny', 'Beastkin Tanuki']
	text = text[randi()%text.size()]
	return text
#Leonais and Rendrassa's Quests func end

func questarray():
	var questsarray = {
	quest001 = {
	code = '001',
	shortdescription = 'A local aristocrat wants an obedient servant for his house. ',
	description = 'A local nobleman is looking for an obedient worker for his estate, or someone who will provide one. The semi-famous house name provides some crediability to the customer. A $sex servant must present $himself meekly and have above avearge looks. Only humanoids. ',
	reqs = [['obed','gte', 80],['conf','lte',40],['beauty','gte',round(rand_range(40,60))],['bodyshape','eq','humanoid']],
	reqstemp = [['sex', 'eq', randsex()]],
	time = round(rand_range(4,7)),
	reward = round(rand_range(90,120))*10,
	location = ['any'],
	difficulty = 'medium'
	},
	quest002 = {
	code = '002',
	shortdescription = 'A senior citizen wants someone strong to help him around his residence. ',
	description = 'An old man looking for someone physically fit to take care of everyday tasks instead of him. ',
	reqs = [['obed','gte', 80],['send','gte',round(rand_range(1,2))], ['sstr','gte',round(rand_range(1,2))]],
	reqstemp = [],
	time = round(rand_range(5,10)),
	reward = round(rand_range(45,55))*10,
	location = ['wimborn','frostford'],
	difficulty = 'easy'
	},
	quest003 = {
	code = '003',
	shortdescription = 'Exquisite collector looking for a rare species.',
	description = 'A particularly elegant letterhead bears the nuanced description of a slave desired by a famously eccentric collector. A handsome reward is offered for the delivery of a $sex $race. ',
	reqs = [['obed','gte', 80]],
	reqstemp = [['age','eq',randage()],['race','eq',rarerace()],['sex', 'eq', randsex()]],
	time = round(rand_range(6,12)),
	reward = round(rand_range(85,150))*10,
	location = ['any'],
	difficulty = 'medium'
	},
	quest004 = {
	code = '004',
	shortdescription = 'Mage guild requests a dependable, clever worker.',
	description = 'One of the Mages Order’s carefully-scribed requisition letters is posted, detailing a new position available for full-time worker. Applicants should be versed in the Magical Arts and be very dependable.',
	reqs = [['obed','gte', 80], ['wit', 'gte', round(rand_range(50,70))], ['smaf','gte',round(rand_range(2,4))],['conf', 'gte', round(rand_range(50,70))]],
	reqstemp = [],
	time = round(rand_range(6,8)),
	reward = round(rand_range(75,95))*10,
	location = ['wimborn'],
	difficulty = 'medium'
	},
	quest005 = {
	code = '005',
	shortdescription = 'Brothel owner looking for a new resident.',
	description = "As the last $race girl has been bought out by one of her frequent customers, there's a dire need for a new one. ",
	reqs = [['obed','gte', 80], ['lewdness', 'gte', 25], ['beauty','gte',round(rand_range(30,50))]],
	reqstemp = [['race','eq',commonrace()]],
	time = round(rand_range(4,6)),
	reward = round(rand_range(45,80))*10,
	location = ['any'],
	difficulty = 'easy'
	},
	quest006 = {
	code = '006',
	shortdescription = "A market stall needs a helping hand. ",
	description = "One of the somewhat successful merchants has decided to get a dependable assistant. Besides being pleasant to look at, they must be able to handle all sorts of people they would be interacting with.",
	reqs = [['obed','gte', 80], ['conf', 'gte', round(rand_range(50,60))],['charm','gte',round(rand_range(40,55))], ['beauty','gte',round(rand_range(30,50))]],
	reqstemp = [],
	time = round(rand_range(5,9)),
	reward = round(rand_range(75,95))*10,
	location = ['any'],
	difficulty = 'medium'
	},
	quest007 = {
	code = '007',
	shortdescription = "City guard looking for capable recruits. ",
	description = "A call to arms has been made by the Captain of the Watch, who is seeking a capable warrior to add to the ranks of the town guard. Prospective candidates must be able to follow orders, and have the courage to stand their ground against the city’s toughest criminals.",
	reqs = [['obed','gte', 80], ['cour','gte',round(rand_range(35,55))], ['sstr','gte',round(rand_range(2,4))], ['send', 'gte', round(rand_range(2,4))]],
	reqstemp = [],
	time = round(rand_range(5,9)),
	reward = round(rand_range(75,120))*10,
	location = ['any'],
	difficulty = 'medium'
	},
	quest008 = {
	code = '008',
	shortdescription = "Local nobleman wants a dominant slave for bed-play. ",
	description = "An anonymous request was made by a certain nobleman, who is looking for a girl with strong character for his eccentric lewd plays. ",
	reqs = [['obed','gte', 80], ['sex','eq','female'], ['lewdness', 'gte', 25],['conf','gte',65], ['asser','gte',50]],
	reqstemp = [],
	time = round(rand_range(4,8)),
	reward = round(rand_range(95,150))*10,
	location = ['wimborn','frostford'],
	difficulty = 'medium'
	},
	quest009 = {
	code = '009',
	questreq = globals.rules.male_chance >= 10,
	shortdescription = "Undisclosed customer wants a very pretty boy of young age.",
	description = "A small note promises a hefty reward for delivery of an obedient boy for bed duty. It also specifies that a desirable appearance is required. ",
	reqs = [['obed','gte', 80], ['sex','eq','male'], ['age','eq','teen'], ['beauty','gte',round(rand_range(70,90))], ['hairlength','eq',round(rand_range(1,4))]],
	reqstemp = [],
	time = round(rand_range(4,8)),
	reward = round(rand_range(115,150))*10,
	location = ['wimborn','frostford'],
	difficulty = 'medium'
	},
	quest010 = {
	code = '010',
	shortdescription = "An eccentric experimenter requests a rare species.",
	description = "You find a note of one of the more proactive mages, searching for a subject of $race race for his dangerous experiments. He would like it to be at least somewhat cooperative and preferably smart. ",
	reqs = [['obed','gte', 40], ['wit','gte',round(rand_range(35,65))]],
	reqstemp = [['race','eq',rarerace()]],
	time = round(rand_range(6,12)),
	reward = round(rand_range(55,75))*10,
	location = ['wimborn','gorn'],
	difficulty = 'easy'
	},
	quest011 = {
	code = '011',
	shortdescription = "A local nobleman is looking for a bride for his son.",
	description = "The head of a noble house wants to arrange a marriage for his love-timid son. In order to preserve their aristocratic dynasty, a pure maiden of Noble descent is required. She must be knowledgeable in the management of an estate, and have an attractiveness befitting for nobility. ",
	reqs = [['obed','gte', 80], ['sex','eq','female'],['origins','eq','rich'],['beauty','gte',round(rand_range(80,100))]],
	reqstemp = [],
	time = round(rand_range(6,12)),
	reward = round(rand_range(120,180))*10,
	location = ['wimborn','gorn'],
	difficulty = 'medium'
	},
	quest012 = {
	code = '012',
	shortdescription = "A traveller is looking for a reliable companion.",
	description = "A lone adventurer wants to purchase a steadfast person to keep them company on a long journey. ",
	reqs = [['obed','gte', 80], ['send','gte', round(rand_range(2,5))], ['cour','gte',round(rand_range(35,50))]],
	reqstemp = [],
	time = round(rand_range(6,8)),
	reward = round(rand_range(45,75))*10,
	location = ['any'],
	difficulty = 'easy'
	},
	quest013 = {
	code = '013',
	shortdescription = "A widower is looking for a replacement for his deceased wife.",
	description = "A middle-aged man wishes to move on with his life but has been too reliant on cohabitant for past years. Having neither the confidence nor the time to look for new wife personally, he has decided to cut corners and try out a different approach. ",
	reqs = [['obed','gte', 80], ['sex','eq', 'female'], ['haircolor','eq',randhaircolor()], ['bodyshape','eq','humanoid']],
	reqstemp = [],
	time = round(rand_range(6,12)),
	reward = round(rand_range(40,50))*10,
	location = ['any'],
	difficulty = 'easy'
	},
	quest014 = {
	code = '014',
	shortdescription = "A rich kid desires a new toy.",
	description = "A fairly simple note from a rich and well-bred background requests a $race girl as a birthday present for their son. Hastily scribbled in one corner of the paper you can see 'MUST HAVE BIG BOOBS' in another style of handwriting. ",
	reqs = [['obed','gte', 80], ['sex','eq', 'female'],['titssize','gte',3],['beauty','gte',round(rand_range(55,80))]],
	reqstemp = [['race','eq',commonrace()]],
	time = round(rand_range(6,8)),
	reward = round(rand_range(50,60))*10,
	location = ['wimborn','gorn'],
	difficulty = 'easy'
	},
	quest015 = {
	code = '015',
	shortdescription = "An anonymous person is looking for half-pint slave.",
	description = "You spot a request for any of the tiny-sized races for unspecified reasons. It seems to lack any other hard requirement besides specifically not being slave descendants. ",
	reqs = [['obed','gte', 80],['bodyshape','eq','shortstack'],['origins','neq','slave']],
	reqstemp = [],
	time = round(rand_range(6,8)),
	reward = round(rand_range(40,50))*10,
	location = ['gorn','wimborn'],
	difficulty = 'easy'
	},
	quest016 = {
	code = '016',
	shortdescription = "Unspecified person desires a lively slave.",
	description = "A note desiring a high grade $sex slave. Taming is not needed. ",
	reqs = [['origins','gte','rich'], ['sex', 'eq', randsex()]],
	reqstemp = [],
	time = round(rand_range(6,8)),
	reward = round(rand_range(70,90))*10,
	location = ['any'],
	difficulty = 'easy'
	},
	quest017 = {
	code = '017',
	questreq = globals.rules.male_chance >= 10,
	shortdescription = "Noble seeks young squire.",
	description = "An elegant note describes the search for a young male to act as squire for a newly knighted lord.\nMust be well behaved and physically able. ",
	reqs = [['obed','gte', 80],['sex', 'eq', 'male'], ['sstr', 'gte', round(rand_range(2,4))], ['age','neq','adult']],
	reqstemp = [],
	time = round(rand_range(7,12)),
	reward = round(rand_range(30,60))*10,
	location = ['wimborn','frostford'],
	difficulty = 'easy'
	},
	quest018 = {
	code = '018',
	shortdescription = "Fresh blood for our troupe!",
	description = "A traveling circus is looking to take in a new performer. Male or female doesn't matter, just that they be young, flexible, and a quick learner. ",
	reqs = [['obed','gte', 80], ['sagi', 'gte', round(rand_range(3,6))], ['wit','gte',round(rand_range(30,50))], ['age','neq','adult']],
	reqstemp = [],
	time = round(rand_range(7,9)),
	reward = round(rand_range(40,60))*10,
	location = ['wimborn','gorn'],
	difficulty = 'easy'
	},
	quest019 = {
	code = '019',
	questreq = globals.rules.male_chance >= 15,
	shortdescription = "An anonymous woman desires a real man to satisfy her.",
	description = "A sexually frustrated wife is looking for a male slave to give her the attention she desperately craves. Looks should not be very high, to avoid husband's suspicion. Must be well endowed with good stamina! ",
	reqs = [['sex', 'eq', 'male'], ['obed','gte', 80],['send','gte', round(rand_range(2,3))],['beauty','lte',40],['penis','gte',1]],
	reqstemp = [],
	time = round(rand_range(7,12)),
	reward = round(rand_range(30,50))*10,
	location = ['wimborn','frostford'],
	difficulty = 'easy'
	},
	quest020 = {
	code = '020',
	questreq = globals.rules.furry == true,
	shortdescription = "Wanted: dogs for breeding purposes.",
	description = 'A rather plain and slightly crinkled notice explains how a certain quirky land owner is buying pure beastkin wolves for a "breeding project." Appearances should be decent but looks are a secondary concern at the moment.  ',
	reqs = [['race','eq','Beastkin Wolf'],['obed','gte', 80],['beauty','gte',20]],
	reqstemp = [['sex', 'eq', randsex()]],
	time = round(rand_range(7,12)),
	reward = round(rand_range(30,40))*10,
	location = ['wimborn','gorn'],
	difficulty = 'easy'
	},
	####Hard Quests
	quest021 = {
	code = '021',
	questreq = true,
	shortdescription = "Skilled Fighter",
	description = 'A rich local noble seeks for a very capable fighter for unspecified task. ',
	reqs = [['obed','gte', 100],['origins','gte','commoner']],
	reqstemp = [['sex', 'eq', randsex()], ['spec', 'eq', randcombspec()], ['level', 'gte', round(rand_range(3,5))]],
	reqsfunc = ['nobadtraits'],
	time = round(rand_range(22,30)),
	reward = round(rand_range(220, 315))*10,
	location = ['any'],
	difficulty = 'hard'
	},
	quest022 = {
	code = '022',
	questreq = true,
	shortdescription = "A high grade sex slave",
	description = 'A detailed note with a list of characteristics for future sex servant and a hefty price. ',
	reqs = [['obed','gte', 100],['beauty','gte',80], ['charm','gte',80], ['origins','gte','rich'], ['lewdness', 'gte', 65]],
	reqstemp = [['sex', 'eq', randsex()], ['spec', 'eq', randsexspec()],['age','eq',randage()]],
	reqsfunc = [],
	time = round(rand_range(20,35)),
	reward = round(rand_range(250, 350))*10,
	location = ['any'],
	difficulty = 'hard'
	},
	quest023 = {
	code = '023',
	questreq = true,
	shortdescription = "An exquisite doll",
	description = 'An anonymous request has been made for a slave matching an exact specification. ',
	reqs = [['obed','gte', 100],['beauty','gte',90], ['cour','lte',20], ['conf','lte',20]],
	reqstemp = [['sex', 'eq', randsex()],['age','eq',randage()], ['haircolor','eq',randanyhaircolor()], ['eyecolor','eq', randanyeyecolor()]],
	reqsfunc = [],
	time = round(rand_range(20,35)),
	reward = round(rand_range(250, 350))*10,
	location = ['any'],
	difficulty = 'hard'
	},
	quest024 = {
	code = '024',
	shortdescription = "A rich man is looking for a wife.",
	description = "The head of a noble house wants to arrange a marriage for himself. In order to preserve their aristocratic dynasty, a pure and virgin maiden of Rich descent is required. She must be knowledgeable in the management of an estate, and have an attractiveness befitting for nobility. ",
	reqs = [['obed','gte', 80], ['sex','eq','female'],['origins','gte','rich'],['beauty','gte', 80],['conf','gte', 75],['age','neq','adult']],
	reqstemp = [],
	reqsfunc = ['virgin'],
	time = round(rand_range(6,12)),
	reward = round(rand_range(125,180))*10,
	location = ['wimborn','gorn'],
	difficulty = 'medium'
	},
	quest025 = {
	code = '025',
	shortdescription = "A stableman looking for new horse.",
	description = "The owner of local stable look for new $race for breeding his champion horse. I need fastest and hardest $sex, without any flaws.",
	reqs = [['obed','gte', 80], ['age','eq',randage()], ['sex', 'eq',randsex()], ['beauty','gte', 80], ['send','gte', round(rand_range(3,5))], ['sagi','gte', round(rand_range(3,4))]],
	reqstemp = [['race','eq', 'Centaur']],
	reqsfunc = [],
	time = round(rand_range(7,14)),
	reward = round(rand_range(145,195))*10,
	location = ['any'],
	difficulty = 'medium'
	},
	quest026 = {
	code = '026',
	shortdescription = 'Exquisite collector looking for a rare species.',
	description = "A particularly elegant letterhead bears the nuanced description of a slave desired by a famously eccentric collector. A handsome reward is offered for the delivery of a $sex $race.",
	reqs = [['obed','gte', 100],['beauty','gte', round(rand_range(75,110))]],
	reqstemp = [['age','eq',randage()],['race','eq',rarerace()],['sex', 'eq', randsex()]],
	reqsfunc = [],
	time = round(rand_range(6,12)),
	reward = round(rand_range(126,185))*10,
	location = ['any'],
	difficulty = 'medium'
	},
	quest027 = {
	code = '027',
	shortdescription = "A local lumber look for workers.",
	description = "The owner of local lumber look for new $race for hard work. They need to be strong and don't distract other workers.",
	reqs = [['obed','gte', 60], ['send','gte', round(rand_range(1,2))], ['sstr','gte', round(rand_range(1,2))], ['beauty','lte', 50]],
	reqstemp = [],
	reqsfunc = [],
	time = round(rand_range(7,14)),
	reward = round(rand_range(25,43))*10,
	location = ['any'],
	difficulty = 'easy'
	},
	quest028 = {
	code = '028',
	shortdescription = "A local slaver look for fresh meat.",
	description = "A member of local slaveguild try to find person who suit him. He is looking for $sex $age",
	reqs = [['conf','lte', round(rand_range(20,50))],['wit','gte', round(rand_range(40,60))]],
	reqstemp = [['age','eq',randage()],['sex', 'eq', randsex()],['race','eq',anyrace()]],
	reqsfunc = [],
	time = round(rand_range(7,14)),
	reward = round(rand_range(33,54))*10,
	location = ['any'],
	difficulty = 'easy'
	},
	quest029 = {
	code = '029',
	shortdescription = "A local looking for young innocent slave",
	description = "A member of local pervert club try to find innocent $sex of $age age",
	reqs = [['obed','gte', 80],['beauty','gte', 35]],
	reqstemp = [['age','neq','adult'],['sex', 'eq', randsex()]],
	reqsfunc = ['virgin'],
	time = round(rand_range(7,14)),
	reward = round(rand_range(40,62))*10,
	location = ['any'],
	difficulty = 'easy'
	},
	quest030 = {
	code = '030',
	shortdescription = "Rich man looking for good, cute pet",
	description = "A member of local pervert club try to find suitabe pet. $he must be $age age and totally submissive",
	reqs = [['obed','gte', 100],['asser','lte',40],['conf','lte',30],['beauty','gte', round(rand_range(50,70))]],
	reqstemp = [['age','eq', randage()],['sex', 'eq', randsex()]],
	reqsfunc = [],
	time = round(rand_range(7,14)),
	reward = round(rand_range(40,62))*10,
	location = ['any'],
	difficulty = 'easy'
	},
	####   Rendrassa's Quests
	quest124 = {
	code = '124',
	questreq = globals.rules.furry == true,
	shortdescription = 'An anti slavery advocate is rescuing his fellow beastkin. ',
	description = 'A local beastkin is doing his part to buy enslaved beastkin of any type to restore them to freedom. His only requirement is they be pure breastkin. Taming is not required. ',
	reqs = [['race','eq', randbeastkin()]],
	reqstemp = [['sex', 'eq', randsex()]],
	reqsfunc = [],
	time = round(rand_range(3,5)),
	reward = round(rand_range(30,40))*10,
	location = ['frostford'],
	difficulty = 'easy'
	},
	quest125 = {
	code = '125',
	shortdescription = 'Adventuring party needs dedicated healer. ',
	description = 'A varied group of adventurers are in desperate need of a healer for their travels. The healer must have high skills in magic, the courage to not falter even in grim circumstances and be ever loyal to the party. ',
	reqs = [['obed','gte', 80], ['smaf','gte', 3], ['cour','gte',40]],
	reqstemp = [['sex', 'eq', randsex()]],
	reqsfunc = [],
	time = round(rand_range(6,8)),
	reward = round(rand_range(80,110))*10,
	location = ['any'],
	difficulty = 'medium'
	},
	quest126 = {
	code = '126',
	questreq = globals.rules.children == true,
	shortdescription = 'Older gentleman seeks young heir. ',
	description = 'An aged man needs to name an heir for his estate. He requires a young human boy with similar physical features to himself and carry himself fairly well. The boy must be well behaved and quite smart for his age.',
	reqs = [['race','eq','Human'], ['sex', 'eq', 'male'], ['obed','gte', 80], ['origins','gte','common'], ['wit','lte',40], ['haircolor','eq',randhaircolor()], ['eyecolor','eq',randanyeyecolor()], ['age','eq','child']],
	reqstemp = [],
	reqsfunc = [],
	time = round(rand_range(4,7)),
	reward = round(rand_range(90,120))*10,
	location = ['wimborn'],
	difficulty = 'hard'
	},
	quest127 = {
	code = '127',
	questreq = globals.rules.children == true,
	shortdescription = 'Needing a young servant girl. ',
	description = 'A call for a young girl to act as servant and playmate has been issued by a well off family for their growing daughter. The girl in need must be biddable, quick and submissive.',
	reqs = [['sex', 'eq', 'female'], ['obed','gte', 80], ['sagi','lte',4], ['cour','lte',40], ['age','eq','child'], ['bodyshape','eq','humanoid']],
	reqstemp = [],
	reqsfunc = [],
	time = round(rand_range(5,9)),
	reward = round(rand_range(70,90))*10,
	location = ['any'],
	difficulty = 'medium'
	},
	quest128 = {
	code = '128',
	shortdescription = 'Looking for a suitable mate. ',
	description = "A member of the $race desires a worthy mate for reproductive purposes. The slave must be at least average in appearance and open to commands. ",
	reqs = [['obed','gte', 80],['beauty','gte',50]],
	reqstemp = [['sex', 'eq', randsex()], ['race','eq',rarerace()]],
	reqsfunc = [],
	time = round(rand_range(6,10)),
	reward = round(rand_range(80,110))*10,
	location = ['any'],
	difficulty = 'medium'
	},
	####   Leo's Quest
	quest201 = {
	code = '201',
	shortdescription = "Mine workers needed.",
	description = "Short slaves are needed to work in the mines. They must be strong, agile, and disciplined. ",
	reqs = [['obed','gte', 80],['bodyshape','eq','shortstack'],['cour','gte',40], ['sagi','gte',2],['sstr','gte',2]],
	reqstemp = [],
	reqsfunc = [],
	time = round(rand_range(6,8)),
	reward = round(rand_range(60,90))*10,
	location = ['gorn','frostford'],
	difficulty = 'medium'
	},
	}
	return questsarray

#warning-ignore:unused_class_variable
var reqsfuncdescript = {nobadtraits = 'No Negative Physical Traits.', virgin = 'Intake virgin.'}

func nobadtraits(person):
	var result = true
	
	for i in person.get_traits():
		if i.tags.has('detrimental') && i.tags.has('physical'):
			result = false
	
	return result
	
func virgin(person):
	var result = false
	
	if person.vagvirgin == true && person.assvirgin == true && person.penisvirgin == true:
		result = true
	return result

func generatequest(town, difficulty = 'easy'):
	var questarray = questarray()
	var questarray2 = []
	for i in questarray:
		if (questarray[i].location.find('any') >= 0 || questarray[i].location.find(town) >= 0) &&  questarray[i].difficulty == difficulty:
			var quest = {}
			quest.difficulty = questarray[i].difficulty
			quest.code = questarray[i].code
			quest.shortdescription = questarray[i].shortdescription
			quest.description = questarray[i].description
			quest.time = questarray[i].time
			quest.reward = questarray[i].reward
			if globals.state.spec == 'Slaver':
				quest.reward = round(quest.reward * 1.33)
			quest.location = town
			quest.reqs = questarray[i].reqs
			quest.taken = false
			quest.type = 'slaverequest'
			if questarray[i].has('reqsfunc'):
				quest.reqsfunc = questarray[i].reqsfunc
			for ii in questarray[i].reqstemp:
				quest.reqs.insert(0, ii)
			if questarray[i].has('questreq'):
				if questarray[i].questreq != true:
					pass
				else:
					questarray2.append(quest)
			else:
				questarray2.append(quest)
	
	var quest = questarray2[rand_range(0,questarray2.size())]
	if town == 'wimborn':
		globals.state.repeatables.wimbornslaveguild.append(quest)
		globals.state.repeatables.wimbornslaveguild.sort_custom(self, 'sort_difficulty')
	elif town == 'gorn':
		globals.state.repeatables.gornslaveguild.append(quest)
	elif town == 'frostford':
		globals.state.repeatables.frostfordslaveguild.append(quest)

static func sort_difficulty(value1, value2):
	var array = ['easy','medium','hard']
	if array.find(value1.difficulty) < array.find(value2.difficulty):
		return true
	else:
		return false
