extends KinematicBody2D

export(int) var speed = 100

var target = null

func _physics_process(delta):
	move_and_slide(get_chasing_velocity(target))

func _on_PlayerDetection_chase(body):
	target = body

func _on_PlayerDetection_stop_chase():
	target = null

func get_chasing_velocity(target):
	if target:
		return position.direction_to(target.position) * speed
	else:
		return Vector2.ZERO
