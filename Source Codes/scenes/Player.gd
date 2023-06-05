extends Node2D

signal levelup

#player info
var level = Globals.level
var experience = Globals.experience
var money = Globals.money
var phealth = Globals.phealth
var pspeed = Globals.pspeed
var prange = Globals.prange
var items = Globals.items


#timeinfo
var time = 0
var minute = 0
var second = 0

func _ready():
	_update_stats()
	$Timer.start()

func _process(delta):
	_update_stats()

#UPDATING THE BAR AND UPDATING THE GLOBAL LEVEL IF ITS FULL DEPENDING ON THE BAR
func _leveling():
	if experience >= $Player/Camera2D/ui2/ProgressBar.max_value:
		level = level + 1
		Globals.level = level
		Globals.experience = Globals.experience - $Player/Camera2D/ui2/ProgressBar.max_value
		$Player/Camera2D/ui2/ProgressBar.max_value = int($Player/Camera2D/ui2/ProgressBar.max_value) * 1.2
		_level_up()
	$Player/Camera2D/ui2/ProgressBar.value = Globals.experience

#UPDATE STATS TO GLOBAL VERSIONS
#UPDADTE THE TEXT
#LEVEL UP
func _update_stats():
	level = Globals.level
	experience = Globals.experience
	money = Globals.money
	phealth = Globals.phealth
	pspeed = Globals.pspeed
	_leveling()
	_update_text()
	#KILL PLAYER
	if phealth <= 0:
		minute = "%02d" % (time / 60)
		second = "%02d" % (time % 60)
		Globals.survivaltime = str(minute) + ":" + str(second)
		get_tree().change_scene_to_file("res://scenes/Menu.tscn")

#UPDATE TEXT
func _update_text():
	$Player/Camera2D/ui/Health.text = str(phealth)
	$Player/Camera2D/ui/Speed.text = str(pspeed)
	$Player/Camera2D/ui/Range.text = str(prange)
	$Player/Camera2D/ui2/Level.text = "Level: " + str(level)
	$Player/Camera2D/ui2/Money.text = "Gold: " + str(money)
	$Player/Camera2D/ui2/ProgressBar.value = Globals.experience

#UPDATE TIMER
func _on_Timer_timeout():
	time = time + 1
	minute = "%02d" % (time / 60)
	second = "%02d" % (time % 60)
	$Player/Camera2D/ui2/Time.text = "Time: " + minute + ":" + second

#SELECT REWARD UPON LEVELING UP
func _level_up():
	$"level up".play()
	$Player/Camera2D/ui4.show()
	emit_signal("levelup")
	get_tree().paused = true
	pass


func _on_Npc_npcbought():
	_update_stats()
