extends KinematicBody2D

export (int) var speed = 350

var direction = Vector2.ZERO

func _physics_process(delta):
	var collision_info = move_and_collide(direction * delta * speed)
	if collision_info:
		if collision_info.collider.get_collision_layer() == Titan.CollisionLayers.ENEMY:
			collision_info.collider.free()
		queue_free()

func launch(origin, direction):
	position = origin
	rotation = Vector2.RIGHT.angle_to(direction)
	self.direction = direction
