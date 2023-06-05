extends Node2D

var level = 0

func _ready():
	hide()
	$Weapon/CollisionShape2D.disabled = true
	

#LEVELING UP
func _on_ItemHandler_sword(level): 
	if level == 1:
		show()
		$Weapon/CollisionShape2D.disabled = false
		$AnimationPlayer.play("Attack")
		return
	if level == 2:
		$AnimationPlayer.play("Attack2")
		return
	if level == 3:
		$AnimationPlayer.play("Attack3")
		return
	if level == 4:
		$AnimationPlayer.play("Attack4")
		return
