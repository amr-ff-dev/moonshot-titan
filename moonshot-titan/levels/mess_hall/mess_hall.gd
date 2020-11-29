extends QuestRoom

onready var entrance = $Entrance

func _init().("Kill the Queen"):
	pass

func _on_Entrance_player_entered(_player):
	emit_player_entered($PlayerRespawn)
	emit_quest_active()

func finish_room():
	.finish_room()
	entrance.open_permanently()
