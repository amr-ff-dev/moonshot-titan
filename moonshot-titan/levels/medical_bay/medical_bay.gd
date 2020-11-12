extends QuestRoom

class_name MedicalBay

var Quest = preload("res://levels/quest_room/quest.gd")

onready var quest = Quest.new("Medical Bay", false)

func _on_Entrance_body_entered(body):
	emit_signal("player_entered", quest, $PlayerRespawn)
