extends QuestRoom

class_name CrewQuarters

var Quest = preload("res://levels/quest_room/quest.gd")

onready var quest = Quest.new("Crew Quarters", false)

func _ready():
	call_deferred("player_entered")

func _on_Entrance_body_entered(_body):
	player_entered()

func _on_Spider_dead():
	emit_signal("quest_complete", quest)

func player_entered():
	emit_signal("player_entered", quest, $PlayerRespawn)
