extends KinematicBody2D

export (int) var speed = 350

var direction = Vector2.ZERO

func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		if collision.collider.get_collision_layer() == Titan.CollisionLayers.ENEMY:
			collision.collider.launch(direction * speed)
		queue_free()

func launch(origin, target_direction):
	position = origin + target_direction * get_length() * 0.5
	rotation = Vector2.RIGHT.angle_to(target_direction)
	direction = target_direction

func get_length():
	return $Sprite.texture.get_size().length()
