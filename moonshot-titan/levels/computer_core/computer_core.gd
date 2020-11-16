extends QuestRoom

class_name ComputerCore

var Quest = preload("res://levels/quest_room/quest.gd")

onready var quest = Quest.new("Initiate Launch Sequence", false)

func _on_Entrance_body_entered(_body):
	emit_player_entered(quest, $PlayerRespawn)

func _on_Interactable_interaction_complete():
	emit_quest_complete(quest)
	$Interactable.queue_free()
