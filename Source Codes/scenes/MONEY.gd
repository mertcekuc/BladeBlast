extends Node2D


@export var amount = 10
@export var location: Vector2

#GET ENEMY POSITION AND SPAWN THERE
func _ready():
	self.set_position(location)

func _on_Area2D_area_entered(area):
	if "Collectmoney" in str(area):
		Globals.money = amount + Globals.money
		Sounds.pickup()
		queue_free()
