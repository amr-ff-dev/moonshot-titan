extends QuestRoom

signal unlock_security_doors()

class_name ComputerCore

onready var entrance = $Entrance

func _init().("Unlock the Secure Doors"):
	pass

func _on_Entrance_player_entered(_player):
	emit_player_entered($PlayerRespawn)
	emit_quest_active()

func _on_Interactable_interaction_complete():
	emit_quest_complete()
	$Interactable.queue_free()

func finish_room():
	.finish_room()
	entrance.open_permanently()
	emit_signal("unlock_security_doors")
