extends KinematicBody2D

onready var completion_animation = $AnimationPlayer

func launch():
	completion_animation.play("launch_rocket")
	yield(completion_animation, "animation_finished")
	queue_free()
