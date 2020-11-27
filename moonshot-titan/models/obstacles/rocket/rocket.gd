extends KinematicBody2D

signal game_finished()

onready var completion_animation = $AnimationPlayer

func launch():
	completion_animation.play("launch_rocket")
	yield(completion_animation, "animation_finished")
	queue_free()
	emit_signal("game_finished")
