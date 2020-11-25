extends QuestRoom

class_name CrewQuarters

func _init().("Clear Crew Quarters"):
	pass

func _ready():
	call_deferred("player_entered")

func _on_Entrance_body_entered(_body):
	player_entered()

func _on_Spider_dead():
	emit_quest_complete(quest)

func player_entered():
	emit_player_entered($PlayerRespawn)
	emit_quest_active(quest)
