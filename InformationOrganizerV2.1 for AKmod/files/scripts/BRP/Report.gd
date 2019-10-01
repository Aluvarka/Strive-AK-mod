## This File makes use of daily job information stored in JobReport.gd format
## and generates a UI representation of said information inside the component
## named "root"

extends Control

var JobReport = load("res://files/scripts/BRP/JobReport.gd")
var hex_gen = load("res://files/scripts/BRP/HexGenerator.gd")

#Fonts used
var _monofont = "files/fonts/MonoHack14.tres"
var _monofontbold = "files/fonts/MonoHackB14.tres"
var _rondosmall = "files/fonts/Rondo12.tres"

var root #Root of the tree (component to be added into exterior UI)
var _summary #Left-most view containing a collection of various info
var _gold_view #Sorted list of workers who's job earned or spent gold
var _food_view #Sorted list of workers who collected food

##This function refreshes/fills the report with a new day's info
##Args job_report is an instance of the JobReport.gd object (primary source of info)
##Remaining args should be numeric values equal to the the various values just
##prior to end of day being triggered (dirt = house condition)
func generate_report(job_report, start_gold, start_food, start_supplies, start_dirt):
	_clear_report()

	_fill_summary(job_report, start_gold, start_food, start_supplies, start_dirt)
	_fill_gold_view(job_report.reports)
	_fill_food_view(job_report.reports)

##Generate the entire report UI
func _init():
	root = HBoxContainer.new()
	root.set_v_size_flags(SIZE_FILL)

	_summary = RichTextLabel.new()
	_summary.bbcode_enabled = true
	_summary.set_h_size_flags(SIZE_EXPAND_FILL)
	_summary.set_v_size_flags(SIZE_EXPAND_FILL)

	_gold_view = RichTextLabel.new()
	_gold_view.bbcode_enabled = true
	_gold_view.rect_min_size = Vector2(240,0)
	_gold_view.set_h_size_flags(4)
	_gold_view.set_v_size_flags(SIZE_EXPAND_FILL)

	_food_view = RichTextLabel.new()
	_food_view.bbcode_enabled = true
	_food_view.rect_min_size = Vector2(170,0)
	_food_view.set_h_size_flags(8)
	_food_view.set_v_size_flags(SIZE_EXPAND_FILL)

	var spacer = Control.new()
	spacer.rect_min_size = Vector2(35,0)

	root.add_child(_summary)
	root.add_child(VSeparator.new())
	root.add_child(_gold_view)
	root.add_child(VSeparator.new())
	root.add_child(_food_view)
	root.add_child(spacer)

	_setup_meta_connections(_summary)
	_setup_meta_connections(_gold_view)
	_setup_meta_connections(_food_view)

##Links the URL based triggers contained within "ui" to the listeners in "Mansion"
func _setup_meta_connections(ui):
	var mansion = globals.get_tree().get_current_scene()
	ui.connect("meta_hover_started",mansion, 'brp_smart_hover')
	ui.connect("meta_clicked", 		mansion, 'brp_smart_clicked')
	ui.connect("meta_hover_ended",	mansion, 'brp_smart_hover_end')

##Wipe out all existing report info
func _clear_report():
	_summary.clear()
	_gold_view.clear()
	_food_view.clear()

func _fill_summary(job_report, start_gold, start_food, start_supplies, start_dirt):
	var reports = job_report.reports
	var mtt = ""
	mtt += _report_gold(reports, start_gold)
	mtt += _report_food(reports, start_food)
	mtt += _report_supplies(reports, start_supplies)
	mtt += _report_cleaning(reports, start_dirt)
	mtt += _report_healing(reports)

	mtt += _report_deaths(reports)
	mtt += _report_people_returning(reports)
	mtt += _report_new_non_rebels(job_report)
	mtt += _report_preg(reports)
	mtt += _report_rest(reports)

	_summary.bbcode_text = mtt

func _report_gold(reports, start_gold):
	# var tmpgold = 0
	# for report in reports:
	# 	tmpgold += report.gold
	return "Net gold change: [color=#FFD700]%d[/color]\n" % (globals.resources.gold-start_gold)

func _report_food(reports, start_food):
	# var tmpfood = 0
	# for report in reports:
	# 	tmpfood += report.food
	return "Net food change: [color=#FFA07A]%d[/color]\n" % (globals.resources.food-start_food)

func _report_supplies(reports, start_supplies):
	# var tmpsupplies = 0
	# for report in reports:
	# 	tmpsupplies += report.supplies
	return "Net supplies change: [color=#808000]%d[/color]\n" % (globals.itemdict.supply.amount-start_supplies)

func _report_cleaning(reports, start_dirt):
	var mtt = "\n"
	var clean = globals.state.condition - start_dirt
	mtt += "Cleanliness is at [color=%s]%d[/color] and " % [
			hex_gen.r2g( (globals.state.condition - 40.0)/60.0),
			round(globals.state.condition)
		]
	if clean < 0:
		mtt += "trending [color=#FF4949]downward %d%%[/color]\n" % round(abs(clean))
	elif clean == 0:
		mtt += "holding steady\n"
	else:
		mtt += "trending [color=lime]upward %d%%[/color]\n" % round(clean)

	for report in reports:
		if report.clean > 0:
			mtt += "	[color=aqua][url=%s]%s[/url][/color] cleaned [color=lime]%d%%[/color]\n" % [
					report.person.id,
					report.person.name_short(),
					report.clean
				]

	return mtt

