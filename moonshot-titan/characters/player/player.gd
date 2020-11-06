extends KinematicBody2D

signal shoot(Projectile, origin, direction)

export(int) var speed = 200
export(float, 0, 1, 0.1) var accelerate = 0.2

var RepulsorProjectile = preload("res://models/repulsor_projectile/repulsor_projectile.tscn")

var velocity = Vector2.ZERO
var desired_velocity = Vector2.ZERO
var recoiling = false

func _physics_process(delta):
	velocity = velocity.linear_interpolate(desired_velocity, accelerate)
	var collision = move_and_collide(velocity * delta)
	if collision and collision.collider.get_collision_layer() == Titan.CollisionLayers.WALL:
		velocity = Vector2.ZERO
		desired_velocity = Vector2.ZERO
		recoiling = false

func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()
	else:
		update_desired_velocity()

func update_desired_velocity():
	if recoiling:
		return
	desired_velocity = get_normalized_input_vector() * speed

func get_normalized_input_vector():
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input_vector.normalized()

func shoot():
	var target = get_global_mouse_position()
	var direction_to_target = position.direction_to(target).normalized()
	var projectile = RepulsorProjectile.instance()
	
	emit_signal("shoot", projectile, position, direction_to_target)
	
	desired_velocity = -direction_to_target * projectile.speed
	recoiling = true
