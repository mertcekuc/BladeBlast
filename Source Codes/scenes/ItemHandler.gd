extends Node

signal sword
signal bow
signal wand

var sword = 0
var bow = 0
var wand = 0

func _ready():
	if Globals.player_class == "Fighter":
		_add_item("Sword")


func _add_item(item):
	if str(item) == "Sword":
		sword = sword + 1
		emit_signal("sword",sword)
		return
	if str(item) == "Bow":
		bow = bow + 1
		emit_signal("bow",bow)
		return
	if str(item) == "Wand":
		wand = wand + 1
		emit_signal("wand",wand)
		return


func _on_UpgradeHandler_add_item(item):
	_add_item(item)
