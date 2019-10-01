
var _hex_gen = load("res://files/scripts/BRP/HexGenerator.gd")

### font references for easy swapping if desired
var _monofont = "files/fonts/MonoHack14.tres"
var _monofontbold = "files/fonts/MonoHackB14.tres"
var _fancyfont = "files/fonts/BlackC16.tres"
var _fancyfontbig = "files/fonts/BlackC24.tres"

## Font intended to be used for all non-specified elements of this info panel
var defaultFont = _monofont


### Main function call to produce all info within the "mansioninfo" panel display
### Returns a bbcode-formatted, multi-line report in a single string
func _format_mansion_status(MAGE_GUILD_TITLE):
	return str(_format_title(MAGE_GUILD_TITLE),
				"\n",
				_format_sleepers(),
				"\n",
				_format_manager_jobs(),
				"\n",
				_format_combat_team())


### Returns single-line Title
func _format_title(MAGE_GUILD_TITLE):
	###non-monospace font used very small spaces.  Commenting out tab size change with using monospace font
	#get_node("MainScreen/mansion/mansioninfo").set("tab_size", 8)

	var mage_title = ""
	if globals.state.rank > 0:
		mage_title = "%s " % MAGE_GUILD_TITLE[int(globals.state.rank)]
	var text = str("[center][font=%s]",
					"The Mansion of [font=%s][color=aqua][url=%s]%s%s[/url][/color][/font]",
					", City of [color=aqua]%s[/color].",
					"[/font][/center]\n") % \
							[	_fancyfont,
								_fancyfontbig,
								globals.player.id,
								mage_title,
								globals.player.name_long(),
								globals.state.location.capitalize()
							]
	return text


### Returns local title
### and multi-line string representation of sleeping position counts
func _format_sleepers():
	var sleepers = globals.count_sleepers()
	var upgrades = globals.state.mansionupgrades
	var text = ""

	text += "[u][font=%s]MANSION SLEEPING CONDITIONS:[/font][/u]\n" % _monofontbold
	# text += "[u]MANSION SLEEPING CONDITIONS:[/u]\n"

	text += "[indent]"

	#Communal sleepers
	text += "[font=%s]%s[/font] communal beds in use.\n" % \
			[	_monofontbold,
				_sleeper_coloring(sleepers.communal,
				upgrades.mansioncommunal)
			]

	#Personal sleepers
	text += "[font=%s]%s[/font] personal bedrooms in use.\n" % \
			[	_monofontbold,
				_sleeper_coloring(sleepers.personal,
				upgrades.mansionpersonal)
			]

	#Player's bed
	text += "[font=%s]%s[/font] people sharing your bed.\n" % \
			[	_monofontbold,
				_sleeper_coloring(sleepers.your_bed, upgrades.mansionbed)
			]

	text += "\n"

	#Jail occupents
	text += "[font=%s]%s[/font] jail cells occupied\n" % \
			[	_monofontbold,
				_sleeper_coloring(sleepers.jail, upgrades.jailcapacity)
			]

	#Farm sleepers
	if globals.state.farm < 3:
		text += "Farm not built\n"
	else:
		var farmcap = globals.mansionupgradesdict.farmcapacity.get('valuenumber')
		text += "[font=%s]%s[/font] farm stalls producing.\n" % \
				[	_monofontbold,
					_sleeper_coloring(sleepers.farm, int(farmcap[upgrades.farmcapacity]))
				]
	text += "[/indent]"
	return text


### Returns local title
### and multi-line string representation of key job positions
func _format_manager_jobs():
	var text = ''
	var job_color = "aqua"

	#setup vacant position descriptions
	var staff = ["", "", "", "", "", ""]
	var maids = 0
	if globals.slaves.size() < 8:
		staff[0] = "Requires 8 slaves"
	if globals.state.farm < 3:
		staff[2] = "Requires farm"
	if globals.state.mansionupgrades.mansionlab < 1:
		staff[5] = "Requires laboratory"

	#fill positions
	for person in globals.slaves:
		if person.away.duration == 0:
			if person.work == 'headgirl':
				staff[0] = _format_person(person, job_color)
			if person.work == 'jailer':
				staff[1] = _format_person(person, job_color)
			if person.work == 'farmmanager':
				staff[2] = _format_person(person, job_color)
			if person.work == 'cooking':
				staff[3] = _format_person(person, job_color)
			if person.work == 'nurse':
				staff[4] = _format_person(person, job_color)
			if person.work == 'labassist':
				staff[5] = _format_person(person, job_color)
			if person.work == 'maid':
				maids += 1

	#begin creating output
	text += "[u][font=%s]MANAGERS AND SUPPORT STAFF:[/font][/u]\n" % _monofontbold
	# text += "[u]MANAGERS AND SUPPORT STAFF:[/u]\n"
	text += "[indent]"
	text += "[font=%s]Head Slave:[/font] %s\n" % [_monofontbold, staff[0]]
	text += "[font=%s]Jailer    :[/font] %s\n" % [_monofontbold, staff[1]]
	text += "[font=%s]Farm      :[/font] %s\n" % [_monofontbold, staff[2]]
	# text += "     [s]           [/s]\n"
	text += "[font=%s]     [s]           [/s][/font]\n" % _monofontbold
	text += "[font=%s]Cook      :[/font] %s\n" % [_monofontbold, staff[3]]
	text += "[font=%s]Nurse     :[/font] %s\n" % [_monofontbold, staff[4]]
	text += "[font=%s]Lab       :[/font] %s\n" % [_monofontbold, staff[5]]
	text += "[font=%s]Maids     :[/font] %s - %s\n" % [_monofontbold, str(maids), _format_clean_slate()]
	text += "[/indent]"

	return text


