extends Node2D


var level = 0

func _ready():
	hide()
	$Weapon/CollisionShape2D.disabled = true

#LEVELING UP
func _on_ItemHandler_wand(newlevel):
	level = newlevel
	_level_up()

func _level_up():
	if level == 1:
		show()
		$Weapon/CollisionShape2D.disabled = false
		$AnimationPlayer.play("Attack1")
		return
	if level == 2:
		$AnimationPlayer.play("Attack2")
		return
	if level == 3:
		$AnimationPlayer.play("Attack3")
		return
