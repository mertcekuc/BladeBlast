extends CharacterBody2D

var SPEED = Globals.pspeed
const ACCELERATION = 3000
const FRICTION = 1000

var velocity = Vector2.ZERO
var input_vector = Vector2.ZERO

@onready var player_sprite = $Sprite2D
@onready var state_machine = get_node("AnimationTree").get("parameters/playback")

func _physics_process(delta):
	_move(delta)
	_update_player_rotation()
	Globals.player_location = self.global_position
	SPEED = Globals.pspeed


func _move(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	velocity.x = _approach(velocity.x, input_vector.x * SPEED, ACCELERATION * delta)
	velocity.y = _approach(velocity.y, input_vector.y * SPEED, ACCELERATION * delta)

	if input_vector == Vector2.ZERO:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	set_velocity(velocity)
	move_and_slide()
	velocity = velocity
	
func _approach(current: float, target: float, delta: float) -> float:
	if current < target:
		return min(current + delta, target)
	else:
		return max(current - delta, target)

func _update_player_rotation():
	if velocity.x > 0:
		player_sprite.flip_h = true
	elif velocity.x < 0:
		player_sprite.flip_h = false
	
	
	if input_vector == Vector2.ZERO:
		state_machine.travel("Idle")
	else:
		state_machine.travel("Walk")


