extends QuestRoom

class_name OxygenatorRoom

func _init().("Repair the Oxygenator"):
	pass

func _on_Entrance_body_entered(_body):
	emit_player_entered($PlayerRespawn)
	emit_quest_active(quest)

func _on_OxygenatorDevice_interaction_complete():
	emit_quest_complete(quest)
