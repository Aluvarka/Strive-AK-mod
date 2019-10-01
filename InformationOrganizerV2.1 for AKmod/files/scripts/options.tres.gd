extends Panel

var selectedslave

func ruletoggle(rule):
	if rule in ['fadinganimation','spritesindialogues','randomcustomportraits','instantcombatanimation','thumbnails']:
		globals.rules[rule] = get_node("TabContainer/Settings/"+rule).pressed
	else:
		globals.rules[rule] = get_node("TabContainer/Game/"+rule).pressed

	if rule == 'furry':
		if (globals.rules['furry'] == false):
			get_node("TabContainer/Game/furrynipples").set_disabled(true)
			get_node("TabContainer/Game/furrynipples").set_pressed(false)
			globals.rules['furrynipples'] = false
		else:
			get_node("TabContainer/Game/furrynipples").set_disabled(false)
	if rule == 'futa':
		if (globals.rules['futa'] == false):
			get_node("TabContainer/Game/futaslider").hide()
			get_node("TabContainer/Game/futaballs").set_disabled(true)
			get_node("TabContainer/Game/futaballs").set_pressed(false)
			globals.rules['futaballs'] = false
		else:
			get_node("TabContainer/Game/futaslider").show()
			get_node("TabContainer/Game/futaballs").set_disabled(false)
	if rule == 'children':
		if globals.rules.children == false:
			get_node("TabContainer/Game/noadults").hide()
			get_node("TabContainer/Game/noadults").set_pressed(false)
			globals.rules.adults = true
		else:
			get_node("TabContainer/Game/noadults").show()


func maleslider(value):
	globals.rules.male_chance = value
	get_node("TabContainer/Game/malesslider").set_value(globals.rules['male_chance'])
	get_node("TabContainer/Game/malesliderlabel").set_text('Random gender occurrence balance: ' + str(globals.rules['male_chance']) + '% of males')

func futaslider(value):
	globals.rules.futa_chance = value
	get_node("TabContainer/Game/futaslider").set_value(globals.rules['futa_chance'])
	get_node("TabContainer/Game/futasliderlabel").set_text('Random futa occurrence: ' + str(globals.rules['futa_chance']) + '% of females')

func _ready():
	###BRP - Modified 2019/07/29
	###Initialize my fonts so they can listen for font size changes
	_brp_init_used_fonts()
	###BRP - End mod

	futaslider(globals.rules.futa_chance)
	maleslider(globals.rules.male_chance)
	for i in ['furry','furrynipples','futa','futaballs','slaverguildallraces','children','receiving','permadeath','noadults']:
		get_node("TabContainer/Game/" + i).pressed = globals.rules[i]
		get_node("TabContainer/Game/" + i).connect("pressed", self, 'ruletoggle', [i])
	for i in ['fadinganimation','spritesindialogues','randomcustomportraits','instantcombatanimation','thumbnails']:
		get_node("TabContainer/Settings/" + i).pressed = globals.rules[i]
		get_node("TabContainer/Settings/" + i).connect("pressed", self, 'ruletoggle', [i])
	get_node("TabContainer/Game/aliseoption").select(globals.rules.enddayalise)
	get_node("TabContainer/Settings/fullscreen").set_pressed(OS.is_window_fullscreen())
	get_node("TabContainer/Supporter section/cheatpassword").set_text('')
	get_node("TabContainer/Settings/fontsize").set_value(globals.rules.fontsize)
	$TabContainer/Settings/musicslider.connect("value_changed", self, "_on_musicslider_value_changed")
	$TabContainer/Settings/soundslider.connect("value_changed", self, "_on_soundslider_value_changed")
	_on_soundslider_value_changed(round(globals.rules.soundvol*3))
	_on_musicslider_value_changed(round(globals.rules.musicvol*3))
	checkpatreonpassword()
	if globals.state.nopoplimit == true:
		get_node("cheatpanel/removepopcap").set_disabled(true)

func checkpatreonpassword():
	if globals.state.password == 'fkfynroh':
		get_node("TabContainer/Supporter section/cheats").set_disabled(false)
		get_node("TabContainer/Supporter section/cheatpasswordenter").set_disabled(true)
	else:
		get_node("TabContainer/Supporter section/cheats").set_disabled(true)
		get_node("TabContainer/Supporter section/cheatpasswordenter").set_disabled(false)

func show():
	selectedslave = null
	self.visible = true


func _on_malesslider_value_changed( value ):
	globals.rules['male_chance'] = value
	get_node("TabContainer/Game/malesliderlabel").set_text('Random gender occurrence balance: ' + str(globals.rules['male_chance']) + '% of males')

func _on_futaslider_value_changed( value ):
	globals.rules['futa_chance'] = value
	get_node("TabContainer/Game/futasliderlabel").set_text('Random futa occurrence: ' + str(globals.rules['futa_chance']) + '% of females')



