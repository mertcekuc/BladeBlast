extends Node


var expScene = preload("res://scenes/EXP.tscn")
var moneyScene = preload("res://scenes/MONEY.tscn")

var rng = RandomNumberGenerator.new()
@export var money = 0
@export var experience = 0
var drop_money = false

#CHANCE TO DROP MONEY
func _ready():
	rng.randomize()
	var money_chance = rng.randi_range(0,1)
	if money_chance == 1:
		drop_money = true


#DROPPING CHECKER (IF MONEY IS TRUE OR NO)
func _on_Enemy_die():
	drop_exp()
	if drop_money == true:
		drop_money()
	

#SPAWN EXP AND GIVE IT COORDINATES
func drop_exp():
	var expInstance = expScene.instantiate()
	expInstance.location = $"../Enemy".global_position
	get_tree().get_root().add_child(expInstance)

#SPAWN MONEY AND GIVE IT COORDINATES
func drop_money():
	var moneyInstance = moneyScene.instantiate()
	moneyInstance.location = $"../Enemy".global_position
	get_tree().get_root().add_child(moneyInstance)
