extends QuestRoom

onready var entrance = $Entrance

func _init().("Get Food Rations"):
	pass

func _on_Entrance_player_entered(_player):
	emit_player_entered($PlayerRespawn)
	emit_quest_active()

func finish_room():
	.finish_room()
	entrance.open_permanently()

func _on_Interactable_interaction_complete():
	emit_quest_complete()
	$Interactable.queue_free()
