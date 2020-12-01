extends QuestRoom

class_name CrewQuarters

signal show_suit_achievement()

onready var entrance = $Entrance

func _init().("Clear Crew Quarters"):
	pass

func _ready():
	call_deferred("player_entered")

func _on_Entrance_player_entered(_player):
	player_entered()

func _on_Spider_dead():
	emit_signal("show_suit_achievement")
	emit_quest_complete()

func player_entered():
	emit_player_entered($PlayerRespawn)
	emit_quest_active()
	entrance.close_door()

func finish_room():
	.finish_room()
	entrance.open_permanently()
