extends KinematicBody2D

signal shoot(Projectile, origin, target)

export (int) var speed = 200

var RepulsorProjectile = preload("res://models/repulsor_projectile/repulsor_projectile.tscn")

func _physics_process(delta):
	move_and_collide(get_normalized_input_vector() * delta * speed)

func _input(event):
	if event.is_action_pressed("shoot"):
		emit_signal("shoot", RepulsorProjectile, position, get_global_mouse_position())

func get_normalized_input_vector():
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input_vector.normalized()
