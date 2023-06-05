extends Node

signal add_item

var upgradeatlas0 = preload("res://textures/atlas/upgrade0atlas.tres")
var upgradeatlas1 = preload("res://textures/atlas/upgrade1atlas.tres")
var upgradeatlas2 = preload("res://textures/atlas/upgrade2atlas.tres")

var rng = RandomNumberGenerator.new()

var upgrades = ["Health","Speed","Wand","Sword","Bow"]

var upgrade0 #they are strings
var upgrade1
var upgrade2

func _ready():
	rng.randomize()



func _set_upgrades():
	upgrade0 = ""
	upgrade1 = ""
	upgrade2 = ""
	for i in 3:
		var value = upgrades[randi() % upgrades.size()]
		
		while value == upgrade0 or value == upgrade1 or value == upgrade2 or _check_if_item_maxed(value):
			value = upgrades[randi() % upgrades.size()]
		
		
		
		if i == 0:
			upgrade0 = value
			$"../Upgrade1/UpgradeLabel".text = value
			$"../Upgrade1/UpgradeDescription".text = _give_description(value)
		if i == 1:
			upgrade1 = str(value)
			$"../Upgrade2/UpgradeLabel".text = value
			$"../Upgrade2/UpgradeDescription".text = _give_description(value)
		if i == 2:
			upgrade2 = str(value)
			$"../Upgrade3/UpgradeLabel".text = value
			$"../Upgrade3/UpgradeDescription".text = _give_description(value)
		

func _check_if_item_maxed(upgrade):
	if upgrade == "Sword":
		if 4 == $"../../ui3/ItemHandler".sword:
			return true
	if upgrade == "Wand":
		if 3 == $"../../ui3/ItemHandler".wand:
			return true
	if upgrade == "Bow":
		if 4 == $"../../ui3/ItemHandler".bow:
			return true
	return false



func _give_description(upgrade):
	if upgrade == "Health":
		return "Increase max health by 20"
	if upgrade == "Speed":
		return "Increase speed by 25"
	return _weapon_descriptions(upgrade)
	

func _weapon_descriptions(upgrade):
	if upgrade == "Sword":
		var swordlevel = $"../../ui3/ItemHandler".sword
		if swordlevel == 0:
			return "Add Sword to your weapons"
		if swordlevel < 4:
			return "Make sword attack faster"
		return "Add a third swing to the sword"
	
	if upgrade == "Bow":
		return "Make bow shoot faster"
	
	if upgrade == "Wand":
		return "Make the orbital move faster"



func _use_upgrade(x):
	get_tree().paused = false
	$"..".hide()
	_upgrade_stats(x)

func _upgrade_stats(whichone):
	#find which one needs to be updated
	var upgrade
	if whichone == 0:
		upgrade = upgrade0
	if whichone == 1:
		upgrade = upgrade1
	if whichone == 2:
		upgrade = upgrade2
	
	#check what does it have and do it
	if upgrade == "Health":
		Globals.phealthcap =  Globals.phealthcap + 20
		Globals.phealth = Globals.phealth + 20
		return
	if upgrade == "Speed":
		Globals.pspeed = Globals.pspeed + 25
		return
	emit_signal("add_item",upgrade)

func _on_Upgrade_pressed():
	_use_upgrade(0)

func _on_Upgrade2_pressed():
	_use_upgrade(1)

func _on_Upgrade3_pressed():
	_use_upgrade(2)

func _on_Player_levelup():
	_set_upgrades()
