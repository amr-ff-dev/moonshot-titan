extends QuestRoom

class_name StorageRoom

var Quest = preload("res://levels/quest_room/quest.gd")
onready var completion_animation = get_node("Interactable/CompletionAnimationPlayer")

onready var quest = Quest.new("Get Repair Tools", false)

func _on_Entrance_body_entered(_body):
	emit_signal("player_entered", quest, $PlayerRespawn)

func _on_Interactable_interaction_complete():
	emit_signal("quest_complete", quest)
	pick_up_toolbox()

func pick_up_toolbox():
	completion_animation.play("get_toolbox")
	yield(completion_animation, "animation_finished")
	$Interactable.queue_free()
