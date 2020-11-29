extends QuestRoom

class_name MedicalBay

onready var completion_animation = $Engineer.get_node("EngineerAnimation")
onready var entrance = $Entrance

func _init().("Rescue the Engineer"):
	pass

func _on_Entrance_player_entered(_player):
	emit_player_entered($PlayerRespawn)
	emit_quest_active()

func _on_Interactable_interaction_complete():
	emit_quest_complete()
	$Interactable.queue_free()
	completion_animation.play("display_quest_text")
	yield(completion_animation, "animation_finished")
	completion_animation.play("run_to_rocket")

func finish_room():
	.finish_room()

func open_door_permanently():
	entrance.open_permanently()
