extends KinematicBody2D

signal shoot(Projectile, origin, direction)

export (int) var movement_speed = 200

var RepulsorProjectile = preload("res://models/repulsor_projectile/repulsor_projectile.tscn")

var direction = Vector2.ZERO
var speed = 0
var recoiling = false

func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	if collision and collision.collider.get_collision_layer() == Titan.CollisionLayers.WALL:
		direction = Vector2.ZERO
		speed = 0
		recoiling = false

func _input(event):
	if !recoiling:
		direction = get_normalized_input_vector()
		speed = movement_speed
	if event.is_action_pressed("shoot"):
		shoot()

func get_normalized_input_vector():
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input_vector.normalized()

func shoot():
	var target = get_global_mouse_position()
	var direction = position.direction_to(target).normalized()
	var projectile = RepulsorProjectile.instance()
	
	emit_signal("shoot", projectile, position, direction)
	
	self.direction = -direction
	self.speed = projectile.speed
	self.recoiling = true
