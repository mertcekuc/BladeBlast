extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.survivaltime == "":
		$CanvasLayer/Control/Items5.hide()
	else:
		$CanvasLayer/Control/Items5.show()
		$CanvasLayer/Control/Items5.text = "You Survived For:" + Globals.survivaltime


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/Main.tscn")


func _on_quit_pressed():
	get_tree().quit()
