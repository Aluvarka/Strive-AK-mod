## This File contains a "Report" class for storing daily job data
## The file's "reports" variable is auto-filled if "Report"s are created
## using the static "Builder" function.
##
## An additional file-level variable exists, "non_rebels". Read below for details.


##Terrible hack, but for the time being this can be used to record slaves
##switching from rebellious to not during current day (onus on the user to
##clear, track, and fill this variable)
var non_rebels = []

var reports = []

class Report:
	##Details
	var person
	var job

	##Earnings
	var gold = 0
	var food = 0
	var supplies = 0
	var clean = 0
	var heal_oth = 0
	#var items = []  ## Items currently not reported in dictionary

	var returned_today = false
	var stop_rebel_today = false

	##Effects on worker
	var dead = false

	##Info
	var job_text = ""

	func _init(person, job):
		self.person = person
		self.job = job

static func gold_sort(report1, report2):
	#print(str(report1.gold > report2.gold))
	return report1.gold > report2.gold

static func food_sort(report1, report2):
	return report1.food > report2.food

static func supplies_sort(report1, report2):
	return report1.supplies > report2.supplies

func Builder(worker, job, dict):
	var report = Report.new(worker, job)
	if dict.has("gold"):
		report.gold = dict.gold
	if dict.has("food"):
		report.food = dict.food
	if dict.has("supplies"):
		report.supplies = dict.supplies
	if dict.has("clean"):
		report.clean = dict.clean
	if dict.has("heal_oth"):
		report.heal_oth = dict.heal_oth
	if dict.has("returned"):
		report.returned_today = dict.returned
	if dict.has("text"):
		report.job_text += worker.dictionary(dict.text)
	if dict.has("dead"):
		report.dead = dict.dead

	reports.append(report)
	return report
