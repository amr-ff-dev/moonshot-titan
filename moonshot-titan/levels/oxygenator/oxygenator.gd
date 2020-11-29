extends QuestRoom

class_name OxygenatorRoom

onready var entrance = $Entrance

func _init().("Repair the Oxygenator"):
	pass

func _on_Entrance_player_entered(_player):
	emit_player_entered($PlayerRespawn)
	emit_quest_active()

func _on_OxygenatorDevice_interaction_complete():
	emit_quest_complete()

func finish_room():
	.finish_room()
	entrance.open_permanently()