func _on_fullscreen_pressed():
	OS.set_window_fullscreen(get_node("TabContainer/Settings/fullscreen").is_pressed())
	hide()
	show()
	get_node("screenpopup").popup()


func _on_Done_pressed():
	hide()
	globals.overwritesettings()

func _on_cheatpasswordenter_pressed():
	globals.state.password = get_node("TabContainer/Supporter section/cheatpassword").get_text()
	checkpatreonpassword()
	if get_node("TabContainer/Supporter section/cheats").is_disabled() == false:
		if globals.state.supporter == false:
			get_node("TabContainer/Supporter section/supporterpanel").show()
		globals.state.supporter = true

func _on_cheats_pressed():
	get_node("cheatpanel").show()

func _on_close_pressed():
	get_node("cheatpanel").hide()


func _on_cheatpanel_visibility_changed(person = null):
	if person == null:
		get_node("cheatpanel/selectedslavelabel").set_text('Selected slave - none')
		get_node("cheatpanel/maxobed").set_disabled(true)
		get_node("cheatpanel/maxlust").set_disabled(true)
		get_node("cheatpanel/maxloyalty").set_disabled(true)
		get_node("cheatpanel/maxlewd").set_disabled(true)
		get_node("cheatpanel/nostress").set_disabled(true)
		get_node("cheatpanel/addskillpoints").set_disabled(true)
		get_node("cheatpanel/addlevel").set_disabled(true)
	else:
		get_node("cheatpanel/selectedslavelabel").set_text('Selected slave - '+person.name + '\nObedience - '+str(person.obed)+'\nLust - '+str(person.lust)+'\nLoyalty - '+str(person.loyal) + '\nLewdness - '+str(person.lewdness)+'\nStress - '+str(person.stress) + '\nSkillpoints - ' + str(person.skillpoints) )
		selectedslave = person
		get_node("cheatpanel/maxobed").set_disabled(false)
		get_node("cheatpanel/maxlust").set_disabled(false)
		get_node("cheatpanel/maxloyalty").set_disabled(false)
		get_node("cheatpanel/maxlewd").set_disabled(false)
		get_node("cheatpanel/nostress").set_disabled(false)
		get_node("cheatpanel/addskillpoints").set_disabled(false)
		get_node("cheatpanel/addlevel").set_disabled(false)

func _on_selectslave_pressed():
	if get_tree().get_current_scene().find_node('mansion'):
		get_tree().get_current_scene().selectslavelist(true, '_on_cheatpanel_visibility_changed', self)


func _on_unlockspells_pressed():
	for i in globals.spelldict.values():
		i.learned = true
		if globals.abilities.abilitydict.has(i.code) == true:
			globals.player.ability.append(i.code)

func _on_cheatgold_pressed():
	globals.resources.gold = get_node("cheatpanel/SpinBox").get_value()


func _on_cheatfood_pressed():
	globals.resources.food = get_node("cheatpanel/SpinBox").get_value()


func _on_cheatmana_pressed():
	globals.resources.mana = get_node("cheatpanel/SpinBox").get_value()


func _on_maxloyalty_pressed():
	selectedslave.loyal = 100
	_on_cheatpanel_visibility_changed(selectedslave)
	if selectedslave.effects.has('captured') == true:
		selectedslave.add_effect(globals.effectdict.captured, true)


func _on_maxobed_pressed():
	selectedslave.obed += 100
	_on_cheatpanel_visibility_changed(selectedslave)
	if selectedslave.effects.has('captured') == true:
		selectedslave.add_effect(globals.effectdict.captured, true)


func _on_maxlewd_pressed():
	selectedslave.lewdness = 100
	_on_cheatpanel_visibility_changed(selectedslave)


func _on_maxlust_pressed():
	if $cheatpanel/maxlust.text == "Max Lust":
		selectedslave.lust = 100
		$cheatpanel/maxlust.text = "Min Lust"
	else:
		selectedslave.lust = 0
		$cheatpanel/maxlust.text = "Max Lust"
	_on_cheatpanel_visibility_changed(selectedslave)


func _on_nostress_pressed():
	selectedslave.stress += -200
	_on_cheatpanel_visibility_changed(selectedslave)



func _on_addskillpoints_pressed():
	selectedslave.skillpoints += 1
	_on_cheatpanel_visibility_changed(selectedslave)


func _on_addlevel_pressed():
	selectedslave.level += 1


func _on_levelup_pressed():
	if globals.player != null:
		globals.player.skillpoints += 1



