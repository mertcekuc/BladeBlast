extends Node2D

signal choice
signal npcbought

@export var npc = ""

var purchased = false
var in_area = false

func _ready():
	$Npc/Dialog.hide()

#TELL THE PLAYER TO BUY OR TELL YOUR NEEDS
func _on_Area2D_body_entered(body):
	
	if "Player" in str(body):
		in_area = true
		if purchased == false:
			if 100 <= Globals.money:
				$Npc/Dialog.text = "Press E to Recruit"
			else:
				$Npc/Dialog.text = "100 Gold to Recruit"
			$Npc/Dialog.show()
		


func _on_Area2D_body_exited(body):
	if "Player" in str(body):
		in_area = false
		$Npc/Dialog.hide()

#ACCEPT AND BUY
func _input(event):
	if Input.is_action_just_pressed("ui_accept") and purchased == false and in_area == true and Globals.money >= 100:
		_bought()
		_on_Area2D_body_entered("Player")
		Globals.money = Globals.money - 100

#MAKE IT PURCHASED AND SEND THE CHOICES SIGNAL
func _bought():
	purchased = true
	$Npc.purchased = true
	emit_signal("choice","","Collect Exp","Collect Gold")
	$CanvasLayer/ui4.show()
	$Npc/Dialog.text = "Recruited!"
	get_tree().paused = true
	emit_signal("npcbought")




func _on_NPCUpgradeHandler_NPC_Collect_Exp():
	$Npc/Collectexp/CollisionShape2D.disabled = false


func _on_NPCUpgradeHandler_NPC_Collect_Gold():
	$Npc/Collectmoney/CollisionShape2D.disabled = false


