extends Node2D

var arrow = preload("res://scenes/Weapons/Arrow.tscn")
var distance
var nearestDirection = Vector2(1000,0)
var nearestEnemy

var level = 0


#SPAWN ARROW
func _on_Timer_timeout():
	var arrowInstance = arrow.instantiate()
	arrowInstance.global_position = Globals.player_location
	get_tree().get_root().add_child(arrowInstance)


#LEVELING UP
func _on_ItemHandler_bow(level):
	if level == 1:
		$Timer.start()
		$Timer.wait_time = 5
		return
	if level == 2:
		$Timer.start()
		$Timer.wait_time = 4
		return
	if level == 3:
		$Timer.start()
		$Timer.wait_time = 3
		return
	if level == 4:
		$Timer.start()
		$Timer.wait_time = 2
		return