###BRP
var brp_used_fonts = []
###Not the best design here
###But for now it's a record of what fonts I added to the game
###This function loads all of my fonts so that they can be referenced/used
###when global font size is adjusted
func _brp_init_used_fonts():
	#For Reference
	#Font size settings locations
	#globals.rules.fontsize
	#get_node("TabContainer/Settings/fontsize").value

	#load my known fonts
	if brp_used_fonts.size() == 0:
		brp_used_fonts.append(load("res://files/fonts/BlackC16.tres"))
		brp_used_fonts.append(load("res://files/fonts/BlackC24.tres"))
		brp_used_fonts.append(load("res://files/fonts/MonoHack14.tres"))
		brp_used_fonts.append(load("res://files/fonts/MonoHackB14.tres"))
		brp_used_fonts.append(load("res://files/fonts/MonoHack16.tres"))
		brp_used_fonts.append(load("res://files/fonts/MonoHackB16.tres"))
		brp_used_fonts.append(load("res://files/fonts/Rondo12.tres"))

		#Font files were designed based on a default setting of 16
		#Some fonts are intentionally larger or smaller than 16 points to improve the display
		#If the current size is something other than 16, determine the size difference
		var adj = globals.rules.fontsize-16
		#If there is a size difference, shift all the fonts by that adjustment value
		if adj != 0:
			for font in brp_used_fonts:
				font.set_size(font.get_size()+adj)


func _on_fontsize_value_changed( value ):
	###BRP - Modified on 2019/07/29
	#make sure fonts are initialized
	if brp_used_fonts.size() == 0:
		_brp_init_used_fonts()
	#determine amount new size differs from previous setting
	var size_adj = value - globals.rules.fontsize
	#adjust all fonts by points adjustment value
	if size_adj != 0:
		for font in brp_used_fonts:
			font.set_size(font.get_size()+size_adj	)
	###BRP - End mod

	if get_tree().get_current_scene().find_node('MainScreen') != null:
		get_tree().get_current_scene().get_node('MainScreen').get_font('font').set_size(value)
	elif get_tree().get_current_scene().find_node('changelog') != null:
		get_tree().get_current_scene().get_node('TextureFrame/changelog').get_font('font').set_size(value)
	globals.rules.fontsize = value


func _on_removepopcap_pressed():
	globals.state.nopoplimit = true
	if globals.state.nopoplimit == true:
		get_node("cheatpanel/removepopcap").set_disabled(true)

func _on_musicslider_value_changed(value):
	globals.rules.musicvol = round(value/3)
	get_node("TabContainer/Settings/musicslider/Label3").set_text("Music Volume: " +str(value))
	get_node("TabContainer/Settings/musicslider").set_value(value)
	if get_tree().get_current_scene().find_node("music"):
		get_tree().get_current_scene().get_node("music").set_volume_db(round(value/3))
		if globals.rules.musicvol <= 0:
			get_tree().get_current_scene().get_node('music').stop()
		else:
			if get_tree().get_current_scene().get_node('music').playing == false:
				get_tree().get_current_scene().get_node('music').play()

func _on_soundslider_value_changed( value ):
	globals.rules.soundvol = round(value/3)
	get_node("TabContainer/Settings/soundslider/Label3").set_text("Sound Volume: " +str(value))
	get_node("TabContainer/Settings/soundslider").set_value(value)


func _on_screenresize_pressed():
	globals.rules.oldresize = get_node("TabContainer/Settings/screenresize").is_pressed()
	if globals.rules.oldresize == true:
		get_tree().set_screen_stretch(1, 1, Vector2(1080,600))
	else:
		get_tree().set_screen_stretch(0, 1, Vector2(1080,600))
	hide()
	show()


func _on_RichTextLabel_meta_clicked( meta ):
	if meta == 'patreon':
		OS.shell_open('https://www.patreon.com/maverik')


func _on_confirm_pressed():
	globals.rules.fullscreen = get_node("TabContainer/Settings/fullscreen").is_pressed()
	globals.overwritesettings()
	get_node("screenpopup").hide()



func _on_cancel_pressed():
	OS.set_window_fullscreen(!get_node("TabContainer/Settings/fullscreen").is_pressed())
	get_node("TabContainer/Settings/fullscreen").set_pressed(globals.rules.fullscreen)
	get_node("screenpopup").hide()



func _on_aliseoption_item_selected( ID ):
	globals.rules.enddayalise = ID



func _on_addupgradepoint_pressed():
	globals.resources.upgradepoints += 5


func _on_unlockgallery_pressed():
	for i in globals.charactergallery.values():
		i.unlocked = true
		i.nakedunlocked = true
		for k in i.scenes:
			k.unlocked = true




func _on_screenconf_pressed():
	globals.rules.screenwidth = int(get_node("TabContainer/Settings/screenresize/width").get_text())
	globals.rules.screenheight = int(get_node("TabContainer/Settings/screenresize/height").get_text())
	get_tree().set_screen_stretch(1, 1, Vector2(globals.rules.screenwidth,globals.rules.screenheight))






func _on_addlearnpoints_pressed():
	selectedslave.learningpoints += 10
