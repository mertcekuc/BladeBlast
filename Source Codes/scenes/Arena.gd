extends Node2D

var expScene = preload("res://scenes/EXP.tscn")
var moneyScene = preload("res://scenes/MONEY.tscn")

func _spawn_exp(mposition,experience):
	var expInstance = expScene.instantiate()
	expInstance.position = mposition
	expInstance.amount = experience
