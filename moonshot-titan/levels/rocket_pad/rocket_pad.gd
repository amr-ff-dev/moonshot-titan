extends QuestRoom

class_name RocketPad

signal game_finished()

onready var interactable = $Interactable
onready var rocket = $Rocket

func _init().("Launch the Rocket"):
	pass

func _on_Entrance_body_entered(_body):
	interactable.enabled = quest.active

func _on_Interactable_interaction_complete():
	rocket.launch()
	emit_quest_complete()

func _on_Rocket_game_finished():
	emit_signal("game_finished")
