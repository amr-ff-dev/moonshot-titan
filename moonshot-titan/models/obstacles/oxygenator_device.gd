extends StaticBody2D

signal interaction_complete()

func _on_Interactable_interaction_complete():
	emit_signal("interaction_complete")
