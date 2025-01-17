extends QuestRoom

class_name StorageRoom

onready var completion_animation = get_node("Interactable/CompletionAnimationPlayer")
onready var entrance = $Entrance

func _init().("Get Repair Tools"):
	pass

func _on_Entrance_player_entered(_player):
	emit_player_entered($PlayerRespawn)
	emit_quest_active()

func _on_Interactable_interaction_complete():
	emit_quest_complete()
	pick_up_toolbox()

func pick_up_toolbox():
	completion_animation.play("get_toolbox")
	yield(completion_animation, "animation_finished")
	$Interactable.queue_free()

func finish_room():
	.finish_room()
	entrance.open_permanently()
