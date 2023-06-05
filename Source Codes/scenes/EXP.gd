extends Node2D


@export var amount = 100
@export var location: Vector2

#GET ENEMY POSITION AND SPAWN THERE
func _ready():
	self.set_position(location)


func _on_Area2D_area_entered(area):
	if "Collectexp" in str(area):
		Globals.experience = amount + Globals.experience
		Sounds.pickup()
		queue_free()
