extends QuestRoom

class_name MedicalBay

onready var completion_animation = $Engineer.get_node("EngineerAnimation")

func _init().("Rescue the Engineer"):
	pass

func _on_Entrance_body_entered(_body):
	emit_player_entered($PlayerRespawn)
	emit_quest_active(quest)

func _on_Interactable_interaction_complete():
	emit_quest_complete(quest)
	$Interactable.queue_free()
	completion_animation.play("display_quest_text")
	yield(completion_animation, "animation_finished")
	completion_animation.play("run_to_rocket")
