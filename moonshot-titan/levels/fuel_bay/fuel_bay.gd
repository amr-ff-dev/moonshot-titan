extends QuestRoom

onready var entrance = $Entrance

func _init().("Fuel the Rocket"):
	pass

func _on_Entrance_player_entered(_player):
	emit_player_entered($PlayerRespawn)
	emit_quest_active()

func _on_Interactable_interaction_complete():
	emit_quest_complete()
	$Interactable.queue_free()
	# TODO: Remove finish_room when room is fleshed out
	finish_room() 

func finish_room():
	.finish_room()
	entrance.open_permanently()


func _on_SuitLocker_locker_interaction_complete(texture):
	pass # Replace with function body.
