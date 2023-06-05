extends Node2D

signal spawn
signal die
signal knockback

@export var health = 100
@export var speed = 50
@export var damage = 1
@export var xp = 250

var damaging = false
var getting_damaged = false

func _ready():
	emit_signal("spawn")
	#print(self.get_path())
	

#EMIT DIE(FOR THE EXPMONEY SPAWNER) AND QUEUE FREE
func _die():
	Sounds.die()
	emit_signal("die")
	call_deferred("queue_free")
	Globals.goblin_killed = Globals.goblin_killed + 1

#CHECKING FOR BEING DAMAGED OR DAMAGING AND CALL THE TIMER TO CHECK IT
func _on_HurtBox_body_entered(body):
	if "Player" in str(body):
		damaging = true
		_on_Timer_timeout()

func _on_HurtBox_body_exited(body):
	if "Player" in str(body):
		damaging = false

func _on_Hitbox_area_entered(area):
	if "Weapon" in str(area):
		getting_damaged = true
		_on_Timer_timeout()

func _on_Hitbox_area_exited(area):
	if "Weapon" in str(area):
		getting_damaged = false
########################################

#GET HURT [EDIT PDAMAGE FOR ITS DAMAGE]
func _get_hurt():
	emit_signal("knockback")
	health = health - 100
	if health >= 0:
		_die()

#HURT PLAYER  [EDIT DAMAGE FOR ITS DAMAGE]
func _hurt():
	Globals.phealth = Globals.phealth - damage
	$hurt.play()

#COOLDOWN TIMER CHECKING IF UR GETTING HURT OR HURTING OTHERS
#MAKE A BETTER WAY TO CHECK FOR IT INSTEAD OF THIS IN THE FUTURE !!!!!!!!!!!!!!!!!!!
func _on_Timer_timeout():
	if getting_damaged == true:
		_get_hurt()
	if damaging == true:
		_hurt()
