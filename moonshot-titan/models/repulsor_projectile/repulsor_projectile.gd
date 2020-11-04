extends KinematicBody2D

export (int) var speed = 350

var normalized_direction = Vector2.ZERO

func _physics_process(delta):
	var collision_info = move_and_collide(normalized_direction * delta * speed)
	if collision_info:
		if "Spider" == collision_info.collider.name:
			collision_info.collider.free()
		queue_free()

func launch(origin, target):
	position = origin
	rotation = target.angle_to_point(origin)
	normalized_direction = position.direction_to(target).normalized()
