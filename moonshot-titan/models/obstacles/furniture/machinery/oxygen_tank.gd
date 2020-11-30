extends StaticBody2D

onready var hazard = $Fire

func _on_Interactable_interaction_complete():
	hazard.visible = true
	hazard.set_collision_layer(Titan.CollisionLayers.HAZARD)
	$Interactable.queue_free()
