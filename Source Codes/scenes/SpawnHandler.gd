extends Node

var rng = RandomNumberGenerator.new()


#0 enemy type , 1 howlong , 2 how many , 3 delay
#enemytypes = 0 normal
@export var enemytype = 0
@export var howlong  = 30 #how many times to repeat
@export var howmany = 4
@export var delay = 1
@export var scale_by_level = false
var enemy
var enemyamount

func _ready():
	rng.randomize()
	$Timer.wait_time = delay
	$Timer.start()
	_get_enemy_type()

func _on_Timer_timeout():
	howlong = howlong - 1
	if howlong == 0:
		queue_free()
	else:
		_spawn()

func _spawn():
	if scale_by_level == true:
		enemyamount = howmany * Globals.level
	else:
		enemyamount = howmany
	for i in enemyamount:
		rng.randomize()
		var playerlocationx = Globals.player_location.x
		var playerlocationy = Globals.player_location.y
		
		var x = rng.randi_range(0,1)
		var y = rng.randi_range(0,1)
		
		if x == 1:
			x = -1
		else:
			x = 1
		if y == 1:
			y = -1
		else:
			y = 1
		
		
		var randomx = (rng.randi_range(400,900) * x) + playerlocationx
		var randomy = (rng.randi_range(400,900) * y) + playerlocationy
		
		
		#print("player locationx =" + str(playerlocationx))
		#print("player locationy =" + str(playerlocationy))
		
		#print("my locationx =" + str(randomx))
		#print("my locationy =" + str(randomy))
		
		
		var enemyInstance = enemy.instantiate()
		enemyInstance.global_position = Vector2(randomx,randomy)
		get_tree().get_root().get_node("Main").add_child(enemyInstance)
	

func _get_enemy_type():
	if enemytype == 0:
		enemy = load("res://scenes/Enemy.tscn")
		
