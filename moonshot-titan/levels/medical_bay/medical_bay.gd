extends QuestRoom

class_name MedicalBay

onready var entrance = $Entrance

func _init().("Rescue the Engineer"):
	pass

func _on_Entrance_player_entered(_player):
	emit_player_entered($PlayerRespawn)
	emit_quest_active()

func _on_Interactable_interaction_complete():
	emit_quest_complete()
	$Interactable.queue_free()
	$Engineer.rescued()

func _on_Engineer_request_open_door():
	entrance.open_permanently()

func finish_room():
	.finish_room()
