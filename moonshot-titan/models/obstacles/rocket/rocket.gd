extends KinematicBody2D

onready var completion_animation = $AnimationPlayer

func _on_Interactable_interaction_complete():
	completion_animation.play("launch_rocket")
	yield(completion_animation, "animation_finished")
