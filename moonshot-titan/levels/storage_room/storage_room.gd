extends QuestRoom

class_name StorageRoom

var Quest = preload("res://levels/quest_room/quest.gd")

onready var quest = Quest.new("Storage Room", false)

func _on_Entrance_body_entered(_body):
	emit_signal("player_entered", quest, $PlayerRespawn)
