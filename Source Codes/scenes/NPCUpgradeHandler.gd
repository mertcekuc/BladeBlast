extends Node

var rng = RandomNumberGenerator.new()

signal NPC_Collect_Gold
signal NPC_Collect_Exp

var upgrades = ["Collect Gold","Collect Exp"]

var upgrade0
var upgrade1
var upgrade2

#SET UPGRADES TO THE 3 OPTIONS SIGNALLED TO THIS
func _set_upgrades(x,y,z):
	$"../../CanvasLayer/ui4/Upgrade1".hide()
	$"../../CanvasLayer/ui4/Upgrade2".hide()
	$"../../CanvasLayer/ui4/Upgrade3".hide()
	
	if x != "":
		upgrade0 = str(x)
		$"../../CanvasLayer/ui4/Upgrade1/UpgradeLabel".text = x
		$"../../CanvasLayer/ui4/Upgrade1/UpgradeDescription".text = _give_description(x)
		$"../../CanvasLayer/ui4/Upgrade1".show()
	if y != "":
		upgrade1 = str(y)
		$"../../CanvasLayer/ui4/Upgrade2/UpgradeLabel".text = y
		$"../../CanvasLayer/ui4/Upgrade2/UpgradeDescription".text = _give_description(y)
		$"../../CanvasLayer/ui4/Upgrade2".show()
	if z != "":
		upgrade2 = str(z)
		$"../../CanvasLayer/ui4/Upgrade3/UpgradeLabel".text = z
		$"../../CanvasLayer/ui4/Upgrade3/UpgradeDescription".text = _give_description(z)
		$"../../CanvasLayer/ui4/Upgrade3".show()
	


func _give_description(upgrade):
	if upgrade == "Collect Gold":
		return "Will collect nearby gold"
	if upgrade == "Collect Exp":
		return "Will collect nearby exp"

func _set_texture(upgrade):
	pass

func _use_upgrade(x):
	get_tree().paused = false
	$"../../CanvasLayer/ui4".hide()
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
	if upgrade == "Collect Gold":
		emit_signal("NPC_Collect_Gold")
	if upgrade == "Collect Exp":
		emit_signal("NPC_Collect_Exp")


func _on_Upgrade_pressed():
	_use_upgrade(0)

func _on_Upgrade2_pressed():
	_use_upgrade(1)

func _on_Upgrade3_pressed():
	_use_upgrade(2)


	


func _on_Npc_choice(x,y,z):
	_set_upgrades(x,y,z)