func _report_healing(reports):
	var mtt = ""
	var heal = 0
	for report in reports:
		if report.heal_oth > 0:
			if mtt.length() == 0:
				mtt += "\n"
			mtt += "[color=aqua][url=%s]%s[/url][/color] stitched up [color=lime]%d[/color] HP worth of wounds today.\n" % [
					report.person.id,
					report.person.name_short(),
					report.heal_oth
				]
	return mtt

func _report_deaths(reports):
	var mtt = ""
	var dead = false
	for report in reports:
		if report.dead:
			dead = true
			break

	if dead:
		mtt += '\n'
		mtt += '[u]Deaths to report[/u]\n'
		for report in reports:
			if report.dead:
				mtt += "	[color=#FF4949]%s[/color]\n" % report.person.name_long()
	return mtt

func _report_people_returning(reports):
	var mtt = ""
	for report in reports:
		if report.returned_today:
			if mtt.length() == 0:
				mtt += "\nReturnees: "
			else:
				mtt += ", "
			mtt += "[color=aqua][url=%s]%s[/url][/color]" % [report.person.id,
															report.person.name_short()]
	if mtt.length() > 0:
		mtt += "\n"
	return mtt

func _report_new_non_rebels(job_report):
	var mtt = ""
	if job_report.non_rebels.size() > 0:
		for person in job_report.non_rebels:
			if mtt.length() == 0:
				mtt += "\nRebels tamed: "
			else:
				mtt += ", "
			mtt += "[color=aqua][url=%s]%s[/url][/color]" % [person.id,
															person.name_short()]
		mtt += "\n"
	return mtt

##Rather arbitrary decision, based somewhat on current game design
##Pregnancy is "undetected" until 7% along
##Description is verbalized by trimesters
##At 95% progress the report lists "any day now"
func _report_preg(reports):
	var mtt = ""
	var preg_found = false
	for report in reports:
		var preg = report.person.preg
		if preg.duration > 0 && preg.baby != null  &&  preg.duration <= variables.pregduration:
			var progress = float(preg.duration) / variables.pregduration
			if progress < .07:
				continue

			if mtt.length() == 0:
				mtt += '\n[u]Current pregnancies:[/u]\n'

			var txt = ""
			if progress < 1.0/3:
				txt = "first trimester"
			elif progress < 2.0/3:
				txt = "second trimester"
			elif progress < 0.95:
				txt = "third trimester"
			else:
				txt = "due any day now"
			mtt += "	[color=aqua][url=%s]%s[/url][/color]: %s\n" % [report.person.id,
																		report.person.name_short(),
																		txt]

	return mtt

func _report_rest(reports):
	var mtt = ""
	var resters = false
	for report in reports:
		if report.job == "rest":
			resters = true
			break
	if resters:
		mtt += '\n'
		mtt += '[u]People who rested[/u]\n'
		for report in reports:
			if report.job == "rest":
				mtt += "	[color=aqua][url=%s]%s[/url][/color]\n" % [report.person.id,
																		report.person.name_short()]

	return mtt

func _fill_gold_view(reports):
	var mtt = "[center][color=#FFD700][u]Gold Earned[/u][/color][/center]\n"
	reports.sort_custom(JobReport, "gold_sort")
	mtt += "[right]"
	var jd = globals.jobs.jobdict
	var ttl_gold = 0
	for report in reports:
		if report.gold > 0:
			ttl_gold += report.gold

			if jd.has(report.job): #Use names for "known" jobs
				mtt += "[font=%s](%s)[/font]   [color=aqua][url=%s]%s[/url][/color]:[font=%s] [color=#FFD700]%4d[/color][/font]\n" % [
						_rondosmall,
						jd[report.job].name.substr(0,10),
						report.person.id,
						report.person.name_short(),
						_monofontbold, report.gold
					]
			else: #If job is unknown, use capitalized version of string provided
				mtt += "[font=%s](%s)[/font]   [color=#B0C4DE][url=%s]%s[/url][/color]:[font=%s] [color=#FFD700]%4d[/color][/font]\n" % [
						_rondosmall,
						report.job.capitalize().substr(0,10),
						report.person.id,
						report.person.name_short(),
						_monofontbold,
						report.gold
					]
	mtt += "[font=%s][s]           [/s]\n" % _monofontbold
	mtt += "[color=#FFD700]%d[/color][/font][/right]\n" % ttl_gold

	_gold_view.bbcode_text = mtt


func _fill_food_view(reports):
	var mtt = "[center][color=#FFA07A][u]Food Collected[/u][/color][/center]\n"
	reports.sort_custom(JobReport, "food_sort")
	var jd = globals.jobs.jobdict
	var ttl_food = 0
	mtt += "[right]"
	for report in reports:
		if report.food > 0:
			ttl_food += report.food
			if jd.has(report.job): #Use names for "known" jobs
				mtt += "[font=%s](%s)[/font]   [color=aqua][url=%s]%s[/url][/color]:[font=%s] [color=#FFA07A]%3d[/color][/font]\n" % [
						_rondosmall,
						jd[report.job].name.substr(0,10),
						report.person.id,
						report.person.name_short(),
						_monofontbold,
						report.food
					]
			else: #If job is unknown, use capitalized version of string provided
				mtt += "[font=%s](%s)[/font]   [color=#B0C4DE][url=%s]%s[/url][/color]:[font=%s] [color=#FFA07A]%3d[/color][/font]\n" % [
						_rondosmall,
						report.job.capitalize().substr(0,10),
						report.person.id,
						report.person.name_short(),
						_monofontbold, report.food
					]
	mtt += "[font=%s][s]           [/s]\n" % _monofontbold
	mtt += "[color=#FFA07A]%d[/color][/font][/right]\n" % ttl_food

	_food_view.bbcode_text = mtt
