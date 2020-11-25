extends QuestRoom

class_name ComputerCore

func _init().("Initiate Launch Sequence"):
	pass

func _on_Entrance_body_entered(_body):
	emit_player_entered($PlayerRespawn)
	emit_quest_active(quest)

func _on_Interactable_interaction_complete():
	emit_quest_complete(quest)
	$Interactable.queue_free()
