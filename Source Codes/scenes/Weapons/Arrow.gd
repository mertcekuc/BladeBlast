extends CharacterBody2D

@export var damage = 10
@export var speed = 500
@export var pierce = 1
var bodies
var direction
var velocity
var all_enemy 
var shoot_distance = 7000000000
var enemy_distance
var closest

func _ready():
	_disappear()
	_get_enemy_nearest()

func _physics_process(delta):
	look_at(direction)
	velocity = Vector2(speed, 0).rotated(self.global_position.direction_to(direction).angle())
	move_and_collide(velocity * delta)


func _disappear():
	await get_tree().create_timer(1).timeout
	self.queue_free()

func _get_enemy_nearest():
	all_enemy = get_tree().get_nodes_in_group("Enemy")
	for enemy in all_enemy:
		enemy_distance = position.distance_to(enemy.global_position)
		
		if enemy_distance <= shoot_distance:
			closest = enemy.global_position
	direction = closest

