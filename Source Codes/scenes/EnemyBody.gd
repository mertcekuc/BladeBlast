extends CharacterBody2D


@export var speed = 2
var direction
var velocity
var knockback_force = Globals.pknockback

#GOTO PLAYER
func _physics_process(delta):
	direction = global_position.direction_to(Globals.player_location)
	velocity = direction * speed
	move_and_collide(velocity)
	_sprite_direction()



#LOOK AT PLAYER
func _sprite_direction():
	if global_position.x <= Globals.player_location.x:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false




#GET KNOCKBACKED
func _on_Enemy_knockback():
	var knockback_direction = global_position.direction_to(Globals.player_location)
	velocity += knockback_direction.normalized() * knockback_force