### Returns local title
### and multi-line string representation of the current combat team
func _format_combat_team():
	var text = ''

	#determine camping status
	var camp = ""
	if globals.state.restday == globals.resources.day:
		camp += "[color=#ff4949]Already Camped[/color]"
	else:
		camp += "[color=lime]Camping Available[/color]"

	#begin output formatting
	text += "[font=%s][url=combat_launch]COMBAT TEAM:[/url] %s\n[/font]" % [_monofontbold, camp]
	# text += "[url=combat_launch]COMBAT TEAM:[/url] %s\n" % camp

	text += "[indent]"
	if globals.state.playergroup.size() < 1:
		text += "Noone is assigned to the team.\n"
	else:
		for i in globals.state.playergroup.duplicate():
			var person = globals.state.findslave(i)
			if person != null:
				#inverting stress so color order matches other variables (i.e. green = high value)
				var stats = [float(person.health_get())/person.stats.health_max,
							float(person.energy_get())/100,
							(100.0-person.stress_get())/100 ]
				var status = ""

				# status += "[color=%s]Health[/color] - " % _hex_gen.r2g(stats[0])
				# status += "[color=%s]Energy[/color] - " % _hex_gen.r2g(stats[1])
				# status += "[color=%s]Stress[/color] - " % _hex_gen.r2g(stats[2])
				status += "[font=%s][color=%s]Health[/color][/font] - " % [_monofont, _hex_gen.r2g(stats[0])]
				status += "[font=%s][color=%s]Energy[/color][/font] - " % [_monofont, _hex_gen.r2g(stats[1])]
				status += "[font=%s][color=%s]Stress[/color] - [/font]" % [_monofont, _hex_gen.r2g(stats[2])]

				text += "%s%s\n" % [status, _format_person(person, "aqua")]
			else:
				globals.state.playergroup.erase(i)	#Hopefully this is also handled elsewhere
													#But this existed in the original designed
													#So I'll replicate it here (as it shouldn't hurt anything)
	text += "[/indent]"

	return text


### Helper function for sleepers
### Returns the input in string format as 'val/maxVal'
### The above text is surrounded by color mark-up green/yellow/red for </=/>
func _sleeper_coloring(val, maxVal):
	var color = ""
	if val < maxVal:
		color = "[color=lime]"
	elif val == maxVal:
		color = "[color=yellow]"
	else:
		color = "[color=#ff4949]"
	return "%s%-2d[/color]/%-2d" % [color, val, maxVal]


### Helper function
### Formats a person to include markup for tooltip and clickable link
### Uses input "color" in bbcode markup to color the resulting name
func _format_person(person, color):
	# return "[font=%s][url=%s][color=%s]%s[/color][/url][/font]" % \
	# 				[	_monofontbold,
	return "[url=%s][color=%s]%s[/color][/url]" % \
					[
						str(person.id),
						color,
						person.name_short()
					]


### Returns a colored-string representation of the mansion's current cleanliness
func _format_clean_slate():
	var color = ""
	var desc = ""
	if globals.state.condition <= 20:
		color += '#ff4949'
		desc += 'complete mess'
	elif globals.state.condition <= 40:
		color += '#FFA500'
		desc += 'very dirty'
	elif globals.state.condition <= 60:
		color += 'yellow'
		desc += 'unclean'
	elif globals.state.condition <= 80:
		color += 'lime'
		desc += 'passably clean'
	else:
		color += 'green'
		desc += 'immaculate'
	return "[font=%s][color=%s]%s[/color][/font]" % [_monofontbold, color, desc]
