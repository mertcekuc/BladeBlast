extends CharacterBody2D


@onready var state_machine = get_node("AnimationTree").get("parameters/playback")


var direction
var velocity
var speed = 3

var follow = "Player"
var following

var purchased = false

func _ready():
	pass # Replace with function body.



func _physics_process(delta):
	if purchased == true:
		_follow()

#Follow X + Animation
func _follow():
	_sprite_direction()
	if follow == "":
		return
	
	following = _who_to_follow()
	
	
	
	if self.global_position.distance_to(following) > 150:
			state_machine.travel("Walk")
			speed = 3
	else:
			state_machine.travel("Idle")
			speed = 0
	
	direction = global_position.direction_to(following)
	velocity = direction * speed
	move_and_collide(velocity)
	

#Return who you should follow (for the following variable) 
func _who_to_follow():
	if follow == "":
		return
	elif follow == "Player":
		return Globals.player_location

#LOOK AT PLAYER
func _sprite_direction():
	if global_position.x <= Globals.player_location.x:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
